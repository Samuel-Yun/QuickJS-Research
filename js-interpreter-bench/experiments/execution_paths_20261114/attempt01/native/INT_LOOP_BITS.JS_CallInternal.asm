
/home/wssy/workspace/QuickJS-Research/js-interpreter-bench/experiments/execution_paths_20261114/attempt01/work/INT_LOOP_BITS.release/qjs:     file format elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .plt.got:

Disassembly of section .plt.sec:

Disassembly of section .text:

0000000000025450 <JS_CallInternal>:
   25450:	55                   	push   %rbp
   25451:	48 89 e5             	mov    %rsp,%rbp
   25454:	41 57                	push   %r15
   25456:	49 89 ff             	mov    %rdi,%r15
   25459:	41 56                	push   %r14
   2545b:	41 55                	push   %r13
   2545d:	49 89 d5             	mov    %rdx,%r13
   25460:	41 54                	push   %r12
   25462:	49 89 f4             	mov    %rsi,%r12
   25465:	53                   	push   %rbx
   25466:	48 89 cb             	mov    %rcx,%rbx
   25469:	48 81 ec c8 02 00 00 	sub    $0x2c8,%rsp
   25470:	48 8b 45 10          	mov    0x10(%rbp),%rax
   25474:	48 89 b5 88 fe ff ff 	mov    %rsi,-0x178(%rbp)
   2547b:	48 89 b5 20 fe ff ff 	mov    %rsi,-0x1e0(%rbp)
   25482:	4c 89 c6             	mov    %r8,%rsi
   25485:	48 89 85 18 fe ff ff 	mov    %rax,-0x1e8(%rbp)
   2548c:	48 8b 45 18          	mov    0x18(%rbp),%rax
   25490:	48 89 95 28 fe ff ff 	mov    %rdx,-0x1d8(%rbp)
   25497:	48 89 85 38 fe ff ff 	mov    %rax,-0x1c8(%rbp)
   2549e:	48 8b 45 20          	mov    0x20(%rbp),%rax
   254a2:	48 89 8d 10 fe ff ff 	mov    %rcx,-0x1f0(%rbp)
   254a9:	4c 89 85 30 fe ff ff 	mov    %r8,-0x1d0(%rbp)
   254b0:	44 89 8d 60 fe ff ff 	mov    %r9d,-0x1a0(%rbp)
   254b7:	48 89 85 50 fe ff ff 	mov    %rax,-0x1b0(%rbp)
   254be:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
   254c5:	00 00 
   254c7:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
   254cb:	48 8b 47 10          	mov    0x10(%rdi),%rax
   254cf:	48 89 85 68 fe ff ff 	mov    %rax,-0x198(%rbp)
   254d6:	8b 87 a8 01 00 00    	mov    0x1a8(%rdi),%eax
   254dc:	83 e8 01             	sub    $0x1,%eax
   254df:	89 87 a8 01 00 00    	mov    %eax,0x1a8(%rdi)
   254e5:	85 c0                	test   %eax,%eax
   254e7:	0f 8e c3 05 00 00    	jle    25ab0 <JS_CallInternal+0x660>
   254ed:	41 83 fd ff          	cmp    $0xffffffff,%r13d
   254f1:	0f 85 11 06 00 00    	jne    25b08 <JS_CallInternal+0x6b8>
   254f7:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   254fe:	0f b7 40 12          	movzwl 0x12(%rax),%eax
   25502:	66 83 f8 0d          	cmp    $0xd,%ax
   25506:	0f 85 26 08 00 00    	jne    25d32 <JS_CallInternal+0x8e2>
   2550c:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   25513:	48 8b 40 28          	mov    0x28(%rax),%rax
   25517:	48 89 85 70 fe ff ff 	mov    %rax,-0x190(%rbp)
   2551e:	44 0f b7 40 38       	movzwl 0x38(%rax),%r8d
   25523:	44 3b 85 60 fe ff ff 	cmp    -0x1a0(%rbp),%r8d
   2552a:	0f 8f f6 01 00 00    	jg     25726 <JS_CallInternal+0x2d6>
   25530:	8b 45 28             	mov    0x28(%rbp),%eax
   25533:	83 e0 02             	and    $0x2,%eax
   25536:	41 0f 45 c0          	cmovne %r8d,%eax
   2553a:	48 8b bd 70 fe ff ff 	mov    -0x190(%rbp),%rdi
   25541:	4c 8b b5 68 fe ff ff 	mov    -0x198(%rbp),%r14
   25548:	44 0f b7 57 3a       	movzwl 0x3a(%rdi),%r10d
   2554d:	0f b7 77 3e          	movzwl 0x3e(%rdi),%esi
   25551:	0f b7 57 40          	movzwl 0x40(%rdi),%edx
   25555:	48 89 ef             	mov    %rbp,%rdi
   25558:	48 89 f1             	mov    %rsi,%rcx
   2555b:	44 01 d6             	add    %r10d,%esi
   2555e:	4c 89 d3             	mov    %r10,%rbx
   25561:	01 c6                	add    %eax,%esi
   25563:	49 89 d1             	mov    %rdx,%r9
   25566:	48 63 f6             	movslq %esi,%rsi
   25569:	48 8d 34 72          	lea    (%rdx,%rsi,2),%rsi
   2556d:	48 c1 e6 03          	shl    $0x3,%rsi
   25571:	48 29 f7             	sub    %rsi,%rdi
   25574:	49 3b be d0 04 00 00 	cmp    0x4d0(%r14),%rdi
   2557b:	0f 82 4f 08 00 00    	jb     25dd0 <JS_CallInternal+0x980>
   25581:	48 8b bd 70 fe ff ff 	mov    -0x190(%rbp),%rdi
   25588:	48 83 c6 17          	add    $0x17,%rsi
   2558c:	49 89 f3             	mov    %rsi,%r11
   2558f:	0f b6 7f 10          	movzbl 0x10(%rdi),%edi
   25593:	49 81 e3 00 f0 ff ff 	and    $0xfffffffffffff000,%r11
   2559a:	4c 89 a5 08 ff ff ff 	mov    %r12,-0xf8(%rbp)
   255a1:	4c 89 ad 10 ff ff ff 	mov    %r13,-0xf0(%rbp)
   255a8:	89 bd 3c ff ff ff    	mov    %edi,-0xc4(%rbp)
   255ae:	8b bd 60 fe ff ff    	mov    -0x1a0(%rbp),%edi
   255b4:	89 bd 38 ff ff ff    	mov    %edi,-0xc8(%rbp)
   255ba:	48 8b bd 88 fe ff ff 	mov    -0x178(%rbp),%rdi
   255c1:	48 8b 7f 30          	mov    0x30(%rdi),%rdi
   255c5:	48 89 bd 48 fe ff ff 	mov    %rdi,-0x1b8(%rbp)
   255cc:	48 89 e7             	mov    %rsp,%rdi
   255cf:	4c 29 df             	sub    %r11,%rdi
   255d2:	48 39 fc             	cmp    %rdi,%rsp
   255d5:	74 15                	je     255ec <JS_CallInternal+0x19c>
   255d7:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
   255de:	48 83 8c 24 f8 0f 00 	orq    $0x0,0xff8(%rsp)
   255e5:	00 00 
   255e7:	48 39 fc             	cmp    %rdi,%rsp
   255ea:	75 eb                	jne    255d7 <JS_CallInternal+0x187>
   255ec:	81 e6 f0 0f 00 00    	and    $0xff0,%esi
   255f2:	48 29 f4             	sub    %rsi,%rsp
   255f5:	48 85 f6             	test   %rsi,%rsi
   255f8:	74 06                	je     25600 <JS_CallInternal+0x1b0>
   255fa:	48 83 4c 34 f8 00    	orq    $0x0,-0x8(%rsp,%rsi,1)
   25600:	48 8b b5 50 fe ff ff 	mov    -0x1b0(%rbp),%rsi
   25607:	48 8d 7c 24 0f       	lea    0xf(%rsp),%rdi
   2560c:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
   25610:	48 89 bd e0 fd ff ff 	mov    %rdi,-0x220(%rbp)
   25617:	48 89 b5 40 fe ff ff 	mov    %rsi,-0x1c0(%rbp)
   2561e:	85 c0                	test   %eax,%eax
   25620:	0f 85 40 65 00 00    	jne    2bb66 <JS_CallInternal+0x6716>
   25626:	48 98                	cltq
   25628:	48 c1 e0 04          	shl    $0x4,%rax
   2562c:	48 01 f8             	add    %rdi,%rax
   2562f:	48 89 85 58 fe ff ff 	mov    %rax,-0x1a8(%rbp)
   25636:	48 89 85 20 ff ff ff 	mov    %rax,-0xe0(%rbp)
   2563d:	48 8b 85 40 fe ff ff 	mov    -0x1c0(%rbp),%rax
   25644:	48 89 85 18 ff ff ff 	mov    %rax,-0xe8(%rbp)
   2564b:	45 85 d2             	test   %r10d,%r10d
   2564e:	74 48                	je     25698 <JS_CallInternal+0x248>
   25650:	48 8b bd 58 fe ff ff 	mov    -0x1a8(%rbp),%rdi
   25657:	48 89 de             	mov    %rbx,%rsi
   2565a:	48 c1 e6 04          	shl    $0x4,%rsi
   2565e:	48 89 f8             	mov    %rdi,%rax
   25661:	48 01 fe             	add    %rdi,%rsi
   25664:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   2566a:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   25671:	00 00 00 00 
   25675:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2567c:	00 00 00 00 
   25680:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
   25687:	48 83 c0 10          	add    $0x10,%rax
   2568b:	48 c7 40 f8 03 00 00 	movq   $0x3,-0x8(%rax)
   25692:	00 
   25693:	48 39 f0             	cmp    %rsi,%rax
   25696:	75 e8                	jne    25680 <JS_CallInternal+0x230>
   25698:	48 c1 e3 04          	shl    $0x4,%rbx
   2569c:	48 c1 e1 04          	shl    $0x4,%rcx
   256a0:	48 03 9d 58 fe ff ff 	add    -0x1a8(%rbp),%rbx
   256a7:	48 8d 3c 0b          	lea    (%rbx,%rcx,1),%rdi
   256ab:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
   256b2:	66 45 85 c9          	test   %r9w,%r9w
   256b6:	74 0b                	je     256c3 <JS_CallInternal+0x273>
   256b8:	48 c1 e2 03          	shl    $0x3,%rdx
   256bc:	31 f6                	xor    %esi,%esi
   256be:	e8 9d c1 fe ff       	call   11860 <memset@plt>
   256c3:	48 8b bd 68 fe ff ff 	mov    -0x198(%rbp),%rdi
   256ca:	48 8b 8d 70 fe ff ff 	mov    -0x190(%rbp),%rcx
   256d1:	48 89 9d 08 fe ff ff 	mov    %rbx,-0x1f8(%rbp)
   256d8:	48 8b 97 f0 04 00 00 	mov    0x4f0(%rdi),%rdx
   256df:	48 8b 41 18          	mov    0x18(%rcx),%rax
   256e3:	4c 8b 69 48          	mov    0x48(%rcx),%r13
   256e7:	48 8b 8d 88 fe ff ff 	mov    -0x178(%rbp),%rcx
   256ee:	48 89 95 00 ff ff ff 	mov    %rdx,-0x100(%rbp)
   256f5:	48 8d 95 00 ff ff ff 	lea    -0x100(%rbp),%rdx
   256fc:	48 89 97 f0 04 00 00 	mov    %rdx,0x4f0(%rdi)
   25703:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   2570a:	48 89 95 80 fe ff ff 	mov    %rdx,-0x180(%rbp)
   25711:	4c 8d 60 01          	lea    0x1(%rax),%r12
   25715:	0f b6 00             	movzbl (%rax),%eax
   25718:	4c 8d 35 21 56 0e 00 	lea    0xe5621(%rip),%r14        # 10ad40 <dispatch_table.86>
   2571f:	49 89 c2             	mov    %rax,%r10
   25722:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   25726:	44 89 c0             	mov    %r8d,%eax
   25729:	e9 0c fe ff ff       	jmp    2553a <JS_CallInternal+0xea>
   2572e:	f3 0f 1e fa          	endbr64
   25732:	0f 1f 00             	nopl   (%rax)
   25735:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2573c:	00 00 00 00 
   25740:	f3 0f 1e fa          	endbr64
   25744:	41 8d 82 4d ff ff ff 	lea    -0xb3(%r10),%eax
   2574b:	48 c7 43 08 00 00 00 	movq   $0x0,0x8(%rbx)
   25752:	00 
   25753:	49 83 c4 01          	add    $0x1,%r12
   25757:	48 83 c3 10          	add    $0x10,%rbx
   2575b:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2575f:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   25765:	49 89 c2             	mov    %rax,%r10
   25768:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2576c:	ff e0                	jmp    *%rax
   2576e:	f3 0f 1e fa          	endbr64
   25772:	0f 1f 00             	nopl   (%rax)
   25775:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2577c:	00 00 00 00 
   25780:	f3 0f 1e fa          	endbr64
   25784:	41 8b 44 24 04       	mov    0x4(%r12),%eax
   25789:	4d 8d 5c 24 09       	lea    0x9(%r12),%r11
   2578e:	41 8b 0c 24          	mov    (%r12),%ecx
   25792:	4c 89 ef             	mov    %r13,%rdi
   25795:	f3 0f 6f 5b f0       	movdqu -0x10(%rbx),%xmm3
   2579a:	4c 89 9d e8 fd ff ff 	mov    %r11,-0x218(%rbp)
   257a1:	89 85 a8 fd ff ff    	mov    %eax,-0x258(%rbp)
   257a7:	41 0f b6 44 24 08    	movzbl 0x8(%r12),%eax
   257ad:	0f 29 9d f0 fd ff ff 	movaps %xmm3,-0x210(%rbp)
   257b4:	48 8b 95 f8 fd ff ff 	mov    -0x208(%rbp),%rdx
   257bb:	88 85 d0 fd ff ff    	mov    %al,-0x230(%rbp)
   257c1:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   257c8:	44 89 95 c0 fd ff ff 	mov    %r10d,-0x240(%rbp)
   257cf:	49 89 d4             	mov    %rdx,%r12
   257d2:	4c 89 58 30          	mov    %r11,0x30(%rax)
   257d6:	48 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%rax
   257dd:	89 8d b0 fd ff ff    	mov    %ecx,-0x250(%rbp)
   257e3:	48 89 c6             	mov    %rax,%rsi
   257e6:	48 89 85 a0 fd ff ff 	mov    %rax,-0x260(%rbp)
   257ed:	e8 ee ae 04 00       	call   706e0 <JS_HasProperty>
   257f2:	4c 8b 9d e8 fd ff ff 	mov    -0x218(%rbp),%r11
   257f9:	85 c0                	test   %eax,%eax
   257fb:	0f 88 36 08 00 00    	js     26037 <JS_CallInternal+0xbe7>
   25801:	0f 84 b7 64 00 00    	je     2bcbe <JS_CallInternal+0x686e>
   25807:	80 bd d0 fd ff ff 00 	cmpb   $0x0,-0x230(%rbp)
   2580e:	44 8b 95 c0 fd ff ff 	mov    -0x240(%rbp),%r10d
   25815:	0f 85 4f 06 00 00    	jne    25e6a <JS_CallInternal+0xa1a>
   2581b:	41 83 ea 71          	sub    $0x71,%r10d
   2581f:	41 83 fa 04          	cmp    $0x4,%r10d
   25823:	0f 87 7f 05 00 00    	ja     25da8 <JS_CallInternal+0x958>
   25829:	48 8d 15 94 d9 0b 00 	lea    0xbd994(%rip),%rdx        # e31c4 <qjsc_repl_size+0x4b8>
   25830:	4a 63 04 92          	movslq (%rdx,%r10,4),%rax
   25834:	48 01 d0             	add    %rdx,%rax
   25837:	3e ff e0             	notrack jmp *%rax
   2583a:	f3 0f 1e fa          	endbr64
   2583e:	f3 0f 1e fa          	endbr64
   25842:	4c 89 a5 f0 fd ff ff 	mov    %r12,-0x210(%rbp)
   25849:	45 8d 8a 14 ff ff ff 	lea    -0xec(%r10),%r9d
   25850:	4d 63 e1             	movslq %r9d,%r12
   25853:	48 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%rcx
   2585a:	49 89 db             	mov    %rbx,%r11
   2585d:	4c 89 ef             	mov    %r13,%rdi
   25860:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   25867:	49 c1 e4 04          	shl    $0x4,%r12
   2586b:	44 89 95 c0 fd ff ff 	mov    %r10d,-0x240(%rbp)
   25872:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   25878:	4d 29 e3             	sub    %r12,%r11
   2587b:	49 8b 73 f0          	mov    -0x10(%r11),%rsi
   2587f:	49 8b 53 f8          	mov    -0x8(%r11),%rdx
   25883:	48 89 48 30          	mov    %rcx,0x30(%rax)
   25887:	31 c9                	xor    %ecx,%ecx
   25889:	6a 00                	push   $0x0
   2588b:	41 53                	push   %r11
   2588d:	4c 89 9d d0 fd ff ff 	mov    %r11,-0x230(%rbp)
   25894:	6a 03                	push   $0x3
   25896:	6a 00                	push   $0x0
   25898:	44 89 8d e8 fd ff ff 	mov    %r9d,-0x218(%rbp)
   2589f:	e8 ac fb ff ff       	call   25450 <JS_CallInternal>
   258a4:	48 83 c4 20          	add    $0x20,%rsp
   258a8:	44 8b 8d e8 fd ff ff 	mov    -0x218(%rbp),%r9d
   258af:	4c 8b 9d d0 fd ff ff 	mov    -0x230(%rbp),%r11
   258b6:	83 fa 06             	cmp    $0x6,%edx
   258b9:	49 89 c0             	mov    %rax,%r8
   258bc:	48 89 d0             	mov    %rdx,%rax
   258bf:	0f 84 63 69 00 00    	je     2c228 <JS_CallInternal+0x6dd8>
   258c5:	4c 89 c1             	mov    %r8,%rcx
   258c8:	83 bd c0 fd ff ff 23 	cmpl   $0x23,-0x240(%rbp)
   258cf:	0f 84 ff 02 00 00    	je     25bd4 <JS_CallInternal+0x784>
   258d5:	4d 01 dc             	add    %r11,%r12
   258d8:	45 85 c9             	test   %r9d,%r9d
   258db:	0f 88 aa 00 00 00    	js     2598b <JS_CallInternal+0x53b>
   258e1:	48 89 9d c0 fd ff ff 	mov    %rbx,-0x240(%rbp)
   258e8:	49 8d 5b f0          	lea    -0x10(%r11),%rbx
   258ec:	4c 89 85 b0 fd ff ff 	mov    %r8,-0x250(%rbp)
   258f3:	4d 89 e8             	mov    %r13,%r8
   258f6:	45 89 cd             	mov    %r9d,%r13d
   258f9:	48 89 95 d0 fd ff ff 	mov    %rdx,-0x230(%rbp)
   25900:	eb 27                	jmp    25929 <JS_CallInternal+0x4d9>
   25902:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   25909:	00 
   2590a:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   25911:	00 00 00 00 
   25915:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2591c:	00 00 00 00 
   25920:	48 83 c3 10          	add    $0x10,%rbx
   25924:	4c 39 e3             	cmp    %r12,%rbx
   25927:	74 47                	je     25970 <JS_CallInternal+0x520>
   25929:	48 8b 53 08          	mov    0x8(%rbx),%rdx
   2592d:	83 fa f6             	cmp    $0xfffffff6,%edx
   25930:	76 ee                	jbe    25920 <JS_CallInternal+0x4d0>
   25932:	48 8b 33             	mov    (%rbx),%rsi
   25935:	8b 46 fc             	mov    -0x4(%rsi),%eax
   25938:	83 e8 01             	sub    $0x1,%eax
   2593b:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2593e:	85 c0                	test   %eax,%eax
   25940:	7f de                	jg     25920 <JS_CallInternal+0x4d0>
   25942:	49 8b 78 10          	mov    0x10(%r8),%rdi
   25946:	48 83 c3 10          	add    $0x10,%rbx
   2594a:	4c 89 85 e8 fd ff ff 	mov    %r8,-0x218(%rbp)
   25951:	e8 4a 90 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   25956:	4c 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%r8
   2595d:	4c 39 e3             	cmp    %r12,%rbx
   25960:	75 c7                	jne    25929 <JS_CallInternal+0x4d9>
   25962:	0f 1f 00             	nopl   (%rax)
   25965:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2596c:	00 00 00 00 
   25970:	45 89 e9             	mov    %r13d,%r9d
   25973:	48 8b 85 d0 fd ff ff 	mov    -0x230(%rbp),%rax
   2597a:	4d 89 c5             	mov    %r8,%r13
   2597d:	48 8b 9d c0 fd ff ff 	mov    -0x240(%rbp),%rbx
   25984:	4c 8b 85 b0 fd ff ff 	mov    -0x250(%rbp),%r8
   2598b:	41 83 c1 01          	add    $0x1,%r9d
   2598f:	4d 63 c9             	movslq %r9d,%r9
   25992:	49 c1 e1 04          	shl    $0x4,%r9
   25996:	4c 29 cb             	sub    %r9,%rbx
   25999:	48 89 da             	mov    %rbx,%rdx
   2599c:	48 8d 5b 10          	lea    0x10(%rbx),%rbx
   259a0:	48 89 42 08          	mov    %rax,0x8(%rdx)
   259a4:	48 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%rax
   259ab:	4c 89 02             	mov    %r8,(%rdx)
   259ae:	4c 8d 60 01          	lea    0x1(%rax),%r12
   259b2:	0f b6 00             	movzbl (%rax),%eax
   259b5:	49 89 c2             	mov    %rax,%r10
   259b8:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   259bc:	f3 0f 1e fa          	endbr64
   259c0:	f3 0f 1e fa          	endbr64
   259c4:	41 8b 04 24          	mov    (%r12),%eax
   259c8:	49 8d 4c 24 06       	lea    0x6(%r12),%rcx
   259cd:	31 f6                	xor    %esi,%esi
   259cf:	ba 02 00 00 00       	mov    $0x2,%edx
   259d4:	48 89 8d b0 fd ff ff 	mov    %rcx,-0x250(%rbp)
   259db:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   259df:	4c 89 ef             	mov    %r13,%rdi
   259e2:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   259e8:	41 0f b7 44 24 04    	movzwl 0x4(%r12),%eax
   259ee:	48 89 8d e8 fd ff ff 	mov    %rcx,-0x218(%rbp)
   259f5:	b9 01 00 00 00       	mov    $0x1,%ecx
   259fa:	44 89 95 c0 fd ff ff 	mov    %r10d,-0x240(%rbp)
   25a01:	66 89 85 d0 fd ff ff 	mov    %ax,-0x230(%rbp)
   25a08:	e8 63 58 02 00       	call   4b270 <JS_NewObjectProtoClass>
   25a0d:	48 89 03             	mov    %rax,(%rbx)
   25a10:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   25a14:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   25a18:	0f 84 49 02 00 00    	je     25c67 <JS_CallInternal+0x817>
   25a1e:	44 8b 95 c0 fd ff ff 	mov    -0x240(%rbp),%r10d
   25a25:	41 83 fa 78          	cmp    $0x78,%r10d
   25a29:	0f 85 0d 02 00 00    	jne    25c3c <JS_CallInternal+0x7ec>
   25a2f:	0f b7 85 d0 fd ff ff 	movzwl -0x230(%rbp),%eax
   25a36:	48 8b 8d 48 fe ff ff 	mov    -0x1b8(%rbp),%rcx
   25a3d:	4c 8b 04 c1          	mov    (%rcx,%rax,8),%r8
   25a41:	41 83 40 fc 01       	addl   $0x1,-0x4(%r8)
   25a46:	48 8b 33             	mov    (%rbx),%rsi
   25a49:	8b 95 f0 fd ff ff    	mov    -0x210(%rbp),%edx
   25a4f:	b9 22 00 00 00       	mov    $0x22,%ecx
   25a54:	4c 89 ef             	mov    %r13,%rdi
   25a57:	4c 89 85 d0 fd ff ff 	mov    %r8,-0x230(%rbp)
   25a5e:	e8 7d 4c 02 00       	call   4a6e0 <add_property>
   25a63:	4c 8b 85 d0 fd ff ff 	mov    -0x230(%rbp),%r8
   25a6a:	48 85 c0             	test   %rax,%rax
   25a6d:	0f 84 4e 9a 00 00    	je     2f4c1 <JS_CallInternal+0xa071>
   25a73:	4c 89 00             	mov    %r8,(%rax)
   25a76:	8b b5 f0 fd ff ff    	mov    -0x210(%rbp),%esi
   25a7c:	31 d2                	xor    %edx,%edx
   25a7e:	4c 89 ef             	mov    %r13,%rdi
   25a81:	48 83 c3 20          	add    $0x20,%rbx
   25a85:	49 83 c4 07          	add    $0x7,%r12
   25a89:	e8 b2 66 01 00       	call   3c140 <__JS_AtomToValue>
   25a8e:	48 8b 8d e8 fd ff ff 	mov    -0x218(%rbp),%rcx
   25a95:	48 89 01             	mov    %rax,(%rcx)
   25a98:	48 89 51 08          	mov    %rdx,0x8(%rcx)
   25a9c:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   25aa2:	49 89 c2             	mov    %rax,%r10
   25aa5:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   25aa9:	ff e0                	jmp    *%rax
   25aab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   25ab0:	48 89 8d 70 fe ff ff 	mov    %rcx,-0x190(%rbp)
   25ab7:	4c 89 85 78 fe ff ff 	mov    %r8,-0x188(%rbp)
   25abe:	e8 9d 0d 01 00       	call   36860 <__js_poll_interrupts>
   25ac3:	48 8b 9d 70 fe ff ff 	mov    -0x190(%rbp),%rbx
   25aca:	48 8b b5 78 fe ff ff 	mov    -0x188(%rbp),%rsi
   25ad1:	85 c0                	test   %eax,%eax
   25ad3:	0f 84 14 fa ff ff    	je     254ed <JS_CallInternal+0x9d>
   25ad9:	31 c0                	xor    %eax,%eax
   25adb:	ba 06 00 00 00       	mov    $0x6,%edx
   25ae0:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   25ae4:	64 48 2b 0c 25 28 00 	sub    %fs:0x28,%rcx
   25aeb:	00 00 
   25aed:	0f 85 17 aa 00 00    	jne    3050a <JS_CallInternal+0xb0ba>
   25af3:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
   25af7:	5b                   	pop    %rbx
   25af8:	41 5c                	pop    %r12
   25afa:	41 5d                	pop    %r13
   25afc:	41 5e                	pop    %r14
   25afe:	41 5f                	pop    %r15
   25b00:	5d                   	pop    %rbp
   25b01:	c3                   	ret
   25b02:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   25b08:	f6 45 28 04          	testb  $0x4,0x28(%rbp)
   25b0c:	0f 84 fe 03 00 00    	je     25f10 <JS_CallInternal+0xac0>
   25b12:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   25b19:	48 8b 48 58          	mov    0x58(%rax),%rcx
   25b1d:	48 8b 50 70          	mov    0x70(%rax),%rdx
   25b21:	48 8d 78 50          	lea    0x50(%rax),%rdi
   25b25:	48 8b 70 68          	mov    0x68(%rax),%rsi
   25b29:	48 89 bd 80 fe ff ff 	mov    %rdi,-0x180(%rbp)
   25b30:	48 8b 59 28          	mov    0x28(%rcx),%rbx
   25b34:	48 89 8d 00 fe ff ff 	mov    %rcx,-0x200(%rbp)
   25b3b:	48 8b 49 30          	mov    0x30(%rcx),%rcx
   25b3f:	48 89 95 58 fe ff ff 	mov    %rdx,-0x1a8(%rbp)
   25b46:	4c 8b 6b 48          	mov    0x48(%rbx),%r13
   25b4a:	48 89 9d 70 fe ff ff 	mov    %rbx,-0x190(%rbp)
   25b51:	48 89 8d 48 fe ff ff 	mov    %rcx,-0x1b8(%rbp)
   25b58:	48 89 c1             	mov    %rax,%rcx
   25b5b:	0f b7 43 3a          	movzwl 0x3a(%rbx),%eax
   25b5f:	4c 8b a1 80 00 00 00 	mov    0x80(%rcx),%r12
   25b66:	48 8b 99 90 00 00 00 	mov    0x90(%rcx),%rbx
   25b6d:	48 c7 81 90 00 00 00 	movq   $0x0,0x90(%rcx)
   25b74:	00 00 00 00 
   25b78:	48 c1 e0 04          	shl    $0x4,%rax
   25b7c:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
   25b83:	48 01 d0             	add    %rdx,%rax
   25b86:	48 8b 95 68 fe ff ff 	mov    -0x198(%rbp),%rdx
   25b8d:	48 89 85 08 fe ff ff 	mov    %rax,-0x1f8(%rbp)
   25b94:	48 8b 82 f0 04 00 00 	mov    0x4f0(%rdx),%rax
   25b9b:	48 89 41 50          	mov    %rax,0x50(%rcx)
   25b9f:	48 89 ba f0 04 00 00 	mov    %rdi,0x4f0(%rdx)
   25ba6:	8b 79 24             	mov    0x24(%rcx),%edi
   25ba9:	85 ff                	test   %edi,%edi
   25bab:	0f 84 aa 02 00 00    	je     25e5b <JS_CallInternal+0xa0b>
   25bb1:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
   25bb8:	48 89 85 40 fe ff ff 	mov    %rax,-0x1c0(%rbp)
   25bbf:	e9 bc 00 00 00       	jmp    25c80 <JS_CallInternal+0x830>
   25bc4:	f3 0f 1e fa          	endbr64
   25bc8:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   25bcc:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   25bd0:	48 83 eb 10          	sub    $0x10,%rbx
   25bd4:	48 8b bd 70 fe ff ff 	mov    -0x190(%rbp),%rdi
   25bdb:	66 83 7f 40 00       	cmpw   $0x0,0x40(%rdi)
   25be0:	0f 85 19 74 00 00    	jne    2cfff <JS_CallInternal+0x7baf>
   25be6:	4c 8b a5 e0 fd ff ff 	mov    -0x220(%rbp),%r12
   25bed:	49 39 dc             	cmp    %rbx,%r12
   25bf0:	0f 83 19 01 00 00    	jae    25d0f <JS_CallInternal+0x8bf>
   25bf6:	49 89 c6             	mov    %rax,%r14
   25bf9:	49 89 cf             	mov    %rcx,%r15
   25bfc:	eb 0f                	jmp    25c0d <JS_CallInternal+0x7bd>
   25bfe:	66 90                	xchg   %ax,%ax
   25c00:	49 83 c4 10          	add    $0x10,%r12
   25c04:	49 39 dc             	cmp    %rbx,%r12
   25c07:	0f 83 b8 01 00 00    	jae    25dc5 <JS_CallInternal+0x975>
   25c0d:	49 8b 74 24 08       	mov    0x8(%r12),%rsi
   25c12:	83 fe f6             	cmp    $0xfffffff6,%esi
   25c15:	76 e9                	jbe    25c00 <JS_CallInternal+0x7b0>
   25c17:	49 8b 14 24          	mov    (%r12),%rdx
   25c1b:	8b 42 fc             	mov    -0x4(%rdx),%eax
   25c1e:	83 e8 01             	sub    $0x1,%eax
   25c21:	89 42 fc             	mov    %eax,-0x4(%rdx)
   25c24:	85 c0                	test   %eax,%eax
   25c26:	7f d8                	jg     25c00 <JS_CallInternal+0x7b0>
   25c28:	48 89 d0             	mov    %rdx,%rax
   25c2b:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   25c2f:	48 89 f2             	mov    %rsi,%rdx
   25c32:	48 89 c6             	mov    %rax,%rsi
   25c35:	e8 66 8d ff ff       	call   1e9a0 <__JS_FreeValueRT>
   25c3a:	eb c4                	jmp    25c00 <JS_CallInternal+0x7b0>
   25c3c:	31 c9                	xor    %ecx,%ecx
   25c3e:	0f b7 95 d0 fd ff ff 	movzwl -0x230(%rbp),%edx
   25c45:	41 83 fa 77          	cmp    $0x77,%r10d
   25c49:	4c 89 ef             	mov    %r13,%rdi
   25c4c:	48 8b b5 80 fe ff ff 	mov    -0x180(%rbp),%rsi
   25c53:	0f 94 c1             	sete   %cl
   25c56:	e8 15 44 02 00       	call   4a070 <get_var_ref>
   25c5b:	49 89 c0             	mov    %rax,%r8
   25c5e:	48 85 c0             	test   %rax,%rax
   25c61:	0f 85 df fd ff ff    	jne    25a46 <JS_CallInternal+0x5f6>
   25c67:	48 8b 9d e8 fd ff ff 	mov    -0x218(%rbp),%rbx
   25c6e:	4c 8b a5 b0 fd ff ff 	mov    -0x250(%rbp),%r12
   25c75:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   25c7c:	00 00 00 00 
   25c80:	48 8b 85 68 fe ff ff 	mov    -0x198(%rbp),%rax
   25c87:	83 b8 e0 04 00 00 ff 	cmpl   $0xffffffff,0x4e0(%rax)
   25c8e:	75 41                	jne    25cd1 <JS_CallInternal+0x881>
   25c90:	48 8b 80 d8 04 00 00 	mov    0x4d8(%rax),%rax
   25c97:	66 83 78 12 03       	cmpw   $0x3,0x12(%rax)
   25c9c:	75 33                	jne    25cd1 <JS_CallInternal+0x881>
   25c9e:	48 8b 48 18          	mov    0x18(%rax),%rcx
   25ca2:	8b 51 18             	mov    0x18(%rcx),%edx
   25ca5:	89 d0                	mov    %edx,%eax
   25ca7:	83 e0 39             	and    $0x39,%eax
   25caa:	8b 44 81 38          	mov    0x38(%rcx,%rax,4),%eax
   25cae:	48 85 c0             	test   %rax,%rax
   25cb1:	0f 84 e9 6b 00 00    	je     2c8a0 <JS_CallInternal+0x7450>
   25cb7:	48 8d 14 95 3c 00 00 	lea    0x3c(,%rdx,4),%rdx
   25cbe:	00 
   25cbf:	48 8d 44 c2 f8       	lea    -0x8(%rdx,%rax,8),%rax
   25cc4:	48 01 c8             	add    %rcx,%rax
   25cc7:	83 78 04 39          	cmpl   $0x39,0x4(%rax)
   25ccb:	0f 85 c2 6b 00 00    	jne    2c893 <JS_CallInternal+0x7443>
   25cd1:	48 8b 85 68 fe ff ff 	mov    -0x198(%rbp),%rax
   25cd8:	80 b8 e8 04 00 00 00 	cmpb   $0x0,0x4e8(%rax)
   25cdf:	0f 84 48 01 00 00    	je     25e2d <JS_CallInternal+0x9dd>
   25ce5:	48 8b 85 70 fe ff ff 	mov    -0x190(%rbp),%rax
   25cec:	b9 00 00 00 00       	mov    $0x0,%ecx
   25cf1:	f6 40 11 30          	testb  $0x30,0x11(%rax)
   25cf5:	b8 06 00 00 00       	mov    $0x6,%eax
   25cfa:	0f 84 d4 fe ff ff    	je     25bd4 <JS_CallInternal+0x784>
   25d00:	48 8b bd 80 fe ff ff 	mov    -0x180(%rbp),%rdi
   25d07:	4c 89 67 30          	mov    %r12,0x30(%rdi)
   25d0b:	48 89 5f 40          	mov    %rbx,0x40(%rdi)
   25d0f:	48 8b 9d 80 fe ff ff 	mov    -0x180(%rbp),%rbx
   25d16:	48 8b 13             	mov    (%rbx),%rdx
   25d19:	48 8b 9d 68 fe ff ff 	mov    -0x198(%rbp),%rbx
   25d20:	48 89 93 f0 04 00 00 	mov    %rdx,0x4f0(%rbx)
   25d27:	48 89 c2             	mov    %rax,%rdx
   25d2a:	48 89 c8             	mov    %rcx,%rax
   25d2d:	e9 ae fd ff ff       	jmp    25ae0 <JS_CallInternal+0x690>
   25d32:	48 8b 8d 68 fe ff ff 	mov    -0x198(%rbp),%rcx
   25d39:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
   25d3d:	48 c1 e0 03          	shl    $0x3,%rax
   25d41:	48 03 81 58 04 00 00 	add    0x458(%rcx),%rax
   25d48:	48 8b 40 18          	mov    0x18(%rax),%rax
   25d4c:	48 85 c0             	test   %rax,%rax
   25d4f:	0f 84 bb 01 00 00    	je     25f10 <JS_CallInternal+0xac0>
   25d55:	48 89 d9             	mov    %rbx,%rcx
   25d58:	8b 5d 28             	mov    0x28(%rbp),%ebx
   25d5b:	49 89 f0             	mov    %rsi,%r8
   25d5e:	44 8b 8d 60 fe ff ff 	mov    -0x1a0(%rbp),%r9d
   25d65:	4c 89 e6             	mov    %r12,%rsi
   25d68:	4c 89 ea             	mov    %r13,%rdx
   25d6b:	4c 89 ff             	mov    %r15,%rdi
   25d6e:	53                   	push   %rbx
   25d6f:	ff b5 50 fe ff ff    	push   -0x1b0(%rbp)
   25d75:	ff d0                	call   *%rax
   25d77:	59                   	pop    %rcx
   25d78:	5e                   	pop    %rsi
   25d79:	e9 62 fd ff ff       	jmp    25ae0 <JS_CallInternal+0x690>
   25d7e:	8b b5 b0 fd ff ff    	mov    -0x250(%rbp),%esi
   25d84:	31 d2                	xor    %edx,%edx
   25d86:	4c 89 ef             	mov    %r13,%rdi
   25d89:	48 83 c3 10          	add    $0x10,%rbx
   25d8d:	4c 89 9d f0 fd ff ff 	mov    %r11,-0x210(%rbp)
   25d94:	e8 a7 63 01 00       	call   3c140 <__JS_AtomToValue>
   25d99:	4c 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%r11
   25da0:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   25da4:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   25da8:	8b 85 a8 fd ff ff    	mov    -0x258(%rbp),%eax
   25dae:	83 e8 05             	sub    $0x5,%eax
   25db1:	48 98                	cltq
   25db3:	49 01 c3             	add    %rax,%r11
   25db6:	41 0f b6 03          	movzbl (%r11),%eax
   25dba:	4d 8d 63 01          	lea    0x1(%r11),%r12
   25dbe:	49 89 c2             	mov    %rax,%r10
   25dc1:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   25dc5:	4c 89 f0             	mov    %r14,%rax
   25dc8:	4c 89 f9             	mov    %r15,%rcx
   25dcb:	e9 3f ff ff ff       	jmp    25d0f <JS_CallInternal+0x8bf>
   25dd0:	48 8d 35 f7 36 0b 00 	lea    0xb36f7(%rip),%rsi        # d94ce <_IO_stdin_used+0x4ce>
   25dd7:	4c 89 ff             	mov    %r15,%rdi
   25dda:	31 c0                	xor    %eax,%eax
   25ddc:	e8 bf 09 01 00       	call   367a0 <JS_ThrowInternalError>
   25de1:	e9 fa fc ff ff       	jmp    25ae0 <JS_CallInternal+0x690>
   25de6:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   25dea:	48 89 ce             	mov    %rcx,%rsi
   25ded:	4c 89 f2             	mov    %r14,%rdx
   25df0:	48 89 85 e8 fd ff ff 	mov    %rax,-0x218(%rbp)
   25df7:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   25dfe:	e8 9d 8b ff ff       	call   1e9a0 <__JS_FreeValueRT>
   25e03:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
   25e0a:	48 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%rcx
   25e11:	0f 1f 40 00          	nopl   0x0(%rax)
   25e15:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   25e1c:	00 00 00 00 
   25e20:	41 83 fe 05          	cmp    $0x5,%r14d
   25e24:	0f 84 2e 66 00 00    	je     2c458 <JS_CallInternal+0x7008>
   25e2a:	48 89 c3             	mov    %rax,%rbx
   25e2d:	48 39 9d 08 fe ff ff 	cmp    %rbx,-0x1f8(%rbp)
   25e34:	0f 83 ab fe ff ff    	jae    25ce5 <JS_CallInternal+0x895>
   25e3a:	4c 8b 73 f8          	mov    -0x8(%rbx),%r14
   25e3e:	48 8d 43 f0          	lea    -0x10(%rbx),%rax
   25e42:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   25e46:	41 83 fe f6          	cmp    $0xfffffff6,%r14d
   25e4a:	76 d4                	jbe    25e20 <JS_CallInternal+0x9d0>
   25e4c:	8b 79 fc             	mov    -0x4(%rcx),%edi
   25e4f:	8d 57 ff             	lea    -0x1(%rdi),%edx
   25e52:	89 51 fc             	mov    %edx,-0x4(%rcx)
   25e55:	85 d2                	test   %edx,%edx
   25e57:	7f c7                	jg     25e20 <JS_CallInternal+0x9d0>
   25e59:	eb 8b                	jmp    25de6 <JS_CallInternal+0x996>
   25e5b:	48 89 b5 40 fe ff ff 	mov    %rsi,-0x1c0(%rbp)
   25e62:	4c 89 e0             	mov    %r12,%rax
   25e65:	e9 a7 f8 ff ff       	jmp    25711 <JS_CallInternal+0x2c1>
   25e6a:	48 83 ec 08          	sub    $0x8,%rsp
   25e6e:	4d 89 e1             	mov    %r12,%r9
   25e71:	4c 89 e2             	mov    %r12,%rdx
   25e74:	4c 89 ef             	mov    %r13,%rdi
   25e77:	44 89 95 d0 fd ff ff 	mov    %r10d,-0x230(%rbp)
   25e7e:	4c 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8
   25e85:	b9 f1 00 00 00       	mov    $0xf1,%ecx
   25e8a:	6a 00                	push   $0x0
   25e8c:	48 8b b5 a0 fd ff ff 	mov    -0x260(%rbp),%rsi
   25e93:	e8 88 a7 00 00       	call   30620 <JS_GetPropertyInternal>
   25e98:	5e                   	pop    %rsi
   25e99:	4c 8b 9d e8 fd ff ff 	mov    -0x218(%rbp),%r11
   25ea0:	83 fa 06             	cmp    $0x6,%edx
   25ea3:	49 89 c0             	mov    %rax,%r8
   25ea6:	49 89 d4             	mov    %rdx,%r12
   25ea9:	5f                   	pop    %rdi
   25eaa:	0f 84 87 01 00 00    	je     26037 <JS_CallInternal+0xbe7>
   25eb0:	83 fa ff             	cmp    $0xffffffff,%edx
   25eb3:	44 8b 95 d0 fd ff ff 	mov    -0x230(%rbp),%r10d
   25eba:	0f 84 8b 5d 00 00    	je     2bc4b <JS_CallInternal+0x67fb>
   25ec0:	83 fa f6             	cmp    $0xfffffff6,%edx
   25ec3:	0f 86 52 f9 ff ff    	jbe    2581b <JS_CallInternal+0x3cb>
   25ec9:	8b 40 fc             	mov    -0x4(%rax),%eax
   25ecc:	83 e8 01             	sub    $0x1,%eax
   25ecf:	41 89 40 fc          	mov    %eax,-0x4(%r8)
   25ed3:	85 c0                	test   %eax,%eax
   25ed5:	0f 8f 40 f9 ff ff    	jg     2581b <JS_CallInternal+0x3cb>
   25edb:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   25edf:	4c 89 c6             	mov    %r8,%rsi
   25ee2:	44 89 95 d0 fd ff ff 	mov    %r10d,-0x230(%rbp)
   25ee9:	4c 89 9d e8 fd ff ff 	mov    %r11,-0x218(%rbp)
   25ef0:	e8 ab 8a ff ff       	call   1e9a0 <__JS_FreeValueRT>
   25ef5:	4c 8b 9d e8 fd ff ff 	mov    -0x218(%rbp),%r11
   25efc:	44 8b 95 d0 fd ff ff 	mov    -0x230(%rbp),%r10d
   25f03:	e9 13 f9 ff ff       	jmp    2581b <JS_CallInternal+0x3cb>
   25f08:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   25f0f:	00 
   25f10:	48 8d 35 8a 4c 0b 00 	lea    0xb4c8a(%rip),%rsi        # daba1 <_IO_stdin_used+0x1ba1>
   25f17:	4c 89 ff             	mov    %r15,%rdi
   25f1a:	31 c0                	xor    %eax,%eax
   25f1c:	e8 9f e6 00 00       	call   345c0 <JS_ThrowTypeError>
   25f21:	e9 ba fb ff ff       	jmp    25ae0 <JS_CallInternal+0x690>
   25f26:	48 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%rax
   25f2d:	48 8b 95 f8 fd ff ff 	mov    -0x208(%rbp),%rdx
   25f34:	4c 89 ef             	mov    %r13,%rdi
   25f37:	4c 89 9d d0 fd ff ff 	mov    %r11,-0x230(%rbp)
   25f3e:	8b 8d b0 fd ff ff    	mov    -0x250(%rbp),%ecx
   25f44:	48 89 c6             	mov    %rax,%rsi
   25f47:	48 89 95 e8 fd ff ff 	mov    %rdx,-0x218(%rbp)
   25f4e:	49 89 c4             	mov    %rax,%r12
   25f51:	e8 8a a7 04 00       	call   706e0 <JS_HasProperty>
   25f56:	4c 8b 9d d0 fd ff ff 	mov    -0x230(%rbp),%r11
   25f5d:	85 c0                	test   %eax,%eax
   25f5f:	0f 88 d2 00 00 00    	js     26037 <JS_CallInternal+0xbe7>
   25f65:	48 8b 95 e8 fd ff ff 	mov    -0x218(%rbp),%rdx
   25f6c:	b8 03 00 00 00       	mov    $0x3,%eax
   25f71:	b9 00 00 00 00       	mov    $0x0,%ecx
   25f76:	0f 85 c2 76 00 00    	jne    2d63e <JS_CallInternal+0x81ee>
   25f7c:	48 89 0b             	mov    %rcx,(%rbx)
   25f7f:	48 83 c3 10          	add    $0x10,%rbx
   25f83:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   25f87:	e9 1c fe ff ff       	jmp    25da8 <JS_CallInternal+0x958>
   25f8c:	48 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%rax
   25f93:	48 8b 95 f8 fd ff ff 	mov    -0x208(%rbp),%rdx
   25f9a:	4c 89 ef             	mov    %r13,%rdi
   25f9d:	4c 89 9d e8 fd ff ff 	mov    %r11,-0x218(%rbp)
   25fa4:	8b 8d b0 fd ff ff    	mov    -0x250(%rbp),%ecx
   25faa:	48 89 c6             	mov    %rax,%rsi
   25fad:	e8 2e a7 04 00       	call   706e0 <JS_HasProperty>
   25fb2:	4c 8b 9d e8 fd ff ff 	mov    -0x218(%rbp),%r11
   25fb9:	85 c0                	test   %eax,%eax
   25fbb:	0f 8e f6 92 00 00    	jle    2f2b7 <JS_CallInternal+0x9e67>
   25fc1:	48 83 ec 08          	sub    $0x8,%rsp
   25fc5:	4c 8b 43 e0          	mov    -0x20(%rbx),%r8
   25fc9:	4c 8b 4b e8          	mov    -0x18(%rbx),%r9
   25fcd:	4c 89 ef             	mov    %r13,%rdi
   25fd0:	4c 89 9d e8 fd ff ff 	mov    %r11,-0x218(%rbp)
   25fd7:	4c 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%r10
   25fde:	4c 8d 63 e0          	lea    -0x20(%rbx),%r12
   25fe2:	4c 8b 9d f8 fd ff ff 	mov    -0x208(%rbp),%r11
   25fe9:	68 00 80 00 00       	push   $0x8000
   25fee:	8b 8d b0 fd ff ff    	mov    -0x250(%rbp),%ecx
   25ff4:	4c 89 d6             	mov    %r10,%rsi
   25ff7:	41 53                	push   %r11
   25ff9:	4c 89 da             	mov    %r11,%rdx
   25ffc:	41 52                	push   %r10
   25ffe:	e8 6d b3 00 00       	call   31370 <JS_SetPropertyInternal>
   26003:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   26007:	48 83 c4 20          	add    $0x20,%rsp
   2600b:	4c 8b 9d e8 fd ff ff 	mov    -0x218(%rbp),%r11
   26012:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   26015:	76 15                	jbe    2602c <JS_CallInternal+0xbdc>
   26017:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2601b:	8b 5e fc             	mov    -0x4(%rsi),%ebx
   2601e:	8d 53 ff             	lea    -0x1(%rbx),%edx
   26021:	89 56 fc             	mov    %edx,-0x4(%rsi)
   26024:	85 d2                	test   %edx,%edx
   26026:	0f 8e b4 92 00 00    	jle    2f2e0 <JS_CallInternal+0x9e90>
   2602c:	4c 89 e3             	mov    %r12,%rbx
   2602f:	85 c0                	test   %eax,%eax
   26031:	0f 89 71 fd ff ff    	jns    25da8 <JS_CallInternal+0x958>
   26037:	4d 89 dc             	mov    %r11,%r12
   2603a:	e9 41 fc ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2603f:	48 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%rax
   26046:	48 8b 95 f8 fd ff ff 	mov    -0x208(%rbp),%rdx
   2604d:	4c 89 ef             	mov    %r13,%rdi
   26050:	4c 89 9d d0 fd ff ff 	mov    %r11,-0x230(%rbp)
   26057:	8b 8d b0 fd ff ff    	mov    -0x250(%rbp),%ecx
   2605d:	48 89 c6             	mov    %rax,%rsi
   26060:	48 89 95 e8 fd ff ff 	mov    %rdx,-0x218(%rbp)
   26067:	49 89 c4             	mov    %rax,%r12
   2606a:	e8 71 a6 04 00       	call   706e0 <JS_HasProperty>
   2606f:	48 8b 95 e8 fd ff ff 	mov    -0x218(%rbp),%rdx
   26076:	4c 8b 9d d0 fd ff ff 	mov    -0x230(%rbp),%r11
   2607d:	85 c0                	test   %eax,%eax
   2607f:	0f 8e 83 91 00 00    	jle    2f208 <JS_CallInternal+0x9db8>
   26085:	48 83 ec 08          	sub    $0x8,%rsp
   26089:	8b 8d b0 fd ff ff    	mov    -0x250(%rbp),%ecx
   2608f:	49 89 d1             	mov    %rdx,%r9
   26092:	4c 89 e6             	mov    %r12,%rsi
   26095:	4c 89 9d e8 fd ff ff 	mov    %r11,-0x218(%rbp)
   2609c:	4c 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8
   260a3:	4c 89 ef             	mov    %r13,%rdi
   260a6:	6a 00                	push   $0x0
   260a8:	e8 73 a5 00 00       	call   30620 <JS_GetPropertyInternal>
   260ad:	41 59                	pop    %r9
   260af:	4c 8b 9d e8 fd ff ff 	mov    -0x218(%rbp),%r11
   260b6:	83 fa 06             	cmp    $0x6,%edx
   260b9:	48 89 c1             	mov    %rax,%rcx
   260bc:	41 5a                	pop    %r10
   260be:	48 89 d0             	mov    %rdx,%rax
   260c1:	0f 84 70 ff ff ff    	je     26037 <JS_CallInternal+0xbe7>
   260c7:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   260cb:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   260cf:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   260d3:	48 89 4b f0          	mov    %rcx,-0x10(%rbx)
   260d7:	83 fa f6             	cmp    $0xfffffff6,%edx
   260da:	0f 86 c8 fc ff ff    	jbe    25da8 <JS_CallInternal+0x958>
   260e0:	8b 46 fc             	mov    -0x4(%rsi),%eax
   260e3:	83 e8 01             	sub    $0x1,%eax
   260e6:	89 46 fc             	mov    %eax,-0x4(%rsi)
   260e9:	85 c0                	test   %eax,%eax
   260eb:	0f 8f b7 fc ff ff    	jg     25da8 <JS_CallInternal+0x958>
   260f1:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   260f5:	4c 89 9d f0 fd ff ff 	mov    %r11,-0x210(%rbp)
   260fc:	e8 9f 88 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   26101:	4c 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%r11
   26108:	e9 9b fc ff ff       	jmp    25da8 <JS_CallInternal+0x958>
   2610d:	48 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%rax
   26114:	48 8b 95 f8 fd ff ff 	mov    -0x208(%rbp),%rdx
   2611b:	45 31 c0             	xor    %r8d,%r8d
   2611e:	4c 89 ef             	mov    %r13,%rdi
   26121:	8b 8d b0 fd ff ff    	mov    -0x250(%rbp),%ecx
   26127:	4c 89 9d e8 fd ff ff 	mov    %r11,-0x218(%rbp)
   2612e:	48 89 c6             	mov    %rax,%rsi
   26131:	e8 ba 82 02 00       	call   4e3f0 <JS_DeleteProperty>
   26136:	4c 8b 9d e8 fd ff ff 	mov    -0x218(%rbp),%r11
   2613d:	85 c0                	test   %eax,%eax
   2613f:	41 89 c4             	mov    %eax,%r12d
   26142:	0f 88 ef fe ff ff    	js     26037 <JS_CallInternal+0xbe7>
   26148:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2614c:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2614f:	76 15                	jbe    26166 <JS_CallInternal+0xd16>
   26151:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   26155:	8b 79 fc             	mov    -0x4(%rcx),%edi
   26158:	8d 57 ff             	lea    -0x1(%rdi),%edx
   2615b:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2615e:	85 d2                	test   %edx,%edx
   26160:	0f 8e a5 91 00 00    	jle    2f30b <JS_CallInternal+0x9ebb>
   26166:	31 c0                	xor    %eax,%eax
   26168:	45 85 e4             	test   %r12d,%r12d
   2616b:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   26172:	00 
   26173:	0f 95 c0             	setne  %al
   26176:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2617a:	e9 29 fc ff ff       	jmp    25da8 <JS_CallInternal+0x958>
   2617f:	f3 0f 1e fa          	endbr64
   26183:	f3 0f 1e fa          	endbr64
   26187:	41 0f b7 04 24       	movzwl (%r12),%eax
   2618c:	48 8b 8d 48 fe ff ff 	mov    -0x1b8(%rbp),%rcx
   26193:	4d 8d 5c 24 02       	lea    0x2(%r12),%r11
   26198:	48 8b 0c c1          	mov    (%rcx,%rax,8),%rcx
   2619c:	4c 8d 0c c5 00 00 00 	lea    0x0(,%rax,8),%r9
   261a3:	00 
   261a4:	48 8b 41 18          	mov    0x18(%rcx),%rax
   261a8:	48 8b 50 08          	mov    0x8(%rax),%rdx
   261ac:	83 fa 04             	cmp    $0x4,%edx
   261af:	0f 84 27 66 00 00    	je     2c7dc <JS_CallInternal+0x738c>
   261b5:	80 79 12 00          	cmpb   $0x0,0x12(%rcx)
   261b9:	0f 85 1d 66 00 00    	jne    2c7dc <JS_CallInternal+0x738c>
   261bf:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   261c4:	48 8b 08             	mov    (%rax),%rcx
   261c7:	0f 11 00             	movups %xmm0,(%rax)
   261ca:	83 fa f6             	cmp    $0xfffffff6,%edx
   261cd:	76 11                	jbe    261e0 <JS_CallInternal+0xd90>
   261cf:	8b 41 fc             	mov    -0x4(%rcx),%eax
   261d2:	83 e8 01             	sub    $0x1,%eax
   261d5:	89 41 fc             	mov    %eax,-0x4(%rcx)
   261d8:	85 c0                	test   %eax,%eax
   261da:	0f 8e 60 70 00 00    	jle    2d240 <JS_CallInternal+0x7df0>
   261e0:	48 83 eb 10          	sub    $0x10,%rbx
   261e4:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   261ea:	49 83 c4 03          	add    $0x3,%r12
   261ee:	49 89 c2             	mov    %rax,%r10
   261f1:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   261f5:	ff e0                	jmp    *%rax
   261f7:	f3 0f 1e fa          	endbr64
   261fb:	f3 0f 1e fa          	endbr64
   261ff:	41 0f b7 04 24       	movzwl (%r12),%eax
   26204:	48 8b bd 48 fe ff ff 	mov    -0x1b8(%rbp),%rdi
   2620b:	4d 8d 5c 24 02       	lea    0x2(%r12),%r11
   26210:	48 8d 0c c5 00 00 00 	lea    0x0(,%rax,8),%rcx
   26217:	00 
   26218:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   2621c:	48 8b 40 18          	mov    0x18(%rax),%rax
   26220:	48 8b 10             	mov    (%rax),%rdx
   26223:	48 8b 40 08          	mov    0x8(%rax),%rax
   26227:	83 f8 04             	cmp    $0x4,%eax
   2622a:	0f 84 b2 70 00 00    	je     2d2e2 <JS_CallInternal+0x7e92>
   26230:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26233:	76 04                	jbe    26239 <JS_CallInternal+0xde9>
   26235:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   26239:	48 89 13             	mov    %rdx,(%rbx)
   2623c:	48 89 43 08          	mov    %rax,0x8(%rbx)
   26240:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   26246:	48 83 c3 10          	add    $0x10,%rbx
   2624a:	49 83 c4 03          	add    $0x3,%r12
   2624e:	49 89 c2             	mov    %rax,%r10
   26251:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26255:	ff e0                	jmp    *%rax
   26257:	f3 0f 1e fa          	endbr64
   2625b:	f3 0f 1e fa          	endbr64
   2625f:	45 0f b7 0c 24       	movzwl (%r12),%r9d
   26264:	49 8d 4c 24 02       	lea    0x2(%r12),%rcx
   26269:	44 89 95 e8 fd ff ff 	mov    %r10d,-0x218(%rbp)
   26270:	4c 89 ef             	mov    %r13,%rdi
   26273:	48 89 8d b0 fd ff ff 	mov    %rcx,-0x250(%rbp)
   2627a:	45 0f b7 d9          	movzwl %r9w,%r11d
   2627e:	44 89 8d c0 fd ff ff 	mov    %r9d,-0x240(%rbp)
   26285:	49 c1 e3 04          	shl    $0x4,%r11
   26289:	4c 89 9d d0 fd ff ff 	mov    %r11,-0x230(%rbp)
   26290:	4c 89 d8             	mov    %r11,%rax
   26293:	49 89 db             	mov    %rbx,%r11
   26296:	49 29 c3             	sub    %rax,%r11
   26299:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   262a0:	49 8b 73 f0          	mov    -0x10(%r11),%rsi
   262a4:	4d 8b 43 e8          	mov    -0x18(%r11),%r8
   262a8:	48 89 48 30          	mov    %rcx,0x30(%rax)
   262ac:	49 8b 53 f8          	mov    -0x8(%r11),%rdx
   262b0:	49 8b 4b e0          	mov    -0x20(%r11),%rcx
   262b4:	6a 00                	push   $0x0
   262b6:	41 53                	push   %r11
   262b8:	4c 89 9d f0 fd ff ff 	mov    %r11,-0x210(%rbp)
   262bf:	6a 03                	push   $0x3
   262c1:	6a 00                	push   $0x0
   262c3:	e8 88 f1 ff ff       	call   25450 <JS_CallInternal>
   262c8:	48 83 c4 20          	add    $0x20,%rsp
   262cc:	4c 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%r11
   262d3:	83 fa 06             	cmp    $0x6,%edx
   262d6:	48 89 c6             	mov    %rax,%rsi
   262d9:	48 89 d0             	mov    %rdx,%rax
   262dc:	0f 84 92 70 00 00    	je     2d374 <JS_CallInternal+0x7f24>
   262e2:	48 89 f1             	mov    %rsi,%rcx
   262e5:	83 bd e8 fd ff ff 25 	cmpl   $0x25,-0x218(%rbp)
   262ec:	0f 84 e2 f8 ff ff    	je     25bd4 <JS_CallInternal+0x784>
   262f2:	48 8b 8d d0 fd ff ff 	mov    -0x230(%rbp),%rcx
   262f9:	4d 8d 43 e0          	lea    -0x20(%r11),%r8
   262fd:	48 89 9d f0 fd ff ff 	mov    %rbx,-0x210(%rbp)
   26304:	4c 89 a5 e8 fd ff ff 	mov    %r12,-0x218(%rbp)
   2630b:	4c 89 c3             	mov    %r8,%rbx
   2630e:	4c 89 bd d0 fd ff ff 	mov    %r15,-0x230(%rbp)
   26315:	4e 8d 24 19          	lea    (%rcx,%r11,1),%r12
   26319:	49 89 d7             	mov    %rdx,%r15
   2631c:	48 89 b5 b0 fd ff ff 	mov    %rsi,-0x250(%rbp)
   26323:	eb 28                	jmp    2634d <JS_CallInternal+0xefd>
   26325:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2632a:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   26331:	00 00 00 00 
   26335:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2633c:	00 00 00 00 
   26340:	48 83 c3 10          	add    $0x10,%rbx
   26344:	4c 39 e3             	cmp    %r12,%rbx
   26347:	0f 84 b8 59 00 00    	je     2bd05 <JS_CallInternal+0x68b5>
   2634d:	48 8b 73 08          	mov    0x8(%rbx),%rsi
   26351:	83 fe f6             	cmp    $0xfffffff6,%esi
   26354:	76 ea                	jbe    26340 <JS_CallInternal+0xef0>
   26356:	48 8b 3b             	mov    (%rbx),%rdi
   26359:	8b 47 fc             	mov    -0x4(%rdi),%eax
   2635c:	8d 50 ff             	lea    -0x1(%rax),%edx
   2635f:	89 57 fc             	mov    %edx,-0x4(%rdi)
   26362:	85 d2                	test   %edx,%edx
   26364:	7f da                	jg     26340 <JS_CallInternal+0xef0>
   26366:	48 89 f2             	mov    %rsi,%rdx
   26369:	48 89 fe             	mov    %rdi,%rsi
   2636c:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   26370:	e8 2b 86 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   26375:	eb c9                	jmp    26340 <JS_CallInternal+0xef0>
   26377:	f3 0f 1e fa          	endbr64
   2637b:	f3 0f 1e fa          	endbr64
   2637f:	49 8d 44 24 02       	lea    0x2(%r12),%rax
   26384:	45 0f b7 0c 24       	movzwl (%r12),%r9d
   26389:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   26390:	e9 bb f4 ff ff       	jmp    25850 <JS_CallInternal+0x400>
   26395:	f3 0f 1e fa          	endbr64
   26399:	f3 0f 1e fa          	endbr64
   2639d:	48 83 ec 08          	sub    $0x8,%rsp
   263a1:	31 c0                	xor    %eax,%eax
   263a3:	41 83 fa 54          	cmp    $0x54,%r10d
   263a7:	41 0f b6 4c 24 04    	movzbl 0x4(%r12),%ecx
   263ad:	0f 94 c0             	sete   %al
   263b0:	41 8b 14 24          	mov    (%r12),%edx
   263b4:	48 89 de             	mov    %rbx,%rsi
   263b7:	4c 89 ef             	mov    %r13,%rdi
   263ba:	4c 8b 8d 80 fe ff ff 	mov    -0x180(%rbp),%r9
   263c1:	4c 8b 85 48 fe ff ff 	mov    -0x1b8(%rbp),%r8
   263c8:	50                   	push   %rax
   263c9:	e8 f2 c9 06 00       	call   92dc0 <js_op_define_class>
   263ce:	5a                   	pop    %rdx
   263cf:	59                   	pop    %rcx
   263d0:	83 f8 ff             	cmp    $0xffffffff,%eax
   263d3:	0f 84 a0 92 00 00    	je     2f679 <JS_CallInternal+0xa229>
   263d9:	41 0f b6 44 24 05    	movzbl 0x5(%r12),%eax
   263df:	49 83 c4 06          	add    $0x6,%r12
   263e3:	49 89 c2             	mov    %rax,%r10
   263e6:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   263ea:	ff e0                	jmp    *%rax
   263ec:	f3 0f 1e fa          	endbr64
   263f0:	f3 0f 1e fa          	endbr64
   263f4:	41 83 fa 52          	cmp    $0x52,%r10d
   263f8:	0f 94 85 d0 fd ff ff 	sete   -0x230(%rbp)
   263ff:	0f 84 ec 61 00 00    	je     2c5f1 <JS_CallInternal+0x71a1>
   26405:	41 8b 04 24          	mov    (%r12),%eax
   26409:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   2640f:	49 8d 44 24 04       	lea    0x4(%r12),%rax
   26414:	48 89 85 e8 fd ff ff 	mov    %rax,-0x218(%rbp)
   2641b:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
   26422:	bf 03 00 00 00       	mov    $0x3,%edi
   26427:	0f b6 8d d0 fd ff ff 	movzbl -0x230(%rbp),%ecx
   2642e:	48 c7 85 78 fd ff ff 	movq   $0x0,-0x288(%rbp)
   26435:	00 00 00 00 
   26439:	48 c7 85 70 fd ff ff 	movq   $0x3,-0x290(%rbp)
   26440:	03 00 00 00 
   26444:	0f b6 10             	movzbl (%rax),%edx
   26447:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
   2644c:	89 8d 4c fd ff ff    	mov    %ecx,-0x2b4(%rbp)
   26452:	29 c8                	sub    %ecx,%eax
   26454:	48 89 bd 68 fd ff ff 	mov    %rdi,-0x298(%rbp)
   2645b:	48 98                	cltq
   2645d:	48 89 bd 58 fd ff ff 	mov    %rdi,-0x2a8(%rbp)
   26464:	48 c1 e0 04          	shl    $0x4,%rax
   26468:	48 01 d8             	add    %rbx,%rax
   2646b:	48 8b 08             	mov    (%rax),%rcx
   2646e:	48 8b 40 08          	mov    0x8(%rax),%rax
   26472:	48 89 85 a0 fd ff ff 	mov    %rax,-0x260(%rbp)
   26479:	89 d0                	mov    %edx,%eax
   2647b:	83 e0 04             	and    $0x4,%eax
   2647e:	48 89 8d a8 fd ff ff 	mov    %rcx,-0x258(%rbp)
   26485:	3c 01                	cmp    $0x1,%al
   26487:	19 c0                	sbb    %eax,%eax
   26489:	31 f6                	xor    %esi,%esi
   2648b:	83 e0 fc             	and    $0xfffffffc,%eax
   2648e:	48 89 b5 60 fd ff ff 	mov    %rsi,-0x2a0(%rbp)
   26495:	48 89 b5 50 fd ff ff 	mov    %rsi,-0x2b0(%rbp)
   2649c:	05 05 45 00 00       	add    $0x4505,%eax
   264a1:	83 e2 03             	and    $0x3,%edx
   264a4:	0f 85 ed 58 00 00    	jne    2bd97 <JS_CallInternal+0x6947>
   264aa:	0d 02 22 00 00       	or     $0x2202,%eax
   264af:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   264b3:	4c 8d 63 f0          	lea    -0x10(%rbx),%r12
   264b7:	4c 89 ef             	mov    %r13,%rdi
   264ba:	89 85 48 fd ff ff    	mov    %eax,-0x2b8(%rbp)
   264c0:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   264c4:	48 89 8d 78 fd ff ff 	mov    %rcx,-0x288(%rbp)
   264cb:	8b b5 f0 fd ff ff    	mov    -0x210(%rbp),%esi
   264d1:	48 89 85 c0 fd ff ff 	mov    %rax,-0x240(%rbp)
   264d8:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   264dc:	49 8b 44 24 08       	mov    0x8(%r12),%rax
   264e1:	48 89 8d 70 fd ff ff 	mov    %rcx,-0x290(%rbp)
   264e8:	48 89 85 b0 fd ff ff 	mov    %rax,-0x250(%rbp)
   264ef:	e8 8c e1 01 00       	call   44680 <js_get_function_name>
   264f4:	49 89 c0             	mov    %rax,%r8
   264f7:	49 89 d1             	mov    %rdx,%r9
   264fa:	41 83 f9 06          	cmp    $0x6,%r9d
   264fe:	0f 84 d4 6c 00 00    	je     2d1d8 <JS_CallInternal+0x7d88>
   26504:	48 83 ec 08          	sub    $0x8,%rsp
   26508:	48 8b b5 c0 fd ff ff 	mov    -0x240(%rbp),%rsi
   2650f:	4c 89 ef             	mov    %r13,%rdi
   26512:	b9 3a 00 00 00       	mov    $0x3a,%ecx
   26517:	6a 01                	push   $0x1
   26519:	48 8b 95 b0 fd ff ff 	mov    -0x250(%rbp),%rdx
   26520:	e8 6b d1 00 00       	call   33690 <JS_DefinePropertyValue>
   26525:	5e                   	pop    %rsi
   26526:	5f                   	pop    %rdi
   26527:	85 c0                	test   %eax,%eax
   26529:	0f 88 a9 6c 00 00    	js     2d1d8 <JS_CallInternal+0x7d88>
   2652f:	48 8b 8d a8 fd ff ff 	mov    -0x258(%rbp),%rcx
   26536:	4c 8b 85 a0 fd ff ff 	mov    -0x260(%rbp),%r8
   2653d:	4c 89 ef             	mov    %r13,%rdi
   26540:	48 8b b5 c0 fd ff ff 	mov    -0x240(%rbp),%rsi
   26547:	48 8b 95 b0 fd ff ff 	mov    -0x250(%rbp),%rdx
   2654e:	e8 fd 9e ff ff       	call   20450 <js_method_set_home_object>
   26553:	8b 85 48 fd ff ff    	mov    -0x2b8(%rbp),%eax
   26559:	48 83 ec 08          	sub    $0x8,%rsp
   2655d:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   26563:	4c 8b 85 78 fd ff ff 	mov    -0x288(%rbp),%r8
   2656a:	4c 8b 8d 70 fd ff ff 	mov    -0x290(%rbp),%r9
   26571:	4c 89 ef             	mov    %r13,%rdi
   26574:	48 8b b5 a8 fd ff ff 	mov    -0x258(%rbp),%rsi
   2657b:	48 8b 95 a0 fd ff ff 	mov    -0x260(%rbp),%rdx
   26582:	50                   	push   %rax
   26583:	ff b5 58 fd ff ff    	push   -0x2a8(%rbp)
   26589:	ff b5 50 fd ff ff    	push   -0x2b0(%rbp)
   2658f:	ff b5 68 fd ff ff    	push   -0x298(%rbp)
   26595:	ff b5 60 fd ff ff    	push   -0x2a0(%rbp)
   2659b:	e8 60 c2 00 00       	call   32800 <JS_DefineProperty>
   265a0:	48 83 c4 30          	add    $0x30,%rsp
   265a4:	89 c1                	mov    %eax,%ecx
   265a6:	49 8b 44 24 08       	mov    0x8(%r12),%rax
   265ab:	83 f8 f6             	cmp    $0xfffffff6,%eax
   265ae:	76 15                	jbe    265c5 <JS_CallInternal+0x1175>
   265b0:	49 8b 34 24          	mov    (%r12),%rsi
   265b4:	8b 7e fc             	mov    -0x4(%rsi),%edi
   265b7:	8d 57 ff             	lea    -0x1(%rdi),%edx
   265ba:	89 56 fc             	mov    %edx,-0x4(%rsi)
   265bd:	85 d2                	test   %edx,%edx
   265bf:	0f 8e 3b 6b 00 00    	jle    2d100 <JS_CallInternal+0x7cb0>
   265c5:	80 bd d0 fd ff ff 00 	cmpb   $0x0,-0x230(%rbp)
   265cc:	0f 85 eb 59 00 00    	jne    2bfbd <JS_CallInternal+0x6b6d>
   265d2:	8b 85 4c fd ff ff    	mov    -0x2b4(%rbp),%eax
   265d8:	4c 8b a5 e8 fd ff ff 	mov    -0x218(%rbp),%r12
   265df:	83 c0 01             	add    $0x1,%eax
   265e2:	49 83 c4 01          	add    $0x1,%r12
   265e6:	48 98                	cltq
   265e8:	48 c1 e0 04          	shl    $0x4,%rax
   265ec:	48 29 c3             	sub    %rax,%rbx
   265ef:	85 c9                	test   %ecx,%ecx
   265f1:	0f 88 89 f6 ff ff    	js     25c80 <JS_CallInternal+0x830>
   265f7:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
   265fe:	4c 8d 60 02          	lea    0x2(%rax),%r12
   26602:	0f b6 40 01          	movzbl 0x1(%rax),%eax
   26606:	49 89 c2             	mov    %rax,%r10
   26609:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2660d:	f3 0f 1e fa          	endbr64
   26611:	f3 0f 1e fa          	endbr64
   26615:	31 c0                	xor    %eax,%eax
   26617:	b9 02 00 00 00       	mov    $0x2,%ecx
   2661c:	e9 df f6 ff ff       	jmp    25d00 <JS_CallInternal+0x8b0>
   26621:	f3 0f 1e fa          	endbr64
   26625:	f3 0f 1e fa          	endbr64
   26629:	48 8b 85 70 fe ff ff 	mov    -0x190(%rbp),%rax
   26630:	4c 89 e2             	mov    %r12,%rdx
   26633:	44 89 d1             	mov    %r10d,%ecx
   26636:	4c 89 ef             	mov    %r13,%rdi
   26639:	48 8d 35 10 68 0b 00 	lea    0xb6810(%rip),%rsi        # dce50 <_IO_stdin_used+0x3e50>
   26640:	48 2b 50 18          	sub    0x18(%rax),%rdx
   26644:	31 c0                	xor    %eax,%eax
   26646:	83 ea 01             	sub    $0x1,%edx
   26649:	e8 52 01 01 00       	call   367a0 <JS_ThrowInternalError>
   2664e:	e9 2d f6 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   26653:	f3 0f 1e fa          	endbr64
   26657:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2665b:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2665f:	4c 89 ef             	mov    %r13,%rdi
   26662:	4c 8d 53 f0          	lea    -0x10(%rbx),%r10
   26666:	e8 75 e8 ff ff       	call   24ee0 <js_operator_typeof>
   2666b:	83 f8 1b             	cmp    $0x1b,%eax
   2666e:	74 5d                	je     266cd <JS_CallInternal+0x127d>
   26670:	49 8b 52 08          	mov    0x8(%r10),%rdx
   26674:	49 8b 0a             	mov    (%r10),%rcx
   26677:	83 fa f6             	cmp    $0xfffffff6,%edx
   2667a:	76 11                	jbe    2668d <JS_CallInternal+0x123d>
   2667c:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2667f:	83 e8 01             	sub    $0x1,%eax
   26682:	89 41 fc             	mov    %eax,-0x4(%rcx)
   26685:	85 c0                	test   %eax,%eax
   26687:	0f 8e 53 5f 00 00    	jle    2c5e0 <JS_CallInternal+0x7190>
   2668d:	48 c7 43 f0 00 00 00 	movq   $0x0,-0x10(%rbx)
   26694:	00 
   26695:	49 83 c4 01          	add    $0x1,%r12
   26699:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   266a0:	00 
   266a1:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   266a7:	49 89 c2             	mov    %rax,%r10
   266aa:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   266ae:	ff e0                	jmp    *%rax
   266b0:	f3 0f 1e fa          	endbr64
   266b4:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   266b8:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   266bc:	4c 89 ef             	mov    %r13,%rdi
   266bf:	4c 8d 53 f0          	lea    -0x10(%rbx),%r10
   266c3:	e8 18 e8 ff ff       	call   24ee0 <js_operator_typeof>
   266c8:	83 f8 49             	cmp    $0x49,%eax
   266cb:	75 a3                	jne    26670 <JS_CallInternal+0x1220>
   266cd:	49 8b 42 08          	mov    0x8(%r10),%rax
   266d1:	49 8b 12             	mov    (%r10),%rdx
   266d4:	83 f8 f6             	cmp    $0xfffffff6,%eax
   266d7:	76 11                	jbe    266ea <JS_CallInternal+0x129a>
   266d9:	8b 4a fc             	mov    -0x4(%rdx),%ecx
   266dc:	83 e9 01             	sub    $0x1,%ecx
   266df:	89 4a fc             	mov    %ecx,-0x4(%rdx)
   266e2:	85 c9                	test   %ecx,%ecx
   266e4:	0f 8e 2d 89 00 00    	jle    2f017 <JS_CallInternal+0x9bc7>
   266ea:	48 c7 43 f0 01 00 00 	movq   $0x1,-0x10(%rbx)
   266f1:	00 
   266f2:	49 83 c4 01          	add    $0x1,%r12
   266f6:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   266fd:	00 
   266fe:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   26704:	49 89 c2             	mov    %rax,%r10
   26707:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2670b:	ff e0                	jmp    *%rax
   2670d:	f3 0f 1e fa          	endbr64
   26711:	83 7b f8 02          	cmpl   $0x2,-0x8(%rbx)
   26715:	74 d3                	je     266ea <JS_CallInternal+0x129a>
   26717:	4c 8d 53 f0          	lea    -0x10(%rbx),%r10
   2671b:	e9 50 ff ff ff       	jmp    26670 <JS_CallInternal+0x1220>
   26720:	f3 0f 1e fa          	endbr64
   26724:	83 7b f8 03          	cmpl   $0x3,-0x8(%rbx)
   26728:	75 ed                	jne    26717 <JS_CallInternal+0x12c7>
   2672a:	eb be                	jmp    266ea <JS_CallInternal+0x129a>
   2672c:	f3 0f 1e fa          	endbr64
   26730:	8b 43 f8             	mov    -0x8(%rbx),%eax
   26733:	83 e8 02             	sub    $0x2,%eax
   26736:	83 f8 01             	cmp    $0x1,%eax
   26739:	77 dc                	ja     26717 <JS_CallInternal+0x12c7>
   2673b:	eb ad                	jmp    266ea <JS_CallInternal+0x129a>
   2673d:	f3 0f 1e fa          	endbr64
   26741:	41 0f b6 04 24       	movzbl (%r12),%eax
   26746:	49 83 c4 01          	add    $0x1,%r12
   2674a:	49 89 c2             	mov    %rax,%r10
   2674d:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26751:	ff e0                	jmp    *%rax
   26753:	f3 0f 1e fa          	endbr64
   26757:	41 0f b7 04 24       	movzwl (%r12),%eax
   2675c:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   26761:	48 c1 e0 04          	shl    $0x4,%rax
   26765:	48 03 85 58 fe ff ff 	add    -0x1a8(%rbp),%rax
   2676c:	48 8b 50 08          	mov    0x8(%rax),%rdx
   26770:	48 8b 08             	mov    (%rax),%rcx
   26773:	0f 11 00             	movups %xmm0,(%rax)
   26776:	83 fa f6             	cmp    $0xfffffff6,%edx
   26779:	76 11                	jbe    2678c <JS_CallInternal+0x133c>
   2677b:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2677e:	83 e8 01             	sub    $0x1,%eax
   26781:	89 41 fc             	mov    %eax,-0x4(%rcx)
   26784:	85 c0                	test   %eax,%eax
   26786:	0f 8e 78 74 00 00    	jle    2dc04 <JS_CallInternal+0x87b4>
   2678c:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   26792:	48 83 eb 10          	sub    $0x10,%rbx
   26796:	49 83 c4 03          	add    $0x3,%r12
   2679a:	49 89 c2             	mov    %rax,%r10
   2679d:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   267a1:	ff e0                	jmp    *%rax
   267a3:	f3 0f 1e fa          	endbr64
   267a7:	41 0f b7 04 24       	movzwl (%r12),%eax
   267ac:	48 c1 e0 04          	shl    $0x4,%rax
   267b0:	48 03 85 58 fe ff ff 	add    -0x1a8(%rbp),%rax
   267b7:	48 8b 10             	mov    (%rax),%rdx
   267ba:	48 8b 40 08          	mov    0x8(%rax),%rax
   267be:	83 f8 f6             	cmp    $0xfffffff6,%eax
   267c1:	76 04                	jbe    267c7 <JS_CallInternal+0x1377>
   267c3:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   267c7:	48 89 13             	mov    %rdx,(%rbx)
   267ca:	49 83 c4 03          	add    $0x3,%r12
   267ce:	48 83 c3 10          	add    $0x10,%rbx
   267d2:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   267d6:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   267dc:	49 89 c2             	mov    %rax,%r10
   267df:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   267e3:	ff e0                	jmp    *%rax
   267e5:	f3 0f 1e fa          	endbr64
   267e9:	e9 92 ef ff ff       	jmp    25780 <JS_CallInternal+0x330>
   267ee:	f3 0f 1e fa          	endbr64
   267f2:	e9 89 ef ff ff       	jmp    25780 <JS_CallInternal+0x330>
   267f7:	f3 0f 1e fa          	endbr64
   267fb:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   267ff:	83 f8 fa             	cmp    $0xfffffffa,%eax
   26802:	0f 8d 9f 5b 00 00    	jge    2c3a7 <JS_CallInternal+0x6f57>
   26808:	83 f8 f8             	cmp    $0xfffffff8,%eax
   2680b:	0f 8c 9e 5b 00 00    	jl     2c3af <JS_CallInternal+0x6f5f>
   26811:	41 0f b6 04 24       	movzbl (%r12),%eax
   26816:	49 83 c4 01          	add    $0x1,%r12
   2681a:	49 89 c2             	mov    %rax,%r10
   2681d:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26821:	ff e0                	jmp    *%rax
   26823:	f3 0f 1e fa          	endbr64
   26827:	83 7b f8 ff          	cmpl   $0xffffffff,-0x8(%rbx)
   2682b:	74 4d                	je     2687a <JS_CallInternal+0x142a>
   2682d:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   26834:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   26838:	4c 89 ef             	mov    %r13,%rdi
   2683b:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2683f:	4c 89 60 30          	mov    %r12,0x30(%rax)
   26843:	e8 88 51 02 00       	call   4b9d0 <JS_ToObject>
   26848:	48 89 d1             	mov    %rdx,%rcx
   2684b:	83 fa 06             	cmp    $0x6,%edx
   2684e:	0f 84 2c f4 ff ff    	je     25c80 <JS_CallInternal+0x830>
   26854:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   26858:	83 fe f6             	cmp    $0xfffffff6,%esi
   2685b:	76 15                	jbe    26872 <JS_CallInternal+0x1422>
   2685d:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   26861:	8b 57 fc             	mov    -0x4(%rdi),%edx
   26864:	83 ea 01             	sub    $0x1,%edx
   26867:	89 57 fc             	mov    %edx,-0x4(%rdi)
   2686a:	85 d2                	test   %edx,%edx
   2686c:	0f 8e aa 88 00 00    	jle    2f11c <JS_CallInternal+0x9ccc>
   26872:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   26876:	48 89 4b f8          	mov    %rcx,-0x8(%rbx)
   2687a:	41 0f b6 04 24       	movzbl (%r12),%eax
   2687f:	49 83 c4 01          	add    $0x1,%r12
   26883:	49 89 c2             	mov    %rax,%r10
   26886:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2688a:	ff e0                	jmp    *%rax
   2688c:	f3 0f 1e fa          	endbr64
   26890:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   26897:	4d 8d 4c 24 04       	lea    0x4(%r12),%r9
   2689c:	41 8b 0c 24          	mov    (%r12),%ecx
   268a0:	4c 89 48 30          	mov    %r9,0x30(%rax)
   268a4:	49 8b 85 90 01 00 00 	mov    0x190(%r13),%rax
   268ab:	89 ce                	mov    %ecx,%esi
   268ad:	48 8b 50 18          	mov    0x18(%rax),%rdx
   268b1:	8b 42 18             	mov    0x18(%rdx),%eax
   268b4:	21 c6                	and    %eax,%esi
   268b6:	8b 74 b2 38          	mov    0x38(%rdx,%rsi,4),%esi
   268ba:	48 85 f6             	test   %rsi,%rsi
   268bd:	0f 84 6c 65 00 00    	je     2ce2f <JS_CallInternal+0x79df>
   268c3:	48 8d 3c 85 3c 00 00 	lea    0x3c(,%rax,4),%rdi
   268ca:	00 
   268cb:	48 8d 44 f7 f8       	lea    -0x8(%rdi,%rsi,8),%rax
   268d0:	48 01 d0             	add    %rdx,%rax
   268d3:	3b 48 04             	cmp    0x4(%rax),%ecx
   268d6:	0f 85 45 65 00 00    	jne    2ce21 <JS_CallInternal+0x79d1>
   268dc:	31 c0                	xor    %eax,%eax
   268de:	48 89 03             	mov    %rax,(%rbx)
   268e1:	49 83 c4 05          	add    $0x5,%r12
   268e5:	48 83 c3 10          	add    $0x10,%rbx
   268e9:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   268f0:	00 
   268f1:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   268f7:	49 89 c2             	mov    %rax,%r10
   268fa:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   268fe:	ff e0                	jmp    *%rax
   26900:	f3 0f 1e fa          	endbr64
   26904:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2690b:	48 8b 4b e8          	mov    -0x18(%rbx),%rcx
   2690f:	4c 89 ef             	mov    %r13,%rdi
   26912:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   26916:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2691a:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   2691e:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   26925:	48 89 85 e8 fd ff ff 	mov    %rax,-0x218(%rbp)
   2692c:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   26930:	48 89 b5 c0 fd ff ff 	mov    %rsi,-0x240(%rbp)
   26937:	48 89 c2             	mov    %rax,%rdx
   2693a:	48 89 85 d0 fd ff ff 	mov    %rax,-0x230(%rbp)
   26941:	e8 6a 0a 02 00       	call   473b0 <JS_ValueToAtom>
   26946:	85 c0                	test   %eax,%eax
   26948:	0f 84 32 f3 ff ff    	je     25c80 <JS_CallInternal+0x830>
   2694e:	48 8b b5 e8 fd ff ff 	mov    -0x218(%rbp),%rsi
   26955:	48 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%rdx
   2695c:	89 c1                	mov    %eax,%ecx
   2695e:	4c 89 ef             	mov    %r13,%rdi
   26961:	41 b8 00 80 00 00    	mov    $0x8000,%r8d
   26967:	89 85 b0 fd ff ff    	mov    %eax,-0x250(%rbp)
   2696d:	e8 7e 7a 02 00       	call   4e3f0 <JS_DeleteProperty>
   26972:	44 8b 8d b0 fd ff ff 	mov    -0x250(%rbp),%r9d
   26979:	89 c1                	mov    %eax,%ecx
   2697b:	41 81 f9 f2 00 00 00 	cmp    $0xf2,%r9d
   26982:	0f 8f 60 64 00 00    	jg     2cde8 <JS_CallInternal+0x7998>
   26988:	85 c9                	test   %ecx,%ecx
   2698a:	0f 88 f0 f2 ff ff    	js     25c80 <JS_CallInternal+0x830>
   26990:	83 bd f0 fd ff ff f6 	cmpl   $0xfffffff6,-0x210(%rbp)
   26997:	76 1e                	jbe    269b7 <JS_CallInternal+0x1567>
   26999:	48 8b bd e8 fd ff ff 	mov    -0x218(%rbp),%rdi
   269a0:	8b 47 fc             	mov    -0x4(%rdi),%eax
   269a3:	89 85 b0 fd ff ff    	mov    %eax,-0x250(%rbp)
   269a9:	83 e8 01             	sub    $0x1,%eax
   269ac:	89 47 fc             	mov    %eax,-0x4(%rdi)
   269af:	85 c0                	test   %eax,%eax
   269b1:	0f 8e 16 79 00 00    	jle    2e2cd <JS_CallInternal+0x8e7d>
   269b7:	83 bd d0 fd ff ff f6 	cmpl   $0xfffffff6,-0x230(%rbp)
   269be:	76 1e                	jbe    269de <JS_CallInternal+0x158e>
   269c0:	48 8b bd c0 fd ff ff 	mov    -0x240(%rbp),%rdi
   269c7:	8b 47 fc             	mov    -0x4(%rdi),%eax
   269ca:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   269d0:	83 e8 01             	sub    $0x1,%eax
   269d3:	89 47 fc             	mov    %eax,-0x4(%rdi)
   269d6:	85 c0                	test   %eax,%eax
   269d8:	0f 8e 22 78 00 00    	jle    2e200 <JS_CallInternal+0x8db0>
   269de:	31 c0                	xor    %eax,%eax
   269e0:	85 c9                	test   %ecx,%ecx
   269e2:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   269e9:	00 
   269ea:	0f 95 c0             	setne  %al
   269ed:	48 83 eb 10          	sub    $0x10,%rbx
   269f1:	49 83 c4 01          	add    $0x1,%r12
   269f5:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   269f9:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   269ff:	49 89 c2             	mov    %rax,%r10
   26a02:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26a06:	ff e0                	jmp    *%rax
   26a08:	f3 0f 1e fa          	endbr64
   26a0c:	4d 8d 54 24 02       	lea    0x2(%r12),%r10
   26a11:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   26a15:	48 8b 53 d8          	mov    -0x28(%rbx),%rdx
   26a19:	4c 89 ef             	mov    %r13,%rdi
   26a1c:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   26a23:	45 0f b7 0c 24       	movzwl (%r12),%r9d
   26a28:	4c 8d 43 e0          	lea    -0x20(%rbx),%r8
   26a2c:	b9 02 00 00 00       	mov    $0x2,%ecx
   26a31:	4c 89 95 f0 fd ff ff 	mov    %r10,-0x210(%rbp)
   26a38:	4c 89 50 30          	mov    %r10,0x30(%rax)
   26a3c:	4c 89 85 e8 fd ff ff 	mov    %r8,-0x218(%rbp)
   26a43:	e8 78 5e 08 00       	call   ac8c0 <js_function_apply>
   26a48:	48 89 d1             	mov    %rdx,%rcx
   26a4b:	83 fa 06             	cmp    $0x6,%edx
   26a4e:	0f 84 ed 7b 00 00    	je     2e641 <JS_CallInternal+0x91f1>
   26a54:	48 8b 73 d8          	mov    -0x28(%rbx),%rsi
   26a58:	4c 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%r8
   26a5f:	83 fe f6             	cmp    $0xfffffff6,%esi
   26a62:	76 15                	jbe    26a79 <JS_CallInternal+0x1629>
   26a64:	48 8b 7b d0          	mov    -0x30(%rbx),%rdi
   26a68:	8b 57 fc             	mov    -0x4(%rdi),%edx
   26a6b:	83 ea 01             	sub    $0x1,%edx
   26a6e:	89 57 fc             	mov    %edx,-0x4(%rdi)
   26a71:	85 d2                	test   %edx,%edx
   26a73:	0f 8e a6 6e 00 00    	jle    2d91f <JS_CallInternal+0x84cf>
   26a79:	49 8b 70 08          	mov    0x8(%r8),%rsi
   26a7d:	83 fe f6             	cmp    $0xfffffff6,%esi
   26a80:	76 14                	jbe    26a96 <JS_CallInternal+0x1646>
   26a82:	49 8b 38             	mov    (%r8),%rdi
   26a85:	8b 57 fc             	mov    -0x4(%rdi),%edx
   26a88:	83 ea 01             	sub    $0x1,%edx
   26a8b:	89 57 fc             	mov    %edx,-0x4(%rdi)
   26a8e:	85 d2                	test   %edx,%edx
   26a90:	0f 8e 0d 6e 00 00    	jle    2d8a3 <JS_CallInternal+0x8453>
   26a96:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   26a9a:	83 fe f6             	cmp    $0xfffffff6,%esi
   26a9d:	76 15                	jbe    26ab4 <JS_CallInternal+0x1664>
   26a9f:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   26aa3:	8b 57 fc             	mov    -0x4(%rdi),%edx
   26aa6:	83 ea 01             	sub    $0x1,%edx
   26aa9:	89 57 fc             	mov    %edx,-0x4(%rdi)
   26aac:	85 d2                	test   %edx,%edx
   26aae:	0f 8e 2d 6e 00 00    	jle    2d8e1 <JS_CallInternal+0x8491>
   26ab4:	48 89 43 d0          	mov    %rax,-0x30(%rbx)
   26ab8:	49 83 c4 03          	add    $0x3,%r12
   26abc:	48 89 4b d8          	mov    %rcx,-0x28(%rbx)
   26ac0:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   26ac6:	4c 89 c3             	mov    %r8,%rbx
   26ac9:	49 89 c2             	mov    %rax,%r10
   26acc:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26ad0:	ff e0                	jmp    *%rax
   26ad2:	f3 0f 1e fa          	endbr64
   26ad6:	49 8b 75 30          	mov    0x30(%r13),%rsi
   26ada:	41 0f b7 14 24       	movzwl (%r12),%edx
   26adf:	49 8d 4c 24 02       	lea    0x2(%r12),%rcx
   26ae4:	4c 89 ef             	mov    %r13,%rdi
   26ae7:	48 89 8d b0 fd ff ff 	mov    %rcx,-0x250(%rbp)
   26aee:	31 c9                	xor    %ecx,%ecx
   26af0:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   26af4:	49 89 d1             	mov    %rdx,%r9
   26af7:	49 c1 e1 04          	shl    $0x4,%r9
   26afb:	89 95 f0 fd ff ff    	mov    %edx,-0x210(%rbp)
   26b01:	4c 29 cb             	sub    %r9,%rbx
   26b04:	48 89 95 c0 fd ff ff 	mov    %rdx,-0x240(%rbp)
   26b0b:	ba 02 00 00 00       	mov    $0x2,%edx
   26b10:	4c 89 8d d0 fd ff ff 	mov    %r9,-0x230(%rbp)
   26b17:	48 89 9d e8 fd ff ff 	mov    %rbx,-0x218(%rbp)
   26b1e:	e8 9d 3e 02 00       	call   4a9c0 <JS_NewObjectFromShape>
   26b23:	4c 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%r8
   26b2a:	4c 8b 8d d0 fd ff ff 	mov    -0x230(%rbp),%r9
   26b31:	83 fa 06             	cmp    $0x6,%edx
   26b34:	48 89 c1             	mov    %rax,%rcx
   26b37:	49 89 d2             	mov    %rdx,%r10
   26b3a:	0f 84 d2 74 00 00    	je     2e012 <JS_CallInternal+0x8bc2>
   26b40:	8b 95 f0 fd ff ff    	mov    -0x210(%rbp),%edx
   26b46:	85 d2                	test   %edx,%edx
   26b48:	0f 85 9a 5b 00 00    	jne    2c6e8 <JS_CallInternal+0x7298>
   26b4e:	4d 89 50 08          	mov    %r10,0x8(%r8)
   26b52:	49 8d 58 10          	lea    0x10(%r8),%rbx
   26b56:	49 83 c4 03          	add    $0x3,%r12
   26b5a:	49 89 08             	mov    %rcx,(%r8)
   26b5d:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   26b63:	49 89 c2             	mov    %rax,%r10
   26b66:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26b6a:	ff e0                	jmp    *%rax
   26b6c:	f3 0f 1e fa          	endbr64
   26b70:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   26b74:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   26b78:	4c 89 ef             	mov    %r13,%rdi
   26b7b:	48 83 eb 10          	sub    $0x10,%rbx
   26b7f:	e8 ec df ff ff       	call   24b70 <JS_Throw>
   26b84:	e9 f7 f0 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   26b89:	f3 0f 1e fa          	endbr64
   26b8d:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   26b91:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   26b95:	4c 8d 4b f0          	lea    -0x10(%rbx),%r9
   26b99:	4c 8d 5b e0          	lea    -0x20(%rbx),%r11
   26b9d:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   26ba1:	4c 8b 43 f8          	mov    -0x8(%rbx),%r8
   26ba5:	4c 89 ef             	mov    %r13,%rdi
   26ba8:	4c 89 9d e8 fd ff ff 	mov    %r11,-0x218(%rbp)
   26baf:	4c 89 8d f0 fd ff ff 	mov    %r9,-0x210(%rbp)
   26bb6:	e8 75 68 02 00       	call   4d430 <JS_AddBrand>
   26bbb:	83 f8 ff             	cmp    $0xffffffff,%eax
   26bbe:	0f 84 bc f0 ff ff    	je     25c80 <JS_CallInternal+0x830>
   26bc4:	4c 8b 9d e8 fd ff ff 	mov    -0x218(%rbp),%r11
   26bcb:	4c 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%r9
   26bd2:	49 8b 43 08          	mov    0x8(%r11),%rax
   26bd6:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26bd9:	76 15                	jbe    26bf0 <JS_CallInternal+0x17a0>
   26bdb:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   26bdf:	8b 59 fc             	mov    -0x4(%rcx),%ebx
   26be2:	8d 53 ff             	lea    -0x1(%rbx),%edx
   26be5:	89 51 fc             	mov    %edx,-0x4(%rcx)
   26be8:	85 d2                	test   %edx,%edx
   26bea:	0f 8e fa 6a 00 00    	jle    2d6ea <JS_CallInternal+0x829a>
   26bf0:	49 8b 41 08          	mov    0x8(%r9),%rax
   26bf4:	83 f8 f6             	cmp    $0xfffffff6,%eax
   26bf7:	76 14                	jbe    26c0d <JS_CallInternal+0x17bd>
   26bf9:	49 8b 09             	mov    (%r9),%rcx
   26bfc:	8b 59 fc             	mov    -0x4(%rcx),%ebx
   26bff:	8d 53 ff             	lea    -0x1(%rbx),%edx
   26c02:	89 51 fc             	mov    %edx,-0x4(%rcx)
   26c05:	85 d2                	test   %edx,%edx
   26c07:	0f 8e c1 6e 00 00    	jle    2dace <JS_CallInternal+0x867e>
   26c0d:	41 0f b6 04 24       	movzbl (%r12),%eax
   26c12:	4c 89 db             	mov    %r11,%rbx
   26c15:	49 83 c4 01          	add    $0x1,%r12
   26c19:	49 89 c2             	mov    %rax,%r10
   26c1c:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26c20:	ff e0                	jmp    *%rax
   26c22:	f3 0f 1e fa          	endbr64
   26c26:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   26c2a:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   26c2e:	83 f8 03             	cmp    $0x3,%eax
   26c31:	0f 87 a1 60 00 00    	ja     2ccd8 <JS_CallInternal+0x7888>
   26c37:	31 c0                	xor    %eax,%eax
   26c39:	85 d2                	test   %edx,%edx
   26c3b:	0f 95 c0             	setne  %al
   26c3e:	85 c0                	test   %eax,%eax
   26c40:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   26c47:	00 
   26c48:	0f 94 c0             	sete   %al
   26c4b:	49 83 c4 01          	add    $0x1,%r12
   26c4f:	0f b6 c0             	movzbl %al,%eax
   26c52:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   26c56:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   26c5c:	49 89 c2             	mov    %rax,%r10
   26c5f:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26c63:	ff e0                	jmp    *%rax
   26c65:	f3 0f 1e fa          	endbr64
   26c69:	49 8d 44 24 01       	lea    0x1(%r12),%rax
   26c6e:	48 8b 73 c0          	mov    -0x40(%rbx),%rsi
   26c72:	48 8b 53 c8          	mov    -0x38(%rbx),%rdx
   26c76:	4c 89 ef             	mov    %r13,%rdi
   26c79:	45 0f b6 14 24       	movzbl (%r12),%r10d
   26c7e:	48 8b 8d 80 fe ff ff 	mov    -0x180(%rbp),%rcx
   26c85:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   26c8c:	49 89 f0             	mov    %rsi,%r8
   26c8f:	49 89 d1             	mov    %rdx,%r9
   26c92:	48 89 41 30          	mov    %rax,0x30(%rcx)
   26c96:	44 89 d0             	mov    %r10d,%eax
   26c99:	83 e0 01             	and    $0x1,%eax
   26c9c:	44 88 95 e8 fd ff ff 	mov    %r10b,-0x218(%rbp)
   26ca3:	3c 01                	cmp    $0x1,%al
   26ca5:	19 c9                	sbb    %ecx,%ecx
   26ca7:	48 83 ec 08          	sub    $0x8,%rsp
   26cab:	6a 00                	push   $0x0
   26cad:	83 e1 ef             	and    $0xffffffef,%ecx
   26cb0:	83 c1 17             	add    $0x17,%ecx
   26cb3:	e8 68 99 00 00       	call   30620 <JS_GetPropertyInternal>
   26cb8:	41 5a                	pop    %r10
   26cba:	41 5b                	pop    %r11
   26cbc:	48 89 c6             	mov    %rax,%rsi
   26cbf:	83 fa 06             	cmp    $0x6,%edx
   26cc2:	0f 84 d6 68 00 00    	je     2d59e <JS_CallInternal+0x814e>
   26cc8:	8d 4a fe             	lea    -0x2(%rdx),%ecx
   26ccb:	b8 01 00 00 00       	mov    $0x1,%eax
   26cd0:	83 f9 01             	cmp    $0x1,%ecx
   26cd3:	0f 87 73 58 00 00    	ja     2c54c <JS_CallInternal+0x70fc>
   26cd9:	48 89 03             	mov    %rax,(%rbx)
   26cdc:	49 83 c4 02          	add    $0x2,%r12
   26ce0:	48 83 c3 10          	add    $0x10,%rbx
   26ce4:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   26ceb:	00 
   26cec:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   26cf2:	49 89 c2             	mov    %rax,%r10
   26cf5:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26cf9:	ff e0                	jmp    *%rax
   26cfb:	f3 0f 1e fa          	endbr64
   26cff:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   26d06:	4c 8b 53 f0          	mov    -0x10(%rbx),%r10
   26d0a:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   26d0e:	4c 89 60 30          	mov    %r12,0x30(%rax)
   26d12:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   26d16:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   26d1d:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   26d21:	48 89 85 e8 fd ff ff 	mov    %rax,-0x218(%rbp)
   26d28:	83 f8 ff             	cmp    $0xffffffff,%eax
   26d2b:	0f 85 ba 96 00 00    	jne    303eb <JS_CallInternal+0xaf9b>
   26d31:	41 83 f9 ff          	cmp    $0xffffffff,%r9d
   26d35:	0f 84 bd 5e 00 00    	je     2cbf8 <JS_CallInternal+0x77a8>
   26d3b:	4c 89 ca             	mov    %r9,%rdx
   26d3e:	4c 89 d6             	mov    %r10,%rsi
   26d41:	4c 89 ef             	mov    %r13,%rdi
   26d44:	4c 89 8d c0 fd ff ff 	mov    %r9,-0x240(%rbp)
   26d4b:	4c 89 95 d0 fd ff ff 	mov    %r10,-0x230(%rbp)
   26d52:	4c 89 8d d8 fd ff ff 	mov    %r9,-0x228(%rbp)
   26d59:	e8 52 06 02 00       	call   473b0 <JS_ValueToAtom>
   26d5e:	89 c2                	mov    %eax,%edx
   26d60:	85 d2                	test   %edx,%edx
   26d62:	0f 84 18 ef ff ff    	je     25c80 <JS_CallInternal+0x830>
   26d68:	48 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%rax
   26d6f:	89 d1                	mov    %edx,%ecx
   26d71:	4c 8b 95 d0 fd ff ff 	mov    -0x230(%rbp),%r10
   26d78:	4c 8b 9d d8 fd ff ff 	mov    -0x228(%rbp),%r11
   26d7f:	4c 8b 8d c0 fd ff ff 	mov    -0x240(%rbp),%r9
   26d86:	48 8b 70 18          	mov    0x18(%rax),%rsi
   26d8a:	8b 46 18             	mov    0x18(%rsi),%eax
   26d8d:	21 c1                	and    %eax,%ecx
   26d8f:	8b 4c 8e 38          	mov    0x38(%rsi,%rcx,4),%ecx
   26d93:	48 85 c9             	test   %rcx,%rcx
   26d96:	0f 84 d2 83 00 00    	je     2f16e <JS_CallInternal+0x9d1e>
   26d9c:	48 8d 3c 85 3c 00 00 	lea    0x3c(,%rax,4),%rdi
   26da3:	00 
   26da4:	48 8d 44 cf f8       	lea    -0x8(%rdi,%rcx,8),%rax
   26da9:	48 01 f0             	add    %rsi,%rax
   26dac:	3b 50 04             	cmp    0x4(%rax),%edx
   26daf:	0f 85 ab 83 00 00    	jne    2f160 <JS_CallInternal+0x9d10>
   26db5:	b8 01 00 00 00       	mov    $0x1,%eax
   26dba:	81 fa f2 00 00 00    	cmp    $0xf2,%edx
   26dc0:	0f 8f ba 64 00 00    	jg     2d280 <JS_CallInternal+0x7e30>
   26dc6:	83 bd e8 fd ff ff f6 	cmpl   $0xfffffff6,-0x218(%rbp)
   26dcd:	76 1e                	jbe    26ded <JS_CallInternal+0x199d>
   26dcf:	48 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%rcx
   26dd6:	8b 51 fc             	mov    -0x4(%rcx),%edx
   26dd9:	89 95 d0 fd ff ff    	mov    %edx,-0x230(%rbp)
   26ddf:	83 ea 01             	sub    $0x1,%edx
   26de2:	89 51 fc             	mov    %edx,-0x4(%rcx)
   26de5:	85 d2                	test   %edx,%edx
   26de7:	0f 8e 1f 69 00 00    	jle    2d70c <JS_CallInternal+0x82bc>
   26ded:	41 83 f9 f6          	cmp    $0xfffffff6,%r9d
   26df1:	76 13                	jbe    26e06 <JS_CallInternal+0x19b6>
   26df3:	41 8b 4a fc          	mov    -0x4(%r10),%ecx
   26df7:	8d 51 ff             	lea    -0x1(%rcx),%edx
   26dfa:	41 89 52 fc          	mov    %edx,-0x4(%r10)
   26dfe:	85 d2                	test   %edx,%edx
   26e00:	0f 8e 0f 6e 00 00    	jle    2dc15 <JS_CallInternal+0x87c5>
   26e06:	48 89 43 e0          	mov    %rax,-0x20(%rbx)
   26e0a:	49 83 c4 01          	add    $0x1,%r12
   26e0e:	48 83 eb 10          	sub    $0x10,%rbx
   26e12:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   26e19:	00 
   26e1a:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   26e20:	49 89 c2             	mov    %rax,%r10
   26e23:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26e27:	ff e0                	jmp    *%rax
   26e29:	f3 0f 1e fa          	endbr64
   26e2d:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   26e34:	4c 89 60 30          	mov    %r12,0x30(%rax)
   26e38:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   26e3c:	48 89 85 d0 fd ff ff 	mov    %rax,-0x230(%rbp)
   26e43:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   26e47:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   26e4e:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   26e52:	48 89 85 c0 fd ff ff 	mov    %rax,-0x240(%rbp)
   26e59:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   26e5d:	48 89 85 e8 fd ff ff 	mov    %rax,-0x218(%rbp)
   26e64:	83 f8 ff             	cmp    $0xffffffff,%eax
   26e67:	0f 85 31 8a 00 00    	jne    2f89e <JS_CallInternal+0xa44e>
   26e6d:	48 8b b5 d0 fd ff ff 	mov    -0x230(%rbp),%rsi
   26e74:	48 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%rdx
   26e7b:	4c 89 ef             	mov    %r13,%rdi
   26e7e:	e8 2d 05 02 00       	call   473b0 <JS_ValueToAtom>
   26e83:	89 c1                	mov    %eax,%ecx
   26e85:	85 c0                	test   %eax,%eax
   26e87:	0f 84 f3 ed ff ff    	je     25c80 <JS_CallInternal+0x830>
   26e8d:	48 8b b5 c0 fd ff ff 	mov    -0x240(%rbp),%rsi
   26e94:	48 8b 95 e8 fd ff ff 	mov    -0x218(%rbp),%rdx
   26e9b:	4c 89 ef             	mov    %r13,%rdi
   26e9e:	89 85 b0 fd ff ff    	mov    %eax,-0x250(%rbp)
   26ea4:	e8 37 98 04 00       	call   706e0 <JS_HasProperty>
   26ea9:	8b 8d b0 fd ff ff    	mov    -0x250(%rbp),%ecx
   26eaf:	41 89 c0             	mov    %eax,%r8d
   26eb2:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   26eb8:	0f 8f f2 5e 00 00    	jg     2cdb0 <JS_CallInternal+0x7960>
   26ebe:	45 85 c0             	test   %r8d,%r8d
   26ec1:	0f 88 b9 ed ff ff    	js     25c80 <JS_CallInternal+0x830>
   26ec7:	83 bd f0 fd ff ff f6 	cmpl   $0xfffffff6,-0x210(%rbp)
   26ece:	76 1e                	jbe    26eee <JS_CallInternal+0x1a9e>
   26ed0:	48 8b 8d d0 fd ff ff 	mov    -0x230(%rbp),%rcx
   26ed7:	8b 41 fc             	mov    -0x4(%rcx),%eax
   26eda:	89 85 b0 fd ff ff    	mov    %eax,-0x250(%rbp)
   26ee0:	83 e8 01             	sub    $0x1,%eax
   26ee3:	89 41 fc             	mov    %eax,-0x4(%rcx)
   26ee6:	85 c0                	test   %eax,%eax
   26ee8:	0f 8e e1 7b 00 00    	jle    2eacf <JS_CallInternal+0x967f>
   26eee:	83 bd e8 fd ff ff f6 	cmpl   $0xfffffff6,-0x218(%rbp)
   26ef5:	76 1e                	jbe    26f15 <JS_CallInternal+0x1ac5>
   26ef7:	48 8b 8d c0 fd ff ff 	mov    -0x240(%rbp),%rcx
   26efe:	8b 41 fc             	mov    -0x4(%rcx),%eax
   26f01:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   26f07:	83 e8 01             	sub    $0x1,%eax
   26f0a:	89 41 fc             	mov    %eax,-0x4(%rcx)
   26f0d:	85 c0                	test   %eax,%eax
   26f0f:	0f 8e 94 7b 00 00    	jle    2eaa9 <JS_CallInternal+0x9659>
   26f15:	31 c0                	xor    %eax,%eax
   26f17:	45 85 c0             	test   %r8d,%r8d
   26f1a:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   26f21:	00 
   26f22:	0f 95 c0             	setne  %al
   26f25:	48 83 eb 10          	sub    $0x10,%rbx
   26f29:	49 83 c4 01          	add    $0x1,%r12
   26f2d:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   26f31:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   26f37:	49 89 c2             	mov    %rax,%r10
   26f3a:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26f3e:	ff e0                	jmp    *%rax
   26f40:	f3 0f 1e fa          	endbr64
   26f44:	4c 8b 43 e8          	mov    -0x18(%rbx),%r8
   26f48:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   26f4c:	4c 8b 53 f0          	mov    -0x10(%rbx),%r10
   26f50:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   26f54:	45 85 c0             	test   %r8d,%r8d
   26f57:	0f 85 46 6f 00 00    	jne    2dea3 <JS_CallInternal+0x8a53>
   26f5d:	85 c9                	test   %ecx,%ecx
   26f5f:	0f 85 8c 55 00 00    	jne    2c4f1 <JS_CallInternal+0x70a1>
   26f65:	31 c0                	xor    %eax,%eax
   26f67:	44 39 d2             	cmp    %r10d,%edx
   26f6a:	0f 95 c0             	setne  %al
   26f6d:	48 89 43 e0          	mov    %rax,-0x20(%rbx)
   26f71:	49 83 c4 01          	add    $0x1,%r12
   26f75:	48 83 eb 10          	sub    $0x10,%rbx
   26f79:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   26f80:	00 
   26f81:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   26f87:	49 89 c2             	mov    %rax,%r10
   26f8a:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26f8e:	ff e0                	jmp    *%rax
   26f90:	f3 0f 1e fa          	endbr64
   26f94:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   26f98:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   26f9c:	4c 8b 53 f0          	mov    -0x10(%rbx),%r10
   26fa0:	4c 8b 43 f8          	mov    -0x8(%rbx),%r8
   26fa4:	85 d2                	test   %edx,%edx
   26fa6:	0f 85 b3 7b 00 00    	jne    2eb5f <JS_CallInternal+0x970f>
   26fac:	45 85 c0             	test   %r8d,%r8d
   26faf:	0f 85 69 55 00 00    	jne    2c51e <JS_CallInternal+0x70ce>
   26fb5:	31 c0                	xor    %eax,%eax
   26fb7:	44 39 d7             	cmp    %r10d,%edi
   26fba:	0f 94 c0             	sete   %al
   26fbd:	48 89 43 e0          	mov    %rax,-0x20(%rbx)
   26fc1:	49 83 c4 01          	add    $0x1,%r12
   26fc5:	48 83 eb 10          	sub    $0x10,%rbx
   26fc9:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   26fd0:	00 
   26fd1:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   26fd7:	49 89 c2             	mov    %rax,%r10
   26fda:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   26fde:	ff e0                	jmp    *%rax
   26fe0:	f3 0f 1e fa          	endbr64
   26fe4:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   26fe8:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   26fec:	4c 8b 4b f0          	mov    -0x10(%rbx),%r9
   26ff0:	4c 8b 43 f8          	mov    -0x8(%rbx),%r8
   26ff4:	85 d2                	test   %edx,%edx
   26ff6:	0f 85 0c 6e 00 00    	jne    2de08 <JS_CallInternal+0x89b8>
   26ffc:	45 85 c0             	test   %r8d,%r8d
   26fff:	0f 85 c4 54 00 00    	jne    2c4c9 <JS_CallInternal+0x7079>
   27005:	31 c9                	xor    %ecx,%ecx
   27007:	44 39 cf             	cmp    %r9d,%edi
   2700a:	0f 94 c1             	sete   %cl
   2700d:	83 f1 01             	xor    $0x1,%ecx
   27010:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   27017:	00 
   27018:	48 63 c1             	movslq %ecx,%rax
   2701b:	48 89 43 e0          	mov    %rax,-0x20(%rbx)
   2701f:	41 0f b6 04 24       	movzbl (%r12),%eax
   27024:	48 83 eb 10          	sub    $0x10,%rbx
   27028:	49 83 c4 01          	add    $0x1,%r12
   2702c:	49 89 c2             	mov    %rax,%r10
   2702f:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27033:	ff e0                	jmp    *%rax
   27035:	f3 0f 1e fa          	endbr64
   27039:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   2703d:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   27041:	4c 8b 4b f0          	mov    -0x10(%rbx),%r9
   27045:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   27049:	85 d2                	test   %edx,%edx
   2704b:	0f 85 9d 7c 00 00    	jne    2ecee <JS_CallInternal+0x989e>
   27051:	85 c9                	test   %ecx,%ecx
   27053:	0f 85 46 54 00 00    	jne    2c49f <JS_CallInternal+0x704f>
   27059:	45 31 c0             	xor    %r8d,%r8d
   2705c:	44 39 cf             	cmp    %r9d,%edi
   2705f:	41 0f 94 c0          	sete   %r8b
   27063:	4d 63 c0             	movslq %r8d,%r8
   27066:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   2706d:	00 
   2706e:	4c 89 43 e0          	mov    %r8,-0x20(%rbx)
   27072:	41 0f b6 04 24       	movzbl (%r12),%eax
   27077:	48 83 eb 10          	sub    $0x10,%rbx
   2707b:	49 83 c4 01          	add    $0x1,%r12
   2707f:	49 89 c2             	mov    %rax,%r10
   27082:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27086:	ff e0                	jmp    *%rax
   27088:	f3 0f 1e fa          	endbr64
   2708c:	48 8b 43 d8          	mov    -0x28(%rbx),%rax
   27090:	48 8b 53 d0          	mov    -0x30(%rbx),%rdx
   27094:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27097:	76 04                	jbe    2709d <JS_CallInternal+0x1c4d>
   27099:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2709d:	48 89 43 08          	mov    %rax,0x8(%rbx)
   270a1:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   270a5:	48 89 13             	mov    %rdx,(%rbx)
   270a8:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   270ac:	83 f8 f6             	cmp    $0xfffffff6,%eax
   270af:	76 04                	jbe    270b5 <JS_CallInternal+0x1c65>
   270b1:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   270b5:	48 89 43 18          	mov    %rax,0x18(%rbx)
   270b9:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   270bd:	48 89 53 10          	mov    %rdx,0x10(%rbx)
   270c1:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   270c5:	83 f8 f6             	cmp    $0xfffffff6,%eax
   270c8:	76 04                	jbe    270ce <JS_CallInternal+0x1c7e>
   270ca:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   270ce:	48 89 53 20          	mov    %rdx,0x20(%rbx)
   270d2:	49 83 c4 01          	add    $0x1,%r12
   270d6:	48 83 c3 30          	add    $0x30,%rbx
   270da:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   270de:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   270e4:	49 89 c2             	mov    %rax,%r10
   270e7:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   270eb:	ff e0                	jmp    *%rax
   270ed:	f3 0f 1e fa          	endbr64
   270f1:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   270f5:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   270f9:	83 f8 f6             	cmp    $0xfffffff6,%eax
   270fc:	76 04                	jbe    27102 <JS_CallInternal+0x1cb2>
   270fe:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27102:	48 89 43 08          	mov    %rax,0x8(%rbx)
   27106:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2710a:	48 89 13             	mov    %rdx,(%rbx)
   2710d:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   27111:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27114:	76 04                	jbe    2711a <JS_CallInternal+0x1cca>
   27116:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2711a:	48 89 53 10          	mov    %rdx,0x10(%rbx)
   2711e:	49 83 c4 01          	add    $0x1,%r12
   27122:	48 83 c3 20          	add    $0x20,%rbx
   27126:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2712a:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27130:	49 89 c2             	mov    %rax,%r10
   27133:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27137:	ff e0                	jmp    *%rax
   27139:	f3 0f 1e fa          	endbr64
   2713d:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   27144:	f3 0f 6f 63 f0       	movdqu -0x10(%rbx),%xmm4
   27149:	4c 8b 53 f8          	mov    -0x8(%rbx),%r10
   2714d:	4c 89 60 30          	mov    %r12,0x30(%rax)
   27151:	0f 29 a5 f0 fd ff ff 	movaps %xmm4,-0x210(%rbp)
   27158:	41 83 fa ff          	cmp    $0xffffffff,%r10d
   2715c:	0f 84 a4 52 00 00    	je     2c406 <JS_CallInternal+0x6fb6>
   27162:	41 83 fa 02          	cmp    $0x2,%r10d
   27166:	0f 84 9a 52 00 00    	je     2c406 <JS_CallInternal+0x6fb6>
   2716c:	41 83 fa f6          	cmp    $0xfffffff6,%r10d
   27170:	76 18                	jbe    2718a <JS_CallInternal+0x1d3a>
   27172:	48 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%rax
   27179:	8b 48 fc             	mov    -0x4(%rax),%ecx
   2717c:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2717f:	89 50 fc             	mov    %edx,-0x4(%rax)
   27182:	85 d2                	test   %edx,%edx
   27184:	0f 8e fa 68 00 00    	jle    2da84 <JS_CallInternal+0x8634>
   2718a:	41 0f b6 04 24       	movzbl (%r12),%eax
   2718f:	48 83 eb 10          	sub    $0x10,%rbx
   27193:	49 83 c4 01          	add    $0x1,%r12
   27197:	49 89 c2             	mov    %rax,%r10
   2719a:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2719e:	ff e0                	jmp    *%rax
   271a0:	f3 0f 1e fa          	endbr64
   271a4:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   271a8:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   271ac:	4c 89 ef             	mov    %r13,%rdi
   271af:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   271b3:	4c 8b 43 e8          	mov    -0x18(%rbx),%r8
   271b7:	e8 d4 05 02 00       	call   47790 <JS_DefineObjectNameComputed.constprop.0>
   271bc:	83 f8 ff             	cmp    $0xffffffff,%eax
   271bf:	0f 84 bb ea ff ff    	je     25c80 <JS_CallInternal+0x830>
   271c5:	41 0f b6 04 24       	movzbl (%r12),%eax
   271ca:	49 83 c4 01          	add    $0x1,%r12
   271ce:	49 89 c2             	mov    %rax,%r10
   271d1:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   271d5:	ff e0                	jmp    *%rax
   271d7:	f3 0f 1e fa          	endbr64
   271db:	41 8b 0c 24          	mov    (%r12),%ecx
   271df:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   271e3:	4c 89 ef             	mov    %r13,%rdi
   271e6:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   271ea:	e8 a1 54 01 00       	call   3c690 <JS_DefineObjectName.constprop.0>
   271ef:	83 f8 ff             	cmp    $0xffffffff,%eax
   271f2:	0f 84 7d 6d 00 00    	je     2df75 <JS_CallInternal+0x8b25>
   271f8:	41 0f b6 44 24 04    	movzbl 0x4(%r12),%eax
   271fe:	49 83 c4 05          	add    $0x5,%r12
   27202:	49 89 c2             	mov    %rax,%r10
   27205:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27209:	ff e0                	jmp    *%rax
   2720b:	f3 0f 1e fa          	endbr64
   2720f:	48 83 ec 08          	sub    $0x8,%rsp
   27213:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   27217:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2721b:	4c 89 ef             	mov    %r13,%rdi
   2721e:	41 8b 0c 24          	mov    (%r12),%ecx
   27222:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   27226:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   2722a:	68 07 40 00 00       	push   $0x4007
   2722f:	e8 5c c4 00 00       	call   33690 <JS_DefinePropertyValue>
   27234:	41 58                	pop    %r8
   27236:	41 59                	pop    %r9
   27238:	85 c0                	test   %eax,%eax
   2723a:	0f 88 d9 76 00 00    	js     2e919 <JS_CallInternal+0x94c9>
   27240:	41 0f b6 44 24 04    	movzbl 0x4(%r12),%eax
   27246:	48 83 eb 10          	sub    $0x10,%rbx
   2724a:	49 83 c4 05          	add    $0x5,%r12
   2724e:	49 89 c2             	mov    %rax,%r10
   27251:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27255:	ff e0                	jmp    *%rax
   27257:	f3 0f 1e fa          	endbr64
   2725b:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2725f:	48 8d 43 e0          	lea    -0x20(%rbx),%rax
   27263:	4c 8b 43 d0          	mov    -0x30(%rbx),%r8
   27267:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   2726e:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   27272:	48 89 8d e8 fd ff ff 	mov    %rcx,-0x218(%rbp)
   27279:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2727d:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   27281:	48 89 8d d0 fd ff ff 	mov    %rcx,-0x230(%rbp)
   27288:	83 7b d8 ff          	cmpl   $0xffffffff,-0x28(%rbx)
   2728c:	0f 85 cd 6c 00 00    	jne    2df5f <JS_CallInternal+0x8b0f>
   27292:	83 f8 f8             	cmp    $0xfffffff8,%eax
   27295:	0f 85 ae 6c 00 00    	jne    2df49 <JS_CallInternal+0x8af9>
   2729b:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2729f:	4c 89 85 c0 fd ff ff 	mov    %r8,-0x240(%rbp)
   272a6:	e8 55 0f ff ff       	call   18200 <js_get_atom_index>
   272ab:	4c 8b 85 c0 fd ff ff 	mov    -0x240(%rbp),%r8
   272b2:	89 c6                	mov    %eax,%esi
   272b4:	49 8b 48 18          	mov    0x18(%r8),%rcx
   272b8:	89 f2                	mov    %esi,%edx
   272ba:	8b 41 18             	mov    0x18(%rcx),%eax
   272bd:	21 c2                	and    %eax,%edx
   272bf:	8b 54 91 38          	mov    0x38(%rcx,%rdx,4),%edx
   272c3:	48 85 d2             	test   %rdx,%rdx
   272c6:	0f 84 84 4c 00 00    	je     2bf50 <JS_CallInternal+0x6b00>
   272cc:	48 8d 3c 85 3c 00 00 	lea    0x3c(,%rax,4),%rdi
   272d3:	00 
   272d4:	48 8d 44 d7 f8       	lea    -0x8(%rdi,%rdx,8),%rax
   272d9:	48 01 c8             	add    %rcx,%rax
   272dc:	3b 70 04             	cmp    0x4(%rax),%esi
   272df:	0f 85 5d 4c 00 00    	jne    2bf42 <JS_CallInternal+0x6af2>
   272e5:	48 8d 0d 58 1e 0b 00 	lea    0xb1e58(%rip),%rcx        # d9144 <_IO_stdin_used+0x144>
   272ec:	48 8d 15 85 5b 0b 00 	lea    0xb5b85(%rip),%rdx        # dce78 <_IO_stdin_used+0x3e78>
   272f3:	4c 89 ef             	mov    %r13,%rdi
   272f6:	31 c0                	xor    %eax,%eax
   272f8:	e8 d3 d4 00 00       	call   347d0 <__JS_ThrowTypeErrorAtom>
   272fd:	83 bd d0 fd ff ff f6 	cmpl   $0xfffffff6,-0x230(%rbp)
   27304:	76 1e                	jbe    27324 <JS_CallInternal+0x1ed4>
   27306:	48 8b 9d e8 fd ff ff 	mov    -0x218(%rbp),%rbx
   2730d:	8b 43 fc             	mov    -0x4(%rbx),%eax
   27310:	89 85 c0 fd ff ff    	mov    %eax,-0x240(%rbp)
   27316:	83 e8 01             	sub    $0x1,%eax
   27319:	89 43 fc             	mov    %eax,-0x4(%rbx)
   2731c:	85 c0                	test   %eax,%eax
   2731e:	0f 8e 6e 8b 00 00    	jle    2fe92 <JS_CallInternal+0xaa42>
   27324:	48 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%rbx
   2732b:	48 8b 43 08          	mov    0x8(%rbx),%rax
   2732f:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27332:	0f 86 48 e9 ff ff    	jbe    25c80 <JS_CallInternal+0x830>
   27338:	48 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%rbx
   2733f:	48 8b 0b             	mov    (%rbx),%rcx
   27342:	8b 79 fc             	mov    -0x4(%rcx),%edi
   27345:	8d 57 ff             	lea    -0x1(%rdi),%edx
   27348:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2734b:	85 d2                	test   %edx,%edx
   2734d:	0f 8f 2d e9 ff ff    	jg     25c80 <JS_CallInternal+0x830>
   27353:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   27357:	48 89 c2             	mov    %rax,%rdx
   2735a:	48 89 ce             	mov    %rcx,%rsi
   2735d:	e8 3e 76 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   27362:	e9 19 e9 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   27367:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   2736e:	00 00 
   27370:	f3 0f 1e fa          	endbr64
   27374:	41 0f b7 04 24       	movzwl (%r12),%eax
   27379:	48 c1 e0 04          	shl    $0x4,%rax
   2737d:	48 03 85 58 fe ff ff 	add    -0x1a8(%rbp),%rax
   27384:	48 8b 50 08          	mov    0x8(%rax),%rdx
   27388:	48 8b 08             	mov    (%rax),%rcx
   2738b:	48 c7 40 08 04 00 00 	movq   $0x4,0x8(%rax)
   27392:	00 
   27393:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
   2739a:	83 fa f6             	cmp    $0xfffffff6,%edx
   2739d:	76 11                	jbe    273b0 <JS_CallInternal+0x1f60>
   2739f:	8b 41 fc             	mov    -0x4(%rcx),%eax
   273a2:	83 e8 01             	sub    $0x1,%eax
   273a5:	89 41 fc             	mov    %eax,-0x4(%rcx)
   273a8:	85 c0                	test   %eax,%eax
   273aa:	0f 8e 15 63 00 00    	jle    2d6c5 <JS_CallInternal+0x8275>
   273b0:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   273b6:	49 83 c4 03          	add    $0x3,%r12
   273ba:	49 89 c2             	mov    %rax,%r10
   273bd:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   273c1:	ff e0                	jmp    *%rax
   273c3:	f3 0f 1e fa          	endbr64
   273c7:	41 0f b7 14 24       	movzwl (%r12),%edx
   273cc:	48 8b 85 48 fe ff ff 	mov    -0x1b8(%rbp),%rax
   273d3:	49 8d 4c 24 02       	lea    0x2(%r12),%rcx
   273d8:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   273dc:	48 8b 40 18          	mov    0x18(%rax),%rax
   273e0:	83 78 08 04          	cmpl   $0x4,0x8(%rax)
   273e4:	0f 85 8d 70 00 00    	jne    2e477 <JS_CallInternal+0x9027>
   273ea:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   273ef:	49 83 c4 03          	add    $0x3,%r12
   273f3:	48 83 eb 10          	sub    $0x10,%rbx
   273f7:	0f 11 00             	movups %xmm0,(%rax)
   273fa:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27400:	49 89 c2             	mov    %rax,%r10
   27403:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27407:	ff e0                	jmp    *%rax
   27409:	f3 0f 1e fa          	endbr64
   2740d:	41 0f b7 34 24       	movzwl (%r12),%esi
   27412:	48 8b 85 48 fe ff ff 	mov    -0x1b8(%rbp),%rax
   27419:	49 8d 4c 24 02       	lea    0x2(%r12),%rcx
   2741e:	48 8b 04 f0          	mov    (%rax,%rsi,8),%rax
   27422:	48 8b 50 18          	mov    0x18(%rax),%rdx
   27426:	48 8b 42 08          	mov    0x8(%rdx),%rax
   2742a:	83 f8 04             	cmp    $0x4,%eax
   2742d:	0f 84 c1 73 00 00    	je     2e7f4 <JS_CallInternal+0x93a4>
   27433:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   27438:	48 8b 0a             	mov    (%rdx),%rcx
   2743b:	0f 11 02             	movups %xmm0,(%rdx)
   2743e:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27441:	76 11                	jbe    27454 <JS_CallInternal+0x2004>
   27443:	8b 51 fc             	mov    -0x4(%rcx),%edx
   27446:	83 ea 01             	sub    $0x1,%edx
   27449:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2744c:	85 d2                	test   %edx,%edx
   2744e:	0f 8e 82 62 00 00    	jle    2d6d6 <JS_CallInternal+0x8286>
   27454:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   2745a:	48 83 eb 10          	sub    $0x10,%rbx
   2745e:	49 83 c4 03          	add    $0x3,%r12
   27462:	49 89 c2             	mov    %rax,%r10
   27465:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27469:	ff e0                	jmp    *%rax
   2746b:	f3 0f 1e fa          	endbr64
   2746f:	31 c0                	xor    %eax,%eax
   27471:	b9 01 00 00 00       	mov    $0x1,%ecx
   27476:	e9 85 e8 ff ff       	jmp    25d00 <JS_CallInternal+0x8b0>
   2747b:	f3 0f 1e fa          	endbr64
   2747f:	31 c0                	xor    %eax,%eax
   27481:	31 c9                	xor    %ecx,%ecx
   27483:	e9 78 e8 ff ff       	jmp    25d00 <JS_CallInternal+0x8b0>
   27488:	f3 0f 1e fa          	endbr64
   2748c:	e9 ef e2 ff ff       	jmp    25780 <JS_CallInternal+0x330>
   27491:	f3 0f 1e fa          	endbr64
   27495:	31 c0                	xor    %eax,%eax
   27497:	b9 03 00 00 00       	mov    $0x3,%ecx
   2749c:	e9 5f e8 ff ff       	jmp    25d00 <JS_CallInternal+0x8b0>
   274a1:	f3 0f 1e fa          	endbr64
   274a5:	b8 03 00 00 00       	mov    $0x3,%eax
   274aa:	31 c9                	xor    %ecx,%ecx
   274ac:	e9 4f e8 ff ff       	jmp    25d00 <JS_CallInternal+0x8b0>
   274b1:	f3 0f 1e fa          	endbr64
   274b5:	4c 8b 43 f8          	mov    -0x8(%rbx),%r8
   274b9:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   274bd:	4c 89 ef             	mov    %r13,%rdi
   274c0:	4c 89 c2             	mov    %r8,%rdx
   274c3:	e8 18 da ff ff       	call   24ee0 <js_operator_typeof>
   274c8:	89 c1                	mov    %eax,%ecx
   274ca:	41 83 f8 f6          	cmp    $0xfffffff6,%r8d
   274ce:	76 11                	jbe    274e1 <JS_CallInternal+0x2091>
   274d0:	8b 46 fc             	mov    -0x4(%rsi),%eax
   274d3:	83 e8 01             	sub    $0x1,%eax
   274d6:	89 46 fc             	mov    %eax,-0x4(%rsi)
   274d9:	85 c0                	test   %eax,%eax
   274db:	0f 8e 85 62 00 00    	jle    2d766 <JS_CallInternal+0x8316>
   274e1:	ba 01 00 00 00       	mov    $0x1,%edx
   274e6:	89 ce                	mov    %ecx,%esi
   274e8:	4c 89 ef             	mov    %r13,%rdi
   274eb:	49 83 c4 01          	add    $0x1,%r12
   274ef:	e8 4c 4c 01 00       	call   3c140 <__JS_AtomToValue>
   274f4:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   274f8:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   274fc:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27502:	49 89 c2             	mov    %rax,%r10
   27505:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27509:	ff e0                	jmp    *%rax
   2750b:	f3 0f 1e fa          	endbr64
   2750f:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   27516:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   2751a:	4c 89 ef             	mov    %r13,%rdi
   2751d:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   27521:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   27525:	4c 89 60 30          	mov    %r12,0x30(%rax)
   27529:	4c 8b 43 f8          	mov    -0x8(%rbx),%r8
   2752d:	48 89 8d d0 fd ff ff 	mov    %rcx,-0x230(%rbp)
   27534:	4c 89 85 e8 fd ff ff 	mov    %r8,-0x218(%rbp)
   2753b:	48 89 b5 c0 fd ff ff 	mov    %rsi,-0x240(%rbp)
   27542:	48 89 95 f0 fd ff ff 	mov    %rdx,-0x210(%rbp)
   27549:	e8 82 e4 06 00       	call   959d0 <JS_IsInstanceOf>
   2754e:	85 c0                	test   %eax,%eax
   27550:	0f 88 2a e7 ff ff    	js     25c80 <JS_CallInternal+0x830>
   27556:	48 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%rdx
   2755d:	4c 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%r8
   27564:	48 8b 8d d0 fd ff ff 	mov    -0x230(%rbp),%rcx
   2756b:	83 fa f6             	cmp    $0xfffffff6,%edx
   2756e:	76 18                	jbe    27588 <JS_CallInternal+0x2138>
   27570:	48 8b b5 c0 fd ff ff 	mov    -0x240(%rbp),%rsi
   27577:	8b 7e fc             	mov    -0x4(%rsi),%edi
   2757a:	83 ef 01             	sub    $0x1,%edi
   2757d:	89 7e fc             	mov    %edi,-0x4(%rsi)
   27580:	85 ff                	test   %edi,%edi
   27582:	0f 8e b9 78 00 00    	jle    2ee41 <JS_CallInternal+0x99f1>
   27588:	41 83 f8 f6          	cmp    $0xfffffff6,%r8d
   2758c:	76 11                	jbe    2759f <JS_CallInternal+0x214f>
   2758e:	8b 51 fc             	mov    -0x4(%rcx),%edx
   27591:	83 ea 01             	sub    $0x1,%edx
   27594:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27597:	85 d2                	test   %edx,%edx
   27599:	0f 8e 34 79 00 00    	jle    2eed3 <JS_CallInternal+0x9a83>
   2759f:	85 c0                	test   %eax,%eax
   275a1:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   275a8:	00 
   275a9:	0f 95 c0             	setne  %al
   275ac:	48 83 eb 10          	sub    $0x10,%rbx
   275b0:	49 83 c4 01          	add    $0x1,%r12
   275b4:	0f b6 c0             	movzbl %al,%eax
   275b7:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   275bb:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   275c1:	49 89 c2             	mov    %rax,%r10
   275c4:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   275c8:	ff e0                	jmp    *%rax
   275ca:	f3 0f 1e fa          	endbr64
   275ce:	44 8b 43 f8          	mov    -0x8(%rbx),%r8d
   275d2:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   275d6:	45 85 c0             	test   %r8d,%r8d
   275d9:	0f 85 7d 55 00 00    	jne    2cb5c <JS_CallInternal+0x770c>
   275df:	f7 d0                	not    %eax
   275e1:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   275e8:	00 
   275e9:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   275ed:	41 0f b6 04 24       	movzbl (%r12),%eax
   275f2:	49 83 c4 01          	add    $0x1,%r12
   275f6:	49 89 c2             	mov    %rax,%r10
   275f9:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   275fd:	ff e0                	jmp    *%rax
   275ff:	f3 0f 1e fa          	endbr64
   27603:	41 0f b6 04 24       	movzbl (%r12),%eax
   27608:	48 8b bd 58 fe ff ff 	mov    -0x1a8(%rbp),%rdi
   2760f:	49 8d 4c 24 01       	lea    0x1(%r12),%rcx
   27614:	48 c1 e0 04          	shl    $0x4,%rax
   27618:	4c 8d 04 07          	lea    (%rdi,%rax,1),%r8
   2761c:	49 8b 50 08          	mov    0x8(%r8),%rdx
   27620:	49 8b 00             	mov    (%r8),%rax
   27623:	85 d2                	test   %edx,%edx
   27625:	0f 85 a5 4c 00 00    	jne    2c2d0 <JS_CallInternal+0x6e80>
   2762b:	3d 00 00 00 80       	cmp    $0x80000000,%eax
   27630:	0f 84 9a 4c 00 00    	je     2c2d0 <JS_CallInternal+0x6e80>
   27636:	83 e8 01             	sub    $0x1,%eax
   27639:	49 c7 40 08 00 00 00 	movq   $0x0,0x8(%r8)
   27640:	00 
   27641:	49 89 00             	mov    %rax,(%r8)
   27644:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
   2764a:	49 83 c4 02          	add    $0x2,%r12
   2764e:	49 89 c2             	mov    %rax,%r10
   27651:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27655:	ff e0                	jmp    *%rax
   27657:	f3 0f 1e fa          	endbr64
   2765b:	e9 de e1 ff ff       	jmp    2583e <JS_CallInternal+0x3ee>
   27660:	f3 0f 1e fa          	endbr64
   27664:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   27668:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2766c:	49 8d 4c 24 01       	lea    0x1(%r12),%rcx
   27671:	83 fa 03             	cmp    $0x3,%edx
   27674:	0f 87 06 55 00 00    	ja     2cb80 <JS_CallInternal+0x7730>
   2767a:	48 83 eb 10          	sub    $0x10,%rbx
   2767e:	85 c0                	test   %eax,%eax
   27680:	75 0d                	jne    2768f <JS_CallInternal+0x223f>
   27682:	41 0f be 04 24       	movsbl (%r12),%eax
   27687:	83 e8 01             	sub    $0x1,%eax
   2768a:	48 98                	cltq
   2768c:	48 01 c1             	add    %rax,%rcx
   2768f:	41 8b 85 a8 01 00 00 	mov    0x1a8(%r13),%eax
   27696:	83 e8 01             	sub    $0x1,%eax
   27699:	41 89 85 a8 01 00 00 	mov    %eax,0x1a8(%r13)
   276a0:	85 c0                	test   %eax,%eax
   276a2:	0f 8e b1 6e 00 00    	jle    2e559 <JS_CallInternal+0x9109>
   276a8:	0f b6 01             	movzbl (%rcx),%eax
   276ab:	4c 8d 61 01          	lea    0x1(%rcx),%r12
   276af:	49 89 c2             	mov    %rax,%r10
   276b2:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   276b6:	f3 0f 1e fa          	endbr64
   276ba:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   276be:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   276c2:	49 8d 4c 24 01       	lea    0x1(%r12),%rcx
   276c7:	83 fa 03             	cmp    $0x3,%edx
   276ca:	0f 87 ec 54 00 00    	ja     2cbbc <JS_CallInternal+0x776c>
   276d0:	48 83 eb 10          	sub    $0x10,%rbx
   276d4:	85 c0                	test   %eax,%eax
   276d6:	74 0d                	je     276e5 <JS_CallInternal+0x2295>
   276d8:	41 0f be 04 24       	movsbl (%r12),%eax
   276dd:	83 e8 01             	sub    $0x1,%eax
   276e0:	48 98                	cltq
   276e2:	48 01 c1             	add    %rax,%rcx
   276e5:	41 8b 85 a8 01 00 00 	mov    0x1a8(%r13),%eax
   276ec:	83 e8 01             	sub    $0x1,%eax
   276ef:	41 89 85 a8 01 00 00 	mov    %eax,0x1a8(%r13)
   276f6:	85 c0                	test   %eax,%eax
   276f8:	0f 8e 81 6f 00 00    	jle    2e67f <JS_CallInternal+0x922f>
   276fe:	0f b6 01             	movzbl (%rcx),%eax
   27701:	4c 8d 61 01          	lea    0x1(%rcx),%r12
   27705:	49 89 c2             	mov    %rax,%r10
   27708:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2770c:	f3 0f 1e fa          	endbr64
   27710:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   27714:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   27718:	49 8d 4c 24 04       	lea    0x4(%r12),%rcx
   2771d:	83 fa 03             	cmp    $0x3,%edx
   27720:	0f 87 78 54 00 00    	ja     2cb9e <JS_CallInternal+0x774e>
   27726:	48 83 eb 10          	sub    $0x10,%rbx
   2772a:	85 c0                	test   %eax,%eax
   2772c:	75 0c                	jne    2773a <JS_CallInternal+0x22ea>
   2772e:	41 8b 04 24          	mov    (%r12),%eax
   27732:	83 e8 04             	sub    $0x4,%eax
   27735:	48 98                	cltq
   27737:	48 01 c1             	add    %rax,%rcx
   2773a:	41 8b 85 a8 01 00 00 	mov    0x1a8(%r13),%eax
   27741:	83 e8 01             	sub    $0x1,%eax
   27744:	41 89 85 a8 01 00 00 	mov    %eax,0x1a8(%r13)
   2774b:	85 c0                	test   %eax,%eax
   2774d:	0f 8e 52 6f 00 00    	jle    2e6a5 <JS_CallInternal+0x9255>
   27753:	0f b6 01             	movzbl (%rcx),%eax
   27756:	4c 8d 61 01          	lea    0x1(%rcx),%r12
   2775a:	49 89 c2             	mov    %rax,%r10
   2775d:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   27761:	f3 0f 1e fa          	endbr64
   27765:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   27769:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2776d:	49 8d 4c 24 04       	lea    0x4(%r12),%rcx
   27772:	83 fa 03             	cmp    $0x3,%edx
   27775:	0f 87 5f 54 00 00    	ja     2cbda <JS_CallInternal+0x778a>
   2777b:	48 83 eb 10          	sub    $0x10,%rbx
   2777f:	85 c0                	test   %eax,%eax
   27781:	74 0c                	je     2778f <JS_CallInternal+0x233f>
   27783:	41 8b 04 24          	mov    (%r12),%eax
   27787:	83 e8 04             	sub    $0x4,%eax
   2778a:	48 98                	cltq
   2778c:	48 01 c1             	add    %rax,%rcx
   2778f:	41 8b 85 a8 01 00 00 	mov    0x1a8(%r13),%eax
   27796:	83 e8 01             	sub    $0x1,%eax
   27799:	41 89 85 a8 01 00 00 	mov    %eax,0x1a8(%r13)
   277a0:	85 c0                	test   %eax,%eax
   277a2:	0f 8e f4 6d 00 00    	jle    2e59c <JS_CallInternal+0x914c>
   277a8:	0f b6 01             	movzbl (%rcx),%eax
   277ab:	4c 8d 61 01          	lea    0x1(%rcx),%r12
   277af:	49 89 c2             	mov    %rax,%r10
   277b2:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   277b6:	f3 0f 1e fa          	endbr64
   277ba:	41 8b 85 a8 01 00 00 	mov    0x1a8(%r13),%eax
   277c1:	49 0f be 14 24       	movsbq (%r12),%rdx
   277c6:	83 e8 01             	sub    $0x1,%eax
   277c9:	4c 01 e2             	add    %r12,%rdx
   277cc:	41 89 85 a8 01 00 00 	mov    %eax,0x1a8(%r13)
   277d3:	85 c0                	test   %eax,%eax
   277d5:	0f 8e 72 6e 00 00    	jle    2e64d <JS_CallInternal+0x91fd>
   277db:	0f b6 02             	movzbl (%rdx),%eax
   277de:	4c 8d 62 01          	lea    0x1(%rdx),%r12
   277e2:	49 89 c2             	mov    %rax,%r10
   277e5:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   277e9:	f3 0f 1e fa          	endbr64
   277ed:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   277f1:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   277f5:	83 fa f6             	cmp    $0xfffffff6,%edx
   277f8:	76 04                	jbe    277fe <JS_CallInternal+0x23ae>
   277fa:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   277fe:	48 8b bd 58 fe ff ff 	mov    -0x1a8(%rbp),%rdi
   27805:	48 8b 47 38          	mov    0x38(%rdi),%rax
   27809:	48 8b 77 30          	mov    0x30(%rdi),%rsi
   2780d:	48 89 57 38          	mov    %rdx,0x38(%rdi)
   27811:	48 89 4f 30          	mov    %rcx,0x30(%rdi)
   27815:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27818:	76 11                	jbe    2782b <JS_CallInternal+0x23db>
   2781a:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   2781d:	8d 51 ff             	lea    -0x1(%rcx),%edx
   27820:	89 56 fc             	mov    %edx,-0x4(%rsi)
   27823:	85 d2                	test   %edx,%edx
   27825:	0f 8e 37 62 00 00    	jle    2da62 <JS_CallInternal+0x8612>
   2782b:	41 0f b6 04 24       	movzbl (%r12),%eax
   27830:	49 83 c4 01          	add    $0x1,%r12
   27834:	49 89 c2             	mov    %rax,%r10
   27837:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2783b:	ff e0                	jmp    *%rax
   2783d:	f3 0f 1e fa          	endbr64
   27841:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   27845:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   27849:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   2784d:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   27851:	89 cf                	mov    %ecx,%edi
   27853:	09 f7                	or     %esi,%edi
   27855:	0f 85 e4 71 00 00    	jne    2ea3f <JS_CallInternal+0x95ef>
   2785b:	39 d0                	cmp    %edx,%eax
   2785d:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   27864:	00 
   27865:	0f 9e c0             	setle  %al
   27868:	48 83 eb 10          	sub    $0x10,%rbx
   2786c:	0f b6 c0             	movzbl %al,%eax
   2786f:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   27873:	41 0f b6 04 24       	movzbl (%r12),%eax
   27878:	49 83 c4 01          	add    $0x1,%r12
   2787c:	49 89 c2             	mov    %rax,%r10
   2787f:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27883:	ff e0                	jmp    *%rax
   27885:	f3 0f 1e fa          	endbr64
   27889:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2788d:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   27891:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   27895:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   27899:	89 cf                	mov    %ecx,%edi
   2789b:	09 f7                	or     %esi,%edi
   2789d:	0f 85 32 71 00 00    	jne    2e9d5 <JS_CallInternal+0x9585>
   278a3:	39 d0                	cmp    %edx,%eax
   278a5:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   278ac:	00 
   278ad:	0f 9c c0             	setl   %al
   278b0:	48 83 eb 10          	sub    $0x10,%rbx
   278b4:	0f b6 c0             	movzbl %al,%eax
   278b7:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   278bb:	41 0f b6 04 24       	movzbl (%r12),%eax
   278c0:	49 83 c4 01          	add    $0x1,%r12
   278c4:	49 89 c2             	mov    %rax,%r10
   278c7:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   278cb:	ff e0                	jmp    *%rax
   278cd:	f3 0f 1e fa          	endbr64
   278d1:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   278d5:	0b 53 e8             	or     -0x18(%rbx),%edx
   278d8:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   278dc:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   278e0:	0f 85 2f 71 00 00    	jne    2ea15 <JS_CallInternal+0x95c5>
   278e6:	31 c8                	xor    %ecx,%eax
   278e8:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   278ef:	00 
   278f0:	48 83 eb 10          	sub    $0x10,%rbx
   278f4:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   278f8:	41 0f b6 04 24       	movzbl (%r12),%eax
   278fd:	49 83 c4 01          	add    $0x1,%r12
   27901:	49 89 c2             	mov    %rax,%r10
   27904:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27908:	ff e0                	jmp    *%rax
   2790a:	f3 0f 1e fa          	endbr64
   2790e:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   27912:	0b 53 e8             	or     -0x18(%rbx),%edx
   27915:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   27919:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2791d:	0f 85 5c 71 00 00    	jne    2ea7f <JS_CallInternal+0x962f>
   27923:	09 c8                	or     %ecx,%eax
   27925:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   2792c:	00 
   2792d:	48 83 eb 10          	sub    $0x10,%rbx
   27931:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   27935:	41 0f b6 04 24       	movzbl (%r12),%eax
   2793a:	49 83 c4 01          	add    $0x1,%r12
   2793e:	49 89 c2             	mov    %rax,%r10
   27941:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27945:	ff e0                	jmp    *%rax
   27947:	f3 0f 1e fa          	endbr64
   2794b:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2794f:	0b 53 e8             	or     -0x18(%rbx),%edx
   27952:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   27956:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2795a:	0f 85 21 70 00 00    	jne    2e981 <JS_CallInternal+0x9531>
   27960:	21 c8                	and    %ecx,%eax
   27962:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   27969:	00 
   2796a:	48 83 eb 10          	sub    $0x10,%rbx
   2796e:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   27972:	41 0f b6 04 24       	movzbl (%r12),%eax
   27977:	49 83 c4 01          	add    $0x1,%r12
   2797b:	49 89 c2             	mov    %rax,%r10
   2797e:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27982:	ff e0                	jmp    *%rax
   27984:	f3 0f 1e fa          	endbr64
   27988:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2798c:	0b 53 e8             	or     -0x18(%rbx),%edx
   2798f:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   27993:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   27997:	0f 85 bd 6f 00 00    	jne    2e95a <JS_CallInternal+0x950a>
   2799d:	d3 e8                	shr    %cl,%eax
   2799f:	85 c0                	test   %eax,%eax
   279a1:	0f 88 22 4e 00 00    	js     2c7c9 <JS_CallInternal+0x7379>
   279a7:	66 0f 6e c0          	movd   %eax,%xmm0
   279ab:	31 c0                	xor    %eax,%eax
   279ad:	48 89 43 e8          	mov    %rax,-0x18(%rbx)
   279b1:	48 83 eb 10          	sub    $0x10,%rbx
   279b5:	f2 0f 11 43 f0       	movsd  %xmm0,-0x10(%rbx)
   279ba:	41 0f b6 04 24       	movzbl (%r12),%eax
   279bf:	49 83 c4 01          	add    $0x1,%r12
   279c3:	49 89 c2             	mov    %rax,%r10
   279c6:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   279ca:	ff e0                	jmp    *%rax
   279cc:	f3 0f 1e fa          	endbr64
   279d0:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   279d4:	0b 53 e8             	or     -0x18(%rbx),%edx
   279d7:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   279db:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   279df:	0f 85 c6 6f 00 00    	jne    2e9ab <JS_CallInternal+0x955b>
   279e5:	d3 f8                	sar    %cl,%eax
   279e7:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   279ee:	00 
   279ef:	48 83 eb 10          	sub    $0x10,%rbx
   279f3:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   279f7:	41 0f b6 04 24       	movzbl (%r12),%eax
   279fc:	49 83 c4 01          	add    $0x1,%r12
   27a00:	49 89 c2             	mov    %rax,%r10
   27a03:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27a07:	ff e0                	jmp    *%rax
   27a09:	f3 0f 1e fa          	endbr64
   27a0d:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   27a11:	0b 53 e8             	or     -0x18(%rbx),%edx
   27a14:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   27a18:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   27a1c:	0f 85 d3 70 00 00    	jne    2eaf5 <JS_CallInternal+0x96a5>
   27a22:	d3 e0                	shl    %cl,%eax
   27a24:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   27a2b:	00 
   27a2c:	48 83 eb 10          	sub    $0x10,%rbx
   27a30:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   27a34:	41 0f b6 04 24       	movzbl (%r12),%eax
   27a39:	49 83 c4 01          	add    $0x1,%r12
   27a3d:	49 89 c2             	mov    %rax,%r10
   27a40:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27a44:	ff e0                	jmp    *%rax
   27a46:	f3 0f 1e fa          	endbr64
   27a4a:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   27a4e:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   27a52:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   27a56:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   27a5a:	89 cf                	mov    %ecx,%edi
   27a5c:	09 f7                	or     %esi,%edi
   27a5e:	0f 85 bb 70 00 00    	jne    2eb1f <JS_CallInternal+0x96cf>
   27a64:	39 c2                	cmp    %eax,%edx
   27a66:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   27a6d:	00 
   27a6e:	0f 9d c0             	setge  %al
   27a71:	48 83 eb 10          	sub    $0x10,%rbx
   27a75:	0f b6 c0             	movzbl %al,%eax
   27a78:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   27a7c:	41 0f b6 04 24       	movzbl (%r12),%eax
   27a81:	49 83 c4 01          	add    $0x1,%r12
   27a85:	49 89 c2             	mov    %rax,%r10
   27a88:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27a8c:	ff e0                	jmp    *%rax
   27a8e:	f3 0f 1e fa          	endbr64
   27a92:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   27a96:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   27a9a:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   27a9e:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   27aa2:	89 cf                	mov    %ecx,%edi
   27aa4:	09 f7                	or     %esi,%edi
   27aa6:	0f 85 1f 6c 00 00    	jne    2e6cb <JS_CallInternal+0x927b>
   27aac:	39 c2                	cmp    %eax,%edx
   27aae:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   27ab5:	00 
   27ab6:	0f 9f c0             	setg   %al
   27ab9:	48 83 eb 10          	sub    $0x10,%rbx
   27abd:	0f b6 c0             	movzbl %al,%eax
   27ac0:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   27ac4:	41 0f b6 04 24       	movzbl (%r12),%eax
   27ac9:	49 83 c4 01          	add    $0x1,%r12
   27acd:	49 89 c2             	mov    %rax,%r10
   27ad0:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27ad4:	ff e0                	jmp    *%rax
   27ad6:	f3 0f 1e fa          	endbr64
   27ada:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   27ade:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   27ae2:	a9 f7 ff ff ff       	test   $0xfffffff7,%eax
   27ae7:	74 1b                	je     27b04 <JS_CallInternal+0x26b4>
   27ae9:	83 e8 01             	sub    $0x1,%eax
   27aec:	83 f8 01             	cmp    $0x1,%eax
   27aef:	0f 87 5c 57 00 00    	ja     2d251 <JS_CallInternal+0x7e01>
   27af5:	83 e2 ff             	and    $0xffffffff,%edx
   27af8:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   27aff:	00 
   27b00:	48 89 53 f0          	mov    %rdx,-0x10(%rbx)
   27b04:	41 0f b6 04 24       	movzbl (%r12),%eax
   27b09:	49 83 c4 01          	add    $0x1,%r12
   27b0d:	49 89 c2             	mov    %rax,%r10
   27b10:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27b14:	ff e0                	jmp    *%rax
   27b16:	f3 0f 1e fa          	endbr64
   27b1a:	49 8d 44 24 01       	lea    0x1(%r12),%rax
   27b1f:	48 8b 8d 70 fe ff ff 	mov    -0x190(%rbp),%rcx
   27b26:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   27b2d:	41 0f b6 04 24       	movzbl (%r12),%eax
   27b32:	48 c1 e0 04          	shl    $0x4,%rax
   27b36:	48 03 41 50          	add    0x50(%rcx),%rax
   27b3a:	48 8b 10             	mov    (%rax),%rdx
   27b3d:	48 8b 40 08          	mov    0x8(%rax),%rax
   27b41:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27b44:	76 04                	jbe    27b4a <JS_CallInternal+0x26fa>
   27b46:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27b4a:	48 92                	xchg   %rax,%rdx
   27b4c:	4c 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%r8
   27b53:	45 31 c9             	xor    %r9d,%r9d
   27b56:	4c 89 ef             	mov    %r13,%rdi
   27b59:	48 8b 8d 48 fe ff ff 	mov    -0x1b8(%rbp),%rcx
   27b60:	48 89 c6             	mov    %rax,%rsi
   27b63:	e8 98 74 02 00       	call   4f000 <js_closure>
   27b68:	48 89 03             	mov    %rax,(%rbx)
   27b6b:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   27b6f:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   27b73:	0f 84 65 71 00 00    	je     2ecde <JS_CallInternal+0x988e>
   27b79:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
   27b7f:	48 83 c3 10          	add    $0x10,%rbx
   27b83:	49 83 c4 02          	add    $0x2,%r12
   27b87:	49 89 c2             	mov    %rax,%r10
   27b8a:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27b8e:	ff e0                	jmp    *%rax
   27b90:	f3 0f 1e fa          	endbr64
   27b94:	48 8b 8d 70 fe ff ff 	mov    -0x190(%rbp),%rcx
   27b9b:	41 0f b6 04 24       	movzbl (%r12),%eax
   27ba0:	48 c1 e0 04          	shl    $0x4,%rax
   27ba4:	48 03 41 50          	add    0x50(%rcx),%rax
   27ba8:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   27bac:	48 8b 10             	mov    (%rax),%rdx
   27baf:	48 8b 40 08          	mov    0x8(%rax),%rax
   27bb3:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27bb6:	76 04                	jbe    27bbc <JS_CallInternal+0x276c>
   27bb8:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   27bbc:	48 89 13             	mov    %rdx,(%rbx)
   27bbf:	49 83 c4 02          	add    $0x2,%r12
   27bc3:	48 89 43 08          	mov    %rax,0x8(%rbx)
   27bc7:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   27bcd:	48 89 cb             	mov    %rcx,%rbx
   27bd0:	49 89 c2             	mov    %rax,%r10
   27bd3:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27bd7:	ff e0                	jmp    *%rax
   27bd9:	f3 0f 1e fa          	endbr64
   27bdd:	41 0f b6 3c 24       	movzbl (%r12),%edi
   27be2:	48 8b 8d 80 fe ff ff 	mov    -0x180(%rbp),%rcx
   27be9:	4d 8d 54 24 01       	lea    0x1(%r12),%r10
   27bee:	45 31 c9             	xor    %r9d,%r9d
   27bf1:	4c 89 95 f0 fd ff ff 	mov    %r10,-0x210(%rbp)
   27bf8:	89 fa                	mov    %edi,%edx
   27bfa:	89 f8                	mov    %edi,%eax
   27bfc:	4c 89 51 30          	mov    %r10,0x30(%rcx)
   27c00:	c1 fa 02             	sar    $0x2,%edx
   27c03:	83 e0 03             	and    $0x3,%eax
   27c06:	83 e2 07             	and    $0x7,%edx
   27c09:	f7 d0                	not    %eax
   27c0b:	f7 d2                	not    %edx
   27c0d:	48 98                	cltq
   27c0f:	48 63 d2             	movslq %edx,%rdx
   27c12:	48 c1 e0 04          	shl    $0x4,%rax
   27c16:	48 c1 e2 04          	shl    $0x4,%rdx
   27c1a:	48 01 d8             	add    %rbx,%rax
   27c1d:	48 01 da             	add    %rbx,%rdx
   27c20:	48 8b 30             	mov    (%rax),%rsi
   27c23:	48 8b 0a             	mov    (%rdx),%rcx
   27c26:	4c 8b 42 08          	mov    0x8(%rdx),%r8
   27c2a:	48 8b 50 08          	mov    0x8(%rax),%rdx
   27c2e:	89 f8                	mov    %edi,%eax
   27c30:	4c 89 ef             	mov    %r13,%rdi
   27c33:	c1 f8 05             	sar    $0x5,%eax
   27c36:	f7 d0                	not    %eax
   27c38:	48 98                	cltq
   27c3a:	48 c1 e0 04          	shl    $0x4,%rax
   27c3e:	ff 74 03 08          	push   0x8(%rbx,%rax,1)
   27c42:	ff 34 03             	push   (%rbx,%rax,1)
   27c45:	e8 f6 c9 06 00       	call   94640 <JS_CopyDataProperties>
   27c4a:	5e                   	pop    %rsi
   27c4b:	5f                   	pop    %rdi
   27c4c:	85 c0                	test   %eax,%eax
   27c4e:	0f 85 be 84 00 00    	jne    30112 <JS_CallInternal+0xacc2>
   27c54:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
   27c5a:	49 83 c4 02          	add    $0x2,%r12
   27c5e:	49 89 c2             	mov    %rax,%r10
   27c61:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27c65:	ff e0                	jmp    *%rax
   27c67:	f3 0f 1e fa          	endbr64
   27c6b:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   27c72:	48 89 de             	mov    %rbx,%rsi
   27c75:	4c 89 ef             	mov    %r13,%rdi
   27c78:	4c 89 60 30          	mov    %r12,0x30(%rax)
   27c7c:	e8 8f e0 07 00       	call   a5d10 <js_append_enumerate>
   27c81:	85 c0                	test   %eax,%eax
   27c83:	0f 85 f7 df ff ff    	jne    25c80 <JS_CallInternal+0x830>
   27c89:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   27c8d:	48 83 eb 10          	sub    $0x10,%rbx
   27c91:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27c94:	76 14                	jbe    27caa <JS_CallInternal+0x285a>
   27c96:	48 8b 0b             	mov    (%rbx),%rcx
   27c99:	8b 79 fc             	mov    -0x4(%rcx),%edi
   27c9c:	8d 57 ff             	lea    -0x1(%rdi),%edx
   27c9f:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27ca2:	85 d2                	test   %edx,%edx
   27ca4:	0f 8e 30 59 00 00    	jle    2d5da <JS_CallInternal+0x818a>
   27caa:	41 0f b6 04 24       	movzbl (%r12),%eax
   27caf:	49 83 c4 01          	add    $0x1,%r12
   27cb3:	49 89 c2             	mov    %rax,%r10
   27cb6:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27cba:	ff e0                	jmp    *%rax
   27cbc:	f3 0f 1e fa          	endbr64
   27cc0:	45 0f b7 0c 24       	movzwl (%r12),%r9d
   27cc5:	49 89 da             	mov    %rbx,%r10
   27cc8:	49 8d 4c 24 02       	lea    0x2(%r12),%rcx
   27ccd:	4c 89 ef             	mov    %r13,%rdi
   27cd0:	48 89 8d b0 fd ff ff 	mov    %rcx,-0x250(%rbp)
   27cd7:	4c 89 c8             	mov    %r9,%rax
   27cda:	44 89 8d f0 fd ff ff 	mov    %r9d,-0x210(%rbp)
   27ce1:	48 c1 e0 04          	shl    $0x4,%rax
   27ce5:	49 29 c2             	sub    %rax,%r10
   27ce8:	48 89 85 c0 fd ff ff 	mov    %rax,-0x240(%rbp)
   27cef:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   27cf6:	4d 8b 42 f8          	mov    -0x8(%r10),%r8
   27cfa:	49 8b 72 e0          	mov    -0x20(%r10),%rsi
   27cfe:	48 89 48 30          	mov    %rcx,0x30(%rax)
   27d02:	49 8b 52 e8          	mov    -0x18(%r10),%rdx
   27d06:	49 8b 4a f0          	mov    -0x10(%r10),%rcx
   27d0a:	6a 00                	push   $0x0
   27d0c:	41 52                	push   %r10
   27d0e:	4c 89 95 d0 fd ff ff 	mov    %r10,-0x230(%rbp)
   27d15:	e8 06 37 07 00       	call   9b420 <JS_CallConstructorInternal>
   27d1a:	48 89 85 e8 fd ff ff 	mov    %rax,-0x218(%rbp)
   27d21:	41 5b                	pop    %r11
   27d23:	58                   	pop    %rax
   27d24:	83 fa 06             	cmp    $0x6,%edx
   27d27:	0f 84 46 69 00 00    	je     2e673 <JS_CallInternal+0x9223>
   27d2d:	4c 8b 95 d0 fd ff ff 	mov    -0x230(%rbp),%r10
   27d34:	48 89 95 b0 fd ff ff 	mov    %rdx,-0x250(%rbp)
   27d3b:	4c 89 a5 d0 fd ff ff 	mov    %r12,-0x230(%rbp)
   27d42:	49 8d 42 e0          	lea    -0x20(%r10),%rax
   27d46:	4c 03 95 c0 fd ff ff 	add    -0x240(%rbp),%r10
   27d4d:	4c 89 bd c0 fd ff ff 	mov    %r15,-0x240(%rbp)
   27d54:	49 89 df             	mov    %rbx,%r15
   27d57:	4d 89 d4             	mov    %r10,%r12
   27d5a:	48 89 c3             	mov    %rax,%rbx
   27d5d:	eb 0e                	jmp    27d6d <JS_CallInternal+0x291d>
   27d5f:	90                   	nop
   27d60:	48 83 c3 10          	add    $0x10,%rbx
   27d64:	4c 39 e3             	cmp    %r12,%rbx
   27d67:	0f 84 37 41 00 00    	je     2bea4 <JS_CallInternal+0x6a54>
   27d6d:	48 8b 43 08          	mov    0x8(%rbx),%rax
   27d71:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27d74:	76 ea                	jbe    27d60 <JS_CallInternal+0x2910>
   27d76:	48 8b 33             	mov    (%rbx),%rsi
   27d79:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   27d7c:	8d 51 ff             	lea    -0x1(%rcx),%edx
   27d7f:	89 56 fc             	mov    %edx,-0x4(%rsi)
   27d82:	85 d2                	test   %edx,%edx
   27d84:	7f da                	jg     27d60 <JS_CallInternal+0x2910>
   27d86:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   27d8a:	48 89 c2             	mov    %rax,%rdx
   27d8d:	e8 0e 6c ff ff       	call   1e9a0 <__JS_FreeValueRT>
   27d92:	eb cc                	jmp    27d60 <JS_CallInternal+0x2910>
   27d94:	f3 0f 1e fa          	endbr64
   27d98:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   27d9f:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   27da3:	4c 89 ef             	mov    %r13,%rdi
   27da6:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   27daa:	4c 89 60 30          	mov    %r12,0x30(%rax)
   27dae:	48 8d 43 e0          	lea    -0x20(%rbx),%rax
   27db2:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   27db9:	e8 f2 f5 01 00       	call   473b0 <JS_ValueToAtom>
   27dbe:	89 c1                	mov    %eax,%ecx
   27dc0:	85 c0                	test   %eax,%eax
   27dc2:	0f 84 b8 de ff ff    	je     25c80 <JS_CallInternal+0x830>
   27dc8:	83 7b d8 03          	cmpl   $0x3,-0x28(%rbx)
   27dcc:	0f 84 e1 62 00 00    	je     2e0b3 <JS_CallInternal+0x8c63>
   27dd2:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   27dd6:	48 8b 53 d8          	mov    -0x28(%rbx),%rdx
   27dda:	4c 8d 5b d0          	lea    -0x30(%rbx),%r11
   27dde:	4c 89 ef             	mov    %r13,%rdi
   27de1:	4c 89 9d d0 fd ff ff 	mov    %r11,-0x230(%rbp)
   27de8:	89 8d e8 fd ff ff    	mov    %ecx,-0x218(%rbp)
   27dee:	e8 ed 88 04 00       	call   706e0 <JS_HasProperty>
   27df3:	8b 8d e8 fd ff ff    	mov    -0x218(%rbp),%ecx
   27df9:	4c 8b 9d d0 fd ff ff 	mov    -0x230(%rbp),%r11
   27e00:	85 c0                	test   %eax,%eax
   27e02:	0f 8e eb 70 00 00    	jle    2eef3 <JS_CallInternal+0x9aa3>
   27e08:	48 83 ec 08          	sub    $0x8,%rsp
   27e0c:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   27e10:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   27e14:	4c 89 ef             	mov    %r13,%rdi
   27e17:	49 8b 33             	mov    (%r11),%rsi
   27e1a:	49 8b 53 08          	mov    0x8(%r11),%rdx
   27e1e:	68 00 80 00 00       	push   $0x8000
   27e23:	41 ff 73 08          	push   0x8(%r11)
   27e27:	41 ff 33             	push   (%r11)
   27e2a:	4c 89 9d d0 fd ff ff 	mov    %r11,-0x230(%rbp)
   27e31:	89 8d e8 fd ff ff    	mov    %ecx,-0x218(%rbp)
   27e37:	e8 34 95 00 00       	call   31370 <JS_SetPropertyInternal>
   27e3c:	8b 8d e8 fd ff ff    	mov    -0x218(%rbp),%ecx
   27e42:	48 83 c4 20          	add    $0x20,%rsp
   27e46:	4c 8b 9d d0 fd ff ff 	mov    -0x230(%rbp),%r11
   27e4d:	89 c3                	mov    %eax,%ebx
   27e4f:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   27e55:	0f 8f 6c 51 00 00    	jg     2cfc7 <JS_CallInternal+0x7b77>
   27e5b:	48 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%rcx
   27e62:	48 8b 41 08          	mov    0x8(%rcx),%rax
   27e66:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27e69:	76 14                	jbe    27e7f <JS_CallInternal+0x2a2f>
   27e6b:	48 8b 09             	mov    (%rcx),%rcx
   27e6e:	8b 51 fc             	mov    -0x4(%rcx),%edx
   27e71:	83 ea 01             	sub    $0x1,%edx
   27e74:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27e77:	85 d2                	test   %edx,%edx
   27e79:	0f 8e 89 62 00 00    	jle    2e108 <JS_CallInternal+0x8cb8>
   27e7f:	49 8b 43 08          	mov    0x8(%r11),%rax
   27e83:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27e86:	76 14                	jbe    27e9c <JS_CallInternal+0x2a4c>
   27e88:	49 8b 0b             	mov    (%r11),%rcx
   27e8b:	8b 79 fc             	mov    -0x4(%rcx),%edi
   27e8e:	8d 57 ff             	lea    -0x1(%rdi),%edx
   27e91:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27e94:	85 d2                	test   %edx,%edx
   27e96:	0f 8e f5 61 00 00    	jle    2e091 <JS_CallInternal+0x8c41>
   27e9c:	85 db                	test   %ebx,%ebx
   27e9e:	0f 88 a5 70 00 00    	js     2ef49 <JS_CallInternal+0x9af9>
   27ea4:	41 0f b6 04 24       	movzbl (%r12),%eax
   27ea9:	4c 89 db             	mov    %r11,%rbx
   27eac:	49 83 c4 01          	add    $0x1,%r12
   27eb0:	49 89 c2             	mov    %rax,%r10
   27eb3:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27eb7:	ff e0                	jmp    *%rax
   27eb9:	f3 0f 1e fa          	endbr64
   27ebd:	83 7b d8 ff          	cmpl   $0xffffffff,-0x28(%rbx)
   27ec1:	0f 85 29 4b 00 00    	jne    2c9f0 <JS_CallInternal+0x75a0>
   27ec7:	44 8b 43 e8          	mov    -0x18(%rbx),%r8d
   27ecb:	45 85 c0             	test   %r8d,%r8d
   27ece:	0f 85 1c 4b 00 00    	jne    2c9f0 <JS_CallInternal+0x75a0>
   27ed4:	48 8b 53 d0          	mov    -0x30(%rbx),%rdx
   27ed8:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   27edc:	66 83 7a 12 02       	cmpw   $0x2,0x12(%rdx)
   27ee1:	0f 85 09 4b 00 00    	jne    2c9f0 <JS_CallInternal+0x75a0>
   27ee7:	8b 4a 38             	mov    0x38(%rdx),%ecx
   27eea:	39 c8                	cmp    %ecx,%eax
   27eec:	0f 83 8e 71 00 00    	jae    2f080 <JS_CallInternal+0x9c30>
   27ef2:	89 c0                	mov    %eax,%eax
   27ef4:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   27ef9:	48 c1 e0 04          	shl    $0x4,%rax
   27efd:	48 03 42 30          	add    0x30(%rdx),%rax
   27f01:	48 8b 50 08          	mov    0x8(%rax),%rdx
   27f05:	48 8b 08             	mov    (%rax),%rcx
   27f08:	0f 11 00             	movups %xmm0,(%rax)
   27f0b:	83 fa f6             	cmp    $0xfffffff6,%edx
   27f0e:	76 11                	jbe    27f21 <JS_CallInternal+0x2ad1>
   27f10:	8b 41 fc             	mov    -0x4(%rcx),%eax
   27f13:	83 e8 01             	sub    $0x1,%eax
   27f16:	89 41 fc             	mov    %eax,-0x4(%rcx)
   27f19:	85 c0                	test   %eax,%eax
   27f1b:	0f 8e 0f 6f 00 00    	jle    2ee30 <JS_CallInternal+0x99e0>
   27f21:	48 8b 43 d8          	mov    -0x28(%rbx),%rax
   27f25:	48 83 eb 30          	sub    $0x30,%rbx
   27f29:	83 f8 f6             	cmp    $0xfffffff6,%eax
   27f2c:	76 14                	jbe    27f42 <JS_CallInternal+0x2af2>
   27f2e:	48 8b 0b             	mov    (%rbx),%rcx
   27f31:	8b 51 fc             	mov    -0x4(%rcx),%edx
   27f34:	83 ea 01             	sub    $0x1,%edx
   27f37:	89 51 fc             	mov    %edx,-0x4(%rcx)
   27f3a:	85 d2                	test   %edx,%edx
   27f3c:	0f 8e c6 71 00 00    	jle    2f108 <JS_CallInternal+0x9cb8>
   27f42:	41 0f b6 04 24       	movzbl (%r12),%eax
   27f47:	49 83 c4 01          	add    $0x1,%r12
   27f4b:	49 89 c2             	mov    %rax,%r10
   27f4e:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   27f52:	ff e0                	jmp    *%rax
   27f54:	f3 0f 1e fa          	endbr64
   27f58:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   27f5c:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   27f60:	4c 8d 53 f0          	lea    -0x10(%rbx),%r10
   27f64:	4c 89 ef             	mov    %r13,%rdi
   27f67:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   27f6e:	4c 89 95 d0 fd ff ff 	mov    %r10,-0x230(%rbp)
   27f75:	4c 89 60 30          	mov    %r12,0x30(%rax)
   27f79:	e8 32 f4 01 00       	call   473b0 <JS_ValueToAtom>
   27f7e:	89 c1                	mov    %eax,%ecx
   27f80:	85 c0                	test   %eax,%eax
   27f82:	0f 84 f8 dc ff ff    	je     25c80 <JS_CallInternal+0x830>
   27f88:	48 83 ec 08          	sub    $0x8,%rsp
   27f8c:	4c 8d 5b d0          	lea    -0x30(%rbx),%r11
   27f90:	48 8d 43 e0          	lea    -0x20(%rbx),%rax
   27f94:	4c 8b 4b d8          	mov    -0x28(%rbx),%r9
   27f98:	4c 89 9d a8 fd ff ff 	mov    %r11,-0x258(%rbp)
   27f9f:	4c 8b 43 d0          	mov    -0x30(%rbx),%r8
   27fa3:	4c 89 ef             	mov    %r13,%rdi
   27fa6:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   27faa:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   27fae:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   27fb5:	6a 00                	push   $0x0
   27fb7:	89 8d b0 fd ff ff    	mov    %ecx,-0x250(%rbp)
   27fbd:	e8 5e 86 00 00       	call   30620 <JS_GetPropertyInternal>
   27fc2:	8b 8d b0 fd ff ff    	mov    -0x250(%rbp),%ecx
   27fc8:	4c 8b 9d a8 fd ff ff 	mov    -0x258(%rbp),%r11
   27fcf:	48 89 85 c0 fd ff ff 	mov    %rax,-0x240(%rbp)
   27fd6:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   27fdc:	48 89 95 e8 fd ff ff 	mov    %rdx,-0x218(%rbp)
   27fe3:	41 59                	pop    %r9
   27fe5:	41 5a                	pop    %r10
   27fe7:	4c 8b 95 d0 fd ff ff 	mov    -0x230(%rbp),%r10
   27fee:	0f 8f 92 4f 00 00    	jg     2cf86 <JS_CallInternal+0x7b36>
   27ff4:	83 bd e8 fd ff ff 06 	cmpl   $0x6,-0x218(%rbp)
   27ffb:	0f 84 7f dc ff ff    	je     25c80 <JS_CallInternal+0x830>
   28001:	49 8b 42 08          	mov    0x8(%r10),%rax
   28005:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28008:	76 14                	jbe    2801e <JS_CallInternal+0x2bce>
   2800a:	49 8b 0a             	mov    (%r10),%rcx
   2800d:	8b 51 fc             	mov    -0x4(%rcx),%edx
   28010:	83 ea 01             	sub    $0x1,%edx
   28013:	89 51 fc             	mov    %edx,-0x4(%rcx)
   28016:	85 d2                	test   %edx,%edx
   28018:	0f 8e f8 65 00 00    	jle    2e616 <JS_CallInternal+0x91c6>
   2801e:	48 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%rcx
   28025:	48 8b 41 08          	mov    0x8(%rcx),%rax
   28029:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2802c:	76 14                	jbe    28042 <JS_CallInternal+0x2bf2>
   2802e:	48 8b 09             	mov    (%rcx),%rcx
   28031:	8b 79 fc             	mov    -0x4(%rcx),%edi
   28034:	8d 57 ff             	lea    -0x1(%rdi),%edx
   28037:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2803a:	85 d2                	test   %edx,%edx
   2803c:	0f 8e 2d 60 00 00    	jle    2e06f <JS_CallInternal+0x8c1f>
   28042:	49 8b 43 08          	mov    0x8(%r11),%rax
   28046:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28049:	76 14                	jbe    2805f <JS_CallInternal+0x2c0f>
   2804b:	49 8b 0b             	mov    (%r11),%rcx
   2804e:	8b 51 fc             	mov    -0x4(%rcx),%edx
   28051:	83 ea 01             	sub    $0x1,%edx
   28054:	89 51 fc             	mov    %edx,-0x4(%rcx)
   28057:	85 d2                	test   %edx,%edx
   28059:	0f 8e a3 65 00 00    	jle    2e602 <JS_CallInternal+0x91b2>
   2805f:	48 8b 85 c0 fd ff ff 	mov    -0x240(%rbp),%rax
   28066:	49 83 c4 01          	add    $0x1,%r12
   2806a:	48 89 43 d0          	mov    %rax,-0x30(%rbx)
   2806e:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
   28075:	48 89 43 d8          	mov    %rax,-0x28(%rbx)
   28079:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2807f:	48 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%rbx
   28086:	49 89 c2             	mov    %rax,%r10
   28089:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2808d:	ff e0                	jmp    *%rax
   2808f:	f3 0f 1e fa          	endbr64
   28093:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2809a:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2809e:	4c 89 ef             	mov    %r13,%rdi
   280a1:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   280a5:	4c 89 60 30          	mov    %r12,0x30(%rax)
   280a9:	e8 02 f3 01 00       	call   473b0 <JS_ValueToAtom>
   280ae:	89 c1                	mov    %eax,%ecx
   280b0:	85 c0                	test   %eax,%eax
   280b2:	0f 84 c8 db ff ff    	je     25c80 <JS_CallInternal+0x830>
   280b8:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   280bc:	83 fa 03             	cmp    $0x3,%edx
   280bf:	0f 84 9c 66 00 00    	je     2e761 <JS_CallInternal+0x9311>
   280c5:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   280c9:	4c 89 ef             	mov    %r13,%rdi
   280cc:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   280d2:	e8 09 86 04 00       	call   706e0 <JS_HasProperty>
   280d7:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   280dd:	85 c0                	test   %eax,%eax
   280df:	0f 8e 26 66 00 00    	jle    2e70b <JS_CallInternal+0x92bb>
   280e5:	48 83 ec 08          	sub    $0x8,%rsp
   280e9:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   280ed:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   280f1:	4c 89 ef             	mov    %r13,%rdi
   280f4:	6a 00                	push   $0x0
   280f6:	49 89 f0             	mov    %rsi,%r8
   280f9:	49 89 d1             	mov    %rdx,%r9
   280fc:	89 8d f0 fd ff ff    	mov    %ecx,-0x210(%rbp)
   28102:	e8 19 85 00 00       	call   30620 <JS_GetPropertyInternal>
   28107:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   2810d:	41 5b                	pop    %r11
   2810f:	49 89 d1             	mov    %rdx,%r9
   28112:	48 89 c2             	mov    %rax,%rdx
   28115:	58                   	pop    %rax
   28116:	4d 89 c8             	mov    %r9,%r8
   28119:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2811f:	0f 8f 23 50 00 00    	jg     2d148 <JS_CallInternal+0x7cf8>
   28125:	41 83 f9 06          	cmp    $0x6,%r9d
   28129:	0f 84 51 db ff ff    	je     25c80 <JS_CallInternal+0x830>
   2812f:	48 89 13             	mov    %rdx,(%rbx)
   28132:	49 83 c4 01          	add    $0x1,%r12
   28136:	48 83 c3 10          	add    $0x10,%rbx
   2813a:	4c 89 43 f8          	mov    %r8,-0x8(%rbx)
   2813e:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28144:	49 89 c2             	mov    %rax,%r10
   28147:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2814b:	ff e0                	jmp    *%rax
   2814d:	f3 0f 1e fa          	endbr64
   28151:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   28155:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   28159:	4c 8d 5b f0          	lea    -0x10(%rbx),%r11
   2815d:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28160:	76 04                	jbe    28166 <JS_CallInternal+0x2d16>
   28162:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   28166:	48 92                	xchg   %rax,%rdx
   28168:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   2816c:	41 b9 07 40 00 00    	mov    $0x4007,%r9d
   28172:	4c 89 ef             	mov    %r13,%rdi
   28175:	49 89 d0             	mov    %rdx,%r8
   28178:	48 8b 53 d8          	mov    -0x28(%rbx),%rdx
   2817c:	41 ff 73 08          	push   0x8(%r11)
   28180:	48 89 c1             	mov    %rax,%rcx
   28183:	41 ff 33             	push   (%r11)
   28186:	4c 89 9d f0 fd ff ff 	mov    %r11,-0x210(%rbp)
   2818d:	e8 ee f3 01 00       	call   47580 <JS_DefinePropertyValueValue>
   28192:	41 58                	pop    %r8
   28194:	41 59                	pop    %r9
   28196:	85 c0                	test   %eax,%eax
   28198:	0f 88 0e 66 00 00    	js     2e7ac <JS_CallInternal+0x935c>
   2819e:	41 0f b6 04 24       	movzbl (%r12),%eax
   281a3:	48 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%rbx
   281aa:	49 83 c4 01          	add    $0x1,%r12
   281ae:	49 89 c2             	mov    %rax,%r10
   281b1:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   281b5:	ff e0                	jmp    *%rax
   281b7:	f3 0f 1e fa          	endbr64
   281bb:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   281c2:	4c 89 60 30          	mov    %r12,0x30(%rax)
   281c6:	83 7b d8 ff          	cmpl   $0xffffffff,-0x28(%rbx)
   281ca:	0f 85 67 7c 00 00    	jne    2fe37 <JS_CallInternal+0xa9e7>
   281d0:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   281d4:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   281d8:	48 8d 43 e0          	lea    -0x20(%rbx),%rax
   281dc:	4c 89 ef             	mov    %r13,%rdi
   281df:	48 89 85 e8 fd ff ff 	mov    %rax,-0x218(%rbp)
   281e6:	e8 c5 f1 01 00       	call   473b0 <JS_ValueToAtom>
   281eb:	89 c1                	mov    %eax,%ecx
   281ed:	85 c0                	test   %eax,%eax
   281ef:	0f 84 8b da ff ff    	je     25c80 <JS_CallInternal+0x830>
   281f5:	48 83 ec 08          	sub    $0x8,%rsp
   281f9:	4c 8d 53 d0          	lea    -0x30(%rbx),%r10
   281fd:	48 8d 43 c0          	lea    -0x40(%rbx),%rax
   28201:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   28205:	4c 89 95 c0 fd ff ff 	mov    %r10,-0x240(%rbp)
   2820c:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   28210:	4c 89 ef             	mov    %r13,%rdi
   28213:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   28217:	48 8b 53 d8          	mov    -0x28(%rbx),%rdx
   2821b:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   28222:	68 00 80 00 00       	push   $0x8000
   28227:	ff 73 c8             	push   -0x38(%rbx)
   2822a:	ff 73 c0             	push   -0x40(%rbx)
   2822d:	89 8d d0 fd ff ff    	mov    %ecx,-0x230(%rbp)
   28233:	e8 38 91 00 00       	call   31370 <JS_SetPropertyInternal>
   28238:	8b 8d d0 fd ff ff    	mov    -0x230(%rbp),%ecx
   2823e:	48 83 c4 20          	add    $0x20,%rsp
   28242:	4c 8b 95 c0 fd ff ff 	mov    -0x240(%rbp),%r10
   28249:	89 c3                	mov    %eax,%ebx
   2824b:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   28251:	0f 8f 4e 4c 00 00    	jg     2cea5 <JS_CallInternal+0x7a55>
   28257:	48 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%rcx
   2825e:	48 8b 41 08          	mov    0x8(%rcx),%rax
   28262:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28265:	76 14                	jbe    2827b <JS_CallInternal+0x2e2b>
   28267:	48 8b 09             	mov    (%rcx),%rcx
   2826a:	8b 51 fc             	mov    -0x4(%rcx),%edx
   2826d:	83 ea 01             	sub    $0x1,%edx
   28270:	89 51 fc             	mov    %edx,-0x4(%rcx)
   28273:	85 d2                	test   %edx,%edx
   28275:	0f 8e 53 62 00 00    	jle    2e4ce <JS_CallInternal+0x907e>
   2827b:	49 8b 42 08          	mov    0x8(%r10),%rax
   2827f:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28282:	76 14                	jbe    28298 <JS_CallInternal+0x2e48>
   28284:	49 8b 0a             	mov    (%r10),%rcx
   28287:	8b 79 fc             	mov    -0x4(%rcx),%edi
   2828a:	8d 57 ff             	lea    -0x1(%rdi),%edx
   2828d:	89 51 fc             	mov    %edx,-0x4(%rcx)
   28290:	85 d2                	test   %edx,%edx
   28292:	0f 8e d9 5f 00 00    	jle    2e271 <JS_CallInternal+0x8e21>
   28298:	48 8b 8d e8 fd ff ff 	mov    -0x218(%rbp),%rcx
   2829f:	48 8b 41 08          	mov    0x8(%rcx),%rax
   282a3:	83 f8 f6             	cmp    $0xfffffff6,%eax
   282a6:	76 14                	jbe    282bc <JS_CallInternal+0x2e6c>
   282a8:	48 8b 09             	mov    (%rcx),%rcx
   282ab:	8b 51 fc             	mov    -0x4(%rcx),%edx
   282ae:	83 ea 01             	sub    $0x1,%edx
   282b1:	89 51 fc             	mov    %edx,-0x4(%rcx)
   282b4:	85 d2                	test   %edx,%edx
   282b6:	0f 8e c9 5f 00 00    	jle    2e285 <JS_CallInternal+0x8e35>
   282bc:	85 db                	test   %ebx,%ebx
   282be:	0f 88 ae 7b 00 00    	js     2fe72 <JS_CallInternal+0xaa22>
   282c4:	41 0f b6 04 24       	movzbl (%r12),%eax
   282c9:	48 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%rbx
   282d0:	49 83 c4 01          	add    $0x1,%r12
   282d4:	49 89 c2             	mov    %rax,%r10
   282d7:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   282db:	ff e0                	jmp    *%rax
   282dd:	f3 0f 1e fa          	endbr64
   282e1:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   282e5:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   282e9:	83 f8 ff             	cmp    $0xffffffff,%eax
   282ec:	0f 85 a7 5f 00 00    	jne    2e299 <JS_CallInternal+0x8e49>
   282f2:	85 c9                	test   %ecx,%ecx
   282f4:	0f 85 e5 4b 00 00    	jne    2cedf <JS_CallInternal+0x7a8f>
   282fa:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   282fe:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   28302:	66 83 7a 12 02       	cmpw   $0x2,0x12(%rdx)
   28307:	0f 85 31 4c 00 00    	jne    2cf3e <JS_CallInternal+0x7aee>
   2830d:	3b 42 38             	cmp    0x38(%rdx),%eax
   28310:	0f 83 28 4c 00 00    	jae    2cf3e <JS_CallInternal+0x7aee>
   28316:	89 c0                	mov    %eax,%eax
   28318:	48 c1 e0 04          	shl    $0x4,%rax
   2831c:	48 03 42 30          	add    0x30(%rdx),%rax
   28320:	48 8b 10             	mov    (%rax),%rdx
   28323:	48 8b 40 08          	mov    0x8(%rax),%rax
   28327:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2832a:	76 04                	jbe    28330 <JS_CallInternal+0x2ee0>
   2832c:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   28330:	48 89 13             	mov    %rdx,(%rbx)
   28333:	49 83 c4 01          	add    $0x1,%r12
   28337:	48 83 c3 10          	add    $0x10,%rbx
   2833b:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2833f:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28345:	49 89 c2             	mov    %rax,%r10
   28348:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2834c:	ff e0                	jmp    *%rax
   2834e:	f3 0f 1e fa          	endbr64
   28352:	4c 8b 53 e8          	mov    -0x18(%rbx),%r10
   28356:	4c 8b 4b e0          	mov    -0x20(%rbx),%r9
   2835a:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2835e:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   28362:	41 83 fa ff          	cmp    $0xffffffff,%r10d
   28366:	0f 85 c4 45 00 00    	jne    2c930 <JS_CallInternal+0x74e0>
   2836c:	85 f6                	test   %esi,%esi
   2836e:	0f 85 bc 45 00 00    	jne    2c930 <JS_CallInternal+0x74e0>
   28374:	66 41 83 79 12 02    	cmpw   $0x2,0x12(%r9)
   2837a:	0f 85 b0 45 00 00    	jne    2c930 <JS_CallInternal+0x74e0>
   28380:	41 3b 49 38          	cmp    0x38(%r9),%ecx
   28384:	0f 83 a6 45 00 00    	jae    2c930 <JS_CallInternal+0x74e0>
   2838a:	89 c8                	mov    %ecx,%eax
   2838c:	48 c1 e0 04          	shl    $0x4,%rax
   28390:	49 03 41 30          	add    0x30(%r9),%rax
   28394:	48 8b 08             	mov    (%rax),%rcx
   28397:	48 8b 40 08          	mov    0x8(%rax),%rax
   2839b:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2839e:	76 04                	jbe    283a4 <JS_CallInternal+0x2f54>
   283a0:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   283a4:	41 83 fa f6          	cmp    $0xfffffff6,%r10d
   283a8:	76 13                	jbe    283bd <JS_CallInternal+0x2f6d>
   283aa:	41 8b 79 fc          	mov    -0x4(%r9),%edi
   283ae:	8d 57 ff             	lea    -0x1(%rdi),%edx
   283b1:	41 89 51 fc          	mov    %edx,-0x4(%r9)
   283b5:	85 d2                	test   %edx,%edx
   283b7:	0f 8e ed 51 00 00    	jle    2d5aa <JS_CallInternal+0x815a>
   283bd:	48 89 4b e0          	mov    %rcx,-0x20(%rbx)
   283c1:	49 83 c4 01          	add    $0x1,%r12
   283c5:	48 83 eb 10          	sub    $0x10,%rbx
   283c9:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   283cd:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   283d3:	49 89 c2             	mov    %rax,%r10
   283d6:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   283da:	ff e0                	jmp    *%rax
   283dc:	f3 0f 1e fa          	endbr64
   283e0:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   283e4:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   283e8:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   283ec:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   283f0:	83 fe ff             	cmp    $0xffffffff,%esi
   283f3:	0f 85 f8 44 00 00    	jne    2c8f1 <JS_CallInternal+0x74a1>
   283f9:	85 c9                	test   %ecx,%ecx
   283fb:	0f 85 f0 44 00 00    	jne    2c8f1 <JS_CallInternal+0x74a1>
   28401:	66 83 7a 12 02       	cmpw   $0x2,0x12(%rdx)
   28406:	0f 85 e5 44 00 00    	jne    2c8f1 <JS_CallInternal+0x74a1>
   2840c:	3b 42 38             	cmp    0x38(%rdx),%eax
   2840f:	0f 83 dc 44 00 00    	jae    2c8f1 <JS_CallInternal+0x74a1>
   28415:	89 c0                	mov    %eax,%eax
   28417:	48 c1 e0 04          	shl    $0x4,%rax
   2841b:	48 03 42 30          	add    0x30(%rdx),%rax
   2841f:	48 8b 10             	mov    (%rax),%rdx
   28422:	48 8b 40 08          	mov    0x8(%rax),%rax
   28426:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28429:	76 04                	jbe    2842f <JS_CallInternal+0x2fdf>
   2842b:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2842f:	48 89 53 f0          	mov    %rdx,-0x10(%rbx)
   28433:	49 83 c4 01          	add    $0x1,%r12
   28437:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2843b:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28441:	49 89 c2             	mov    %rax,%r10
   28444:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28448:	ff e0                	jmp    *%rax
   2844a:	f3 0f 1e fa          	endbr64
   2844e:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   28452:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   28456:	4c 89 ef             	mov    %r13,%rdi
   28459:	49 83 c4 01          	add    $0x1,%r12
   2845d:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   28461:	4c 8b 43 e8          	mov    -0x18(%rbx),%r8
   28465:	e8 e6 7f ff ff       	call   20450 <js_method_set_home_object>
   2846a:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28470:	49 89 c2             	mov    %rax,%r10
   28473:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28477:	ff e0                	jmp    *%rax
   28479:	f3 0f 1e fa          	endbr64
   2847d:	4c 8b 5b e8          	mov    -0x18(%rbx),%r11
   28481:	49 8d 44 24 04       	lea    0x4(%r12),%rax
   28486:	41 8b 0c 24          	mov    (%r12),%ecx
   2848a:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   28491:	4c 8b 53 e0          	mov    -0x20(%rbx),%r10
   28495:	41 83 fb ff          	cmp    $0xffffffff,%r11d
   28499:	0f 85 c5 45 00 00    	jne    2ca64 <JS_CallInternal+0x7614>
   2849f:	49 8b 72 18          	mov    0x18(%r10),%rsi
   284a3:	8b 46 18             	mov    0x18(%rsi),%eax
   284a6:	89 c2                	mov    %eax,%edx
   284a8:	21 ca                	and    %ecx,%edx
   284aa:	8b 54 96 38          	mov    0x38(%rsi,%rdx,4),%edx
   284ae:	48 85 d2             	test   %rdx,%rdx
   284b1:	0f 84 ad 45 00 00    	je     2ca64 <JS_CallInternal+0x7614>
   284b7:	48 8d 3c 85 3c 00 00 	lea    0x3c(,%rax,4),%rdi
   284be:	00 
   284bf:	48 83 ea 01          	sub    $0x1,%rdx
   284c3:	48 8d 04 d7          	lea    (%rdi,%rdx,8),%rax
   284c7:	48 01 f0             	add    %rsi,%rax
   284ca:	3b 48 04             	cmp    0x4(%rax),%ecx
   284cd:	0f 85 83 45 00 00    	jne    2ca56 <JS_CallInternal+0x7606>
   284d3:	0f b6 40 03          	movzbl 0x3(%rax),%eax
   284d7:	49 8b 72 20          	mov    0x20(%r10),%rsi
   284db:	c0 e8 02             	shr    $0x2,%al
   284de:	83 e0 3a             	and    $0x3a,%eax
   284e1:	3c 02                	cmp    $0x2,%al
   284e3:	0f 85 7b 45 00 00    	jne    2ca64 <JS_CallInternal+0x7614>
   284e9:	48 c1 e2 04          	shl    $0x4,%rdx
   284ed:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   284f2:	48 8d 04 16          	lea    (%rsi,%rdx,1),%rax
   284f6:	48 8b 50 08          	mov    0x8(%rax),%rdx
   284fa:	48 8b 08             	mov    (%rax),%rcx
   284fd:	0f 11 00             	movups %xmm0,(%rax)
   28500:	83 fa f6             	cmp    $0xfffffff6,%edx
   28503:	76 11                	jbe    28516 <JS_CallInternal+0x30c6>
   28505:	8b 41 fc             	mov    -0x4(%rcx),%eax
   28508:	83 e8 01             	sub    $0x1,%eax
   2850b:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2850e:	85 c0                	test   %eax,%eax
   28510:	0f 8e ed 68 00 00    	jle    2ee03 <JS_CallInternal+0x99b3>
   28516:	41 83 fb f6          	cmp    $0xfffffff6,%r11d
   2851a:	76 13                	jbe    2852f <JS_CallInternal+0x30df>
   2851c:	41 8b 42 fc          	mov    -0x4(%r10),%eax
   28520:	83 e8 01             	sub    $0x1,%eax
   28523:	41 89 42 fc          	mov    %eax,-0x4(%r10)
   28527:	85 c0                	test   %eax,%eax
   28529:	0f 8e 57 68 00 00    	jle    2ed86 <JS_CallInternal+0x9936>
   2852f:	48 83 eb 20          	sub    $0x20,%rbx
   28533:	41 0f b6 44 24 04    	movzbl 0x4(%r12),%eax
   28539:	49 83 c4 05          	add    $0x5,%r12
   2853d:	49 89 c2             	mov    %rax,%r10
   28540:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28544:	ff e0                	jmp    *%rax
   28546:	f3 0f 1e fa          	endbr64
   2854a:	41 8b 04 24          	mov    (%r12),%eax
   2854e:	4c 8b 5b e8          	mov    -0x18(%rbx),%r11
   28552:	49 8d 4c 24 04       	lea    0x4(%r12),%rcx
   28557:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   2855e:	4c 8b 53 e0          	mov    -0x20(%rbx),%r10
   28562:	4c 01 e0             	add    %r12,%rax
   28565:	41 83 fb ff          	cmp    $0xffffffff,%r11d
   28569:	75 0c                	jne    28577 <JS_CallInternal+0x3127>
   2856b:	66 41 83 7a 12 01    	cmpw   $0x1,0x12(%r10)
   28571:	0f 84 54 4f 00 00    	je     2d4cb <JS_CallInternal+0x807b>
   28577:	48 8b 8d 80 fe ff ff 	mov    -0x180(%rbp),%rcx
   2857e:	48 83 ec 08          	sub    $0x8,%rsp
   28582:	48 8b bd f0 fd ff ff 	mov    -0x210(%rbp),%rdi
   28589:	4c 89 9d e8 fd ff ff 	mov    %r11,-0x218(%rbp)
   28590:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   28594:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   28598:	4c 89 da             	mov    %r11,%rdx
   2859b:	4c 89 d6             	mov    %r10,%rsi
   2859e:	48 89 79 30          	mov    %rdi,0x30(%rcx)
   285a2:	8b 48 14             	mov    0x14(%rax),%ecx
   285a5:	4c 89 ef             	mov    %r13,%rdi
   285a8:	4c 89 95 d0 fd ff ff 	mov    %r10,-0x230(%rbp)
   285af:	68 00 80 00 00       	push   $0x8000
   285b4:	41 53                	push   %r11
   285b6:	41 52                	push   %r10
   285b8:	e8 b3 8d 00 00       	call   31370 <JS_SetPropertyInternal>
   285bd:	4c 8b 9d e8 fd ff ff 	mov    -0x218(%rbp),%r11
   285c4:	48 83 c4 20          	add    $0x20,%rsp
   285c8:	89 c1                	mov    %eax,%ecx
   285ca:	41 83 fb f6          	cmp    $0xfffffff6,%r11d
   285ce:	76 1a                	jbe    285ea <JS_CallInternal+0x319a>
   285d0:	4c 8b 95 d0 fd ff ff 	mov    -0x230(%rbp),%r10
   285d7:	41 8b 42 fc          	mov    -0x4(%r10),%eax
   285db:	83 e8 01             	sub    $0x1,%eax
   285de:	41 89 42 fc          	mov    %eax,-0x4(%r10)
   285e2:	85 c0                	test   %eax,%eax
   285e4:	0f 8e 34 50 00 00    	jle    2d61e <JS_CallInternal+0x81ce>
   285ea:	48 83 eb 20          	sub    $0x20,%rbx
   285ee:	85 c9                	test   %ecx,%ecx
   285f0:	0f 88 40 62 00 00    	js     2e836 <JS_CallInternal+0x93e6>
   285f6:	41 0f b6 44 24 04    	movzbl 0x4(%r12),%eax
   285fc:	49 83 c4 05          	add    $0x5,%r12
   28600:	49 89 c2             	mov    %rax,%r10
   28603:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28607:	ff e0                	jmp    *%rax
   28609:	f3 0f 1e fa          	endbr64
   2860d:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   28611:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   28615:	83 fe ff             	cmp    $0xffffffff,%esi
   28618:	0f 85 58 3a 00 00    	jne    2c076 <JS_CallInternal+0x6c26>
   2861e:	48 89 f9             	mov    %rdi,%rcx
   28621:	0f 1f 40 00          	nopl   0x0(%rax)
   28625:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2862c:	00 00 00 00 
   28630:	4c 8b 41 18          	mov    0x18(%rcx),%r8
   28634:	41 8b 50 18          	mov    0x18(%r8),%edx
   28638:	89 d0                	mov    %edx,%eax
   2863a:	83 e0 32             	and    $0x32,%eax
   2863d:	41 8b 44 80 38       	mov    0x38(%r8,%rax,4),%eax
   28642:	48 85 c0             	test   %rax,%rax
   28645:	0f 84 6b 34 00 00    	je     2bab6 <JS_CallInternal+0x6666>
   2864b:	4c 8d 0c 95 3c 00 00 	lea    0x3c(,%rdx,4),%r9
   28652:	00 
   28653:	48 83 e8 01          	sub    $0x1,%rax
   28657:	49 8d 14 c1          	lea    (%r9,%rax,8),%rdx
   2865b:	4c 01 c2             	add    %r8,%rdx
   2865e:	83 7a 04 32          	cmpl   $0x32,0x4(%rdx)
   28662:	0f 85 41 34 00 00    	jne    2baa9 <JS_CallInternal+0x6659>
   28668:	48 8b 49 20          	mov    0x20(%rcx),%rcx
   2866c:	80 7a 03 3f          	cmpb   $0x3f,0x3(%rdx)
   28670:	0f 87 00 3a 00 00    	ja     2c076 <JS_CallInternal+0x6c26>
   28676:	48 c1 e0 04          	shl    $0x4,%rax
   2867a:	48 01 c1             	add    %rax,%rcx
   2867d:	48 8b 01             	mov    (%rcx),%rax
   28680:	48 8b 49 08          	mov    0x8(%rcx),%rcx
   28684:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   28687:	76 04                	jbe    2868d <JS_CallInternal+0x323d>
   28689:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2868d:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   28691:	83 fe f6             	cmp    $0xfffffff6,%esi
   28694:	76 15                	jbe    286ab <JS_CallInternal+0x325b>
   28696:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   2869a:	8b 57 fc             	mov    -0x4(%rdi),%edx
   2869d:	83 ea 01             	sub    $0x1,%edx
   286a0:	89 57 fc             	mov    %edx,-0x4(%rdi)
   286a3:	85 d2                	test   %edx,%edx
   286a5:	0f 8e d9 4f 00 00    	jle    2d684 <JS_CallInternal+0x8234>
   286ab:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   286af:	49 83 c4 01          	add    $0x1,%r12
   286b3:	48 89 4b f8          	mov    %rcx,-0x8(%rbx)
   286b7:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   286bd:	49 89 c2             	mov    %rax,%r10
   286c0:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   286c4:	ff e0                	jmp    *%rax
   286c6:	f3 0f 1e fa          	endbr64
   286ca:	48 8b 85 48 fe ff ff 	mov    -0x1b8(%rbp),%rax
   286d1:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   286d5:	48 8b 40 10          	mov    0x10(%rax),%rax
   286d9:	48 8b 40 18          	mov    0x18(%rax),%rax
   286dd:	48 8b 10             	mov    (%rax),%rdx
   286e0:	48 8b 40 08          	mov    0x8(%rax),%rax
   286e4:	83 f8 f6             	cmp    $0xfffffff6,%eax
   286e7:	76 04                	jbe    286ed <JS_CallInternal+0x329d>
   286e9:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   286ed:	48 89 13             	mov    %rdx,(%rbx)
   286f0:	49 83 c4 01          	add    $0x1,%r12
   286f4:	48 89 43 08          	mov    %rax,0x8(%rbx)
   286f8:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   286fe:	48 89 cb             	mov    %rcx,%rbx
   28701:	49 89 c2             	mov    %rax,%r10
   28704:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28708:	ff e0                	jmp    *%rax
   2870a:	f3 0f 1e fa          	endbr64
   2870e:	48 8b 85 48 fe ff ff 	mov    -0x1b8(%rbp),%rax
   28715:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   28719:	48 8b 40 08          	mov    0x8(%rax),%rax
   2871d:	48 8b 40 18          	mov    0x18(%rax),%rax
   28721:	48 8b 10             	mov    (%rax),%rdx
   28724:	48 8b 40 08          	mov    0x8(%rax),%rax
   28728:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2872b:	76 04                	jbe    28731 <JS_CallInternal+0x32e1>
   2872d:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   28731:	48 89 13             	mov    %rdx,(%rbx)
   28734:	49 83 c4 01          	add    $0x1,%r12
   28738:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2873c:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28742:	48 89 cb             	mov    %rcx,%rbx
   28745:	49 89 c2             	mov    %rax,%r10
   28748:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2874c:	ff e0                	jmp    *%rax
   2874e:	f3 0f 1e fa          	endbr64
   28752:	48 8b 85 48 fe ff ff 	mov    -0x1b8(%rbp),%rax
   28759:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   2875d:	48 8b 00             	mov    (%rax),%rax
   28760:	48 8b 40 18          	mov    0x18(%rax),%rax
   28764:	48 8b 10             	mov    (%rax),%rdx
   28767:	48 8b 40 08          	mov    0x8(%rax),%rax
   2876b:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2876e:	76 04                	jbe    28774 <JS_CallInternal+0x3324>
   28770:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   28774:	48 89 13             	mov    %rdx,(%rbx)
   28777:	49 83 c4 01          	add    $0x1,%r12
   2877b:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2877f:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28785:	48 89 cb             	mov    %rcx,%rbx
   28788:	49 89 c2             	mov    %rax,%r10
   2878b:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2878f:	ff e0                	jmp    *%rax
   28791:	f3 0f 1e fa          	endbr64
   28795:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   28799:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2879d:	83 fa f6             	cmp    $0xfffffff6,%edx
   287a0:	76 04                	jbe    287a6 <JS_CallInternal+0x3356>
   287a2:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   287a6:	48 8b bd 40 fe ff ff 	mov    -0x1c0(%rbp),%rdi
   287ad:	48 8b 47 38          	mov    0x38(%rdi),%rax
   287b1:	48 8b 77 30          	mov    0x30(%rdi),%rsi
   287b5:	48 89 57 38          	mov    %rdx,0x38(%rdi)
   287b9:	48 89 4f 30          	mov    %rcx,0x30(%rdi)
   287bd:	83 f8 f6             	cmp    $0xfffffff6,%eax
   287c0:	76 11                	jbe    287d3 <JS_CallInternal+0x3383>
   287c2:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   287c5:	8d 51 ff             	lea    -0x1(%rcx),%edx
   287c8:	89 56 fc             	mov    %edx,-0x4(%rsi)
   287cb:	85 d2                	test   %edx,%edx
   287cd:	0f 8e e1 4e 00 00    	jle    2d6b4 <JS_CallInternal+0x8264>
   287d3:	41 0f b6 04 24       	movzbl (%r12),%eax
   287d8:	49 83 c4 01          	add    $0x1,%r12
   287dc:	49 89 c2             	mov    %rax,%r10
   287df:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   287e3:	ff e0                	jmp    *%rax
   287e5:	f3 0f 1e fa          	endbr64
   287e9:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   287ed:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   287f1:	83 fa f6             	cmp    $0xfffffff6,%edx
   287f4:	76 04                	jbe    287fa <JS_CallInternal+0x33aa>
   287f6:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   287fa:	48 8b bd 40 fe ff ff 	mov    -0x1c0(%rbp),%rdi
   28801:	48 8b 47 28          	mov    0x28(%rdi),%rax
   28805:	48 8b 77 20          	mov    0x20(%rdi),%rsi
   28809:	48 89 57 28          	mov    %rdx,0x28(%rdi)
   2880d:	48 89 4f 20          	mov    %rcx,0x20(%rdi)
   28811:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28814:	76 11                	jbe    28827 <JS_CallInternal+0x33d7>
   28816:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   28819:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2881c:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2881f:	85 d2                	test   %edx,%edx
   28821:	0f 8e 13 50 00 00    	jle    2d83a <JS_CallInternal+0x83ea>
   28827:	41 0f b6 04 24       	movzbl (%r12),%eax
   2882c:	49 83 c4 01          	add    $0x1,%r12
   28830:	49 89 c2             	mov    %rax,%r10
   28833:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28837:	ff e0                	jmp    *%rax
   28839:	f3 0f 1e fa          	endbr64
   2883d:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   28841:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   28845:	83 fa f6             	cmp    $0xfffffff6,%edx
   28848:	76 04                	jbe    2884e <JS_CallInternal+0x33fe>
   2884a:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   2884e:	48 8b bd 40 fe ff ff 	mov    -0x1c0(%rbp),%rdi
   28855:	48 8b 47 08          	mov    0x8(%rdi),%rax
   28859:	48 8b 37             	mov    (%rdi),%rsi
   2885c:	48 89 57 08          	mov    %rdx,0x8(%rdi)
   28860:	48 89 0f             	mov    %rcx,(%rdi)
   28863:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28866:	76 11                	jbe    28879 <JS_CallInternal+0x3429>
   28868:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   2886b:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2886e:	89 56 fc             	mov    %edx,-0x4(%rsi)
   28871:	85 d2                	test   %edx,%edx
   28873:	0f 8e e3 4f 00 00    	jle    2d85c <JS_CallInternal+0x840c>
   28879:	41 0f b6 04 24       	movzbl (%r12),%eax
   2887e:	49 83 c4 01          	add    $0x1,%r12
   28882:	49 89 c2             	mov    %rax,%r10
   28885:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28889:	ff e0                	jmp    *%rax
   2888b:	f3 0f 1e fa          	endbr64
   2888f:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   28893:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   28897:	83 fa f6             	cmp    $0xfffffff6,%edx
   2889a:	76 04                	jbe    288a0 <JS_CallInternal+0x3450>
   2889c:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   288a0:	48 8b bd 40 fe ff ff 	mov    -0x1c0(%rbp),%rdi
   288a7:	48 8b 47 18          	mov    0x18(%rdi),%rax
   288ab:	48 8b 77 10          	mov    0x10(%rdi),%rsi
   288af:	48 89 57 18          	mov    %rdx,0x18(%rdi)
   288b3:	48 89 4f 10          	mov    %rcx,0x10(%rdi)
   288b7:	83 f8 f6             	cmp    $0xfffffff6,%eax
   288ba:	76 11                	jbe    288cd <JS_CallInternal+0x347d>
   288bc:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   288bf:	8d 51 ff             	lea    -0x1(%rcx),%edx
   288c2:	89 56 fc             	mov    %edx,-0x4(%rsi)
   288c5:	85 d2                	test   %edx,%edx
   288c7:	0f 8e 7e 4f 00 00    	jle    2d84b <JS_CallInternal+0x83fb>
   288cd:	41 0f b6 04 24       	movzbl (%r12),%eax
   288d2:	49 83 c4 01          	add    $0x1,%r12
   288d6:	49 89 c2             	mov    %rax,%r10
   288d9:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   288dd:	ff e0                	jmp    *%rax
   288df:	f3 0f 1e fa          	endbr64
   288e3:	48 8b bd 40 fe ff ff 	mov    -0x1c0(%rbp),%rdi
   288ea:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   288ef:	48 83 eb 10          	sub    $0x10,%rbx
   288f3:	48 8b 47 38          	mov    0x38(%rdi),%rax
   288f7:	48 8b 4f 30          	mov    0x30(%rdi),%rcx
   288fb:	0f 11 47 30          	movups %xmm0,0x30(%rdi)
   288ff:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28902:	76 11                	jbe    28915 <JS_CallInternal+0x34c5>
   28904:	8b 79 fc             	mov    -0x4(%rcx),%edi
   28907:	8d 57 ff             	lea    -0x1(%rdi),%edx
   2890a:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2890d:	85 d2                	test   %edx,%edx
   2890f:	0f 8e 58 4f 00 00    	jle    2d86d <JS_CallInternal+0x841d>
   28915:	41 0f b6 04 24       	movzbl (%r12),%eax
   2891a:	49 83 c4 01          	add    $0x1,%r12
   2891e:	49 89 c2             	mov    %rax,%r10
   28921:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28925:	ff e0                	jmp    *%rax
   28927:	f3 0f 1e fa          	endbr64
   2892b:	48 8b bd 40 fe ff ff 	mov    -0x1c0(%rbp),%rdi
   28932:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   28937:	48 83 eb 10          	sub    $0x10,%rbx
   2893b:	48 8b 47 28          	mov    0x28(%rdi),%rax
   2893f:	48 8b 4f 20          	mov    0x20(%rdi),%rcx
   28943:	0f 11 47 20          	movups %xmm0,0x20(%rdi)
   28947:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2894a:	76 11                	jbe    2895d <JS_CallInternal+0x350d>
   2894c:	8b 79 fc             	mov    -0x4(%rcx),%edi
   2894f:	8d 57 ff             	lea    -0x1(%rdi),%edx
   28952:	89 51 fc             	mov    %edx,-0x4(%rcx)
   28955:	85 d2                	test   %edx,%edx
   28957:	0f 8e 32 53 00 00    	jle    2dc8f <JS_CallInternal+0x883f>
   2895d:	41 0f b6 04 24       	movzbl (%r12),%eax
   28962:	49 83 c4 01          	add    $0x1,%r12
   28966:	49 89 c2             	mov    %rax,%r10
   28969:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2896d:	ff e0                	jmp    *%rax
   2896f:	f3 0f 1e fa          	endbr64
   28973:	48 8b 85 40 fe ff ff 	mov    -0x1c0(%rbp),%rax
   2897a:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   2897e:	48 8b 50 20          	mov    0x20(%rax),%rdx
   28982:	48 8b 40 28          	mov    0x28(%rax),%rax
   28986:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28989:	76 04                	jbe    2898f <JS_CallInternal+0x353f>
   2898b:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2898f:	48 89 13             	mov    %rdx,(%rbx)
   28992:	49 83 c4 01          	add    $0x1,%r12
   28996:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2899a:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   289a0:	48 89 cb             	mov    %rcx,%rbx
   289a3:	49 89 c2             	mov    %rax,%r10
   289a6:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   289aa:	ff e0                	jmp    *%rax
   289ac:	f3 0f 1e fa          	endbr64
   289b0:	48 8b 85 40 fe ff ff 	mov    -0x1c0(%rbp),%rax
   289b7:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   289bb:	48 8b 50 10          	mov    0x10(%rax),%rdx
   289bf:	48 8b 40 18          	mov    0x18(%rax),%rax
   289c3:	83 f8 f6             	cmp    $0xfffffff6,%eax
   289c6:	76 04                	jbe    289cc <JS_CallInternal+0x357c>
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
   289ed:	48 8b 8d 40 fe ff ff 	mov    -0x1c0(%rbp),%rcx
   289f4:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   289f8:	48 8b 01             	mov    (%rcx),%rax
   289fb:	83 fa ff             	cmp    $0xffffffff,%edx
   289fe:	0f 84 24 3e 00 00    	je     2c828 <JS_CallInternal+0x73d8>
   28a04:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   28a08:	83 fa f6             	cmp    $0xfffffff6,%edx
   28a0b:	76 04                	jbe    28a11 <JS_CallInternal+0x35c1>
   28a0d:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   28a11:	48 89 03             	mov    %rax,(%rbx)
   28a14:	4c 89 e0             	mov    %r12,%rax
   28a17:	4d 8d 64 24 01       	lea    0x1(%r12),%r12
   28a1c:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   28a20:	0f b6 00             	movzbl (%rax),%eax
   28a23:	48 89 cb             	mov    %rcx,%rbx
   28a26:	49 89 c2             	mov    %rax,%r10
   28a29:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   28a2d:	f3 0f 1e fa          	endbr64
   28a31:	48 8b 85 40 fe ff ff 	mov    -0x1c0(%rbp),%rax
   28a38:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   28a3c:	48 8b 10             	mov    (%rax),%rdx
   28a3f:	48 8b 40 08          	mov    0x8(%rax),%rax
   28a43:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28a46:	76 04                	jbe    28a4c <JS_CallInternal+0x35fc>
   28a48:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   28a4c:	48 89 13             	mov    %rdx,(%rbx)
   28a4f:	49 83 c4 01          	add    $0x1,%r12
   28a53:	48 89 43 08          	mov    %rax,0x8(%rbx)
   28a57:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28a5d:	48 89 cb             	mov    %rcx,%rbx
   28a60:	49 89 c2             	mov    %rax,%r10
   28a63:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28a67:	ff e0                	jmp    *%rax
   28a69:	f3 0f 1e fa          	endbr64
   28a6d:	48 8b bd 40 fe ff ff 	mov    -0x1c0(%rbp),%rdi
   28a74:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   28a79:	48 83 eb 10          	sub    $0x10,%rbx
   28a7d:	48 8b 47 08          	mov    0x8(%rdi),%rax
   28a81:	48 8b 0f             	mov    (%rdi),%rcx
   28a84:	0f 11 07             	movups %xmm0,(%rdi)
   28a87:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28a8a:	76 11                	jbe    28a9d <JS_CallInternal+0x364d>
   28a8c:	8b 79 fc             	mov    -0x4(%rcx),%edi
   28a8f:	8d 57 ff             	lea    -0x1(%rdi),%edx
   28a92:	89 51 fc             	mov    %edx,-0x4(%rcx)
   28a95:	85 d2                	test   %edx,%edx
   28a97:	0f 8e 9a 51 00 00    	jle    2dc37 <JS_CallInternal+0x87e7>
   28a9d:	41 0f b6 04 24       	movzbl (%r12),%eax
   28aa2:	49 83 c4 01          	add    $0x1,%r12
   28aa6:	49 89 c2             	mov    %rax,%r10
   28aa9:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28aad:	ff e0                	jmp    *%rax
   28aaf:	f3 0f 1e fa          	endbr64
   28ab3:	48 8b 85 40 fe ff ff 	mov    -0x1c0(%rbp),%rax
   28aba:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   28abe:	48 8b 50 30          	mov    0x30(%rax),%rdx
   28ac2:	48 8b 40 38          	mov    0x38(%rax),%rax
   28ac6:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28ac9:	76 04                	jbe    28acf <JS_CallInternal+0x367f>
   28acb:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   28acf:	48 89 13             	mov    %rdx,(%rbx)
   28ad2:	49 83 c4 01          	add    $0x1,%r12
   28ad6:	48 89 43 08          	mov    %rax,0x8(%rbx)
   28ada:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28ae0:	48 89 cb             	mov    %rcx,%rbx
   28ae3:	49 89 c2             	mov    %rax,%r10
   28ae6:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28aea:	ff e0                	jmp    *%rax
   28aec:	f3 0f 1e fa          	endbr64
   28af0:	48 8b bd 40 fe ff ff 	mov    -0x1c0(%rbp),%rdi
   28af7:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   28afc:	48 83 eb 10          	sub    $0x10,%rbx
   28b00:	48 8b 47 18          	mov    0x18(%rdi),%rax
   28b04:	48 8b 4f 10          	mov    0x10(%rdi),%rcx
   28b08:	0f 11 47 10          	movups %xmm0,0x10(%rdi)
   28b0c:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28b0f:	76 11                	jbe    28b22 <JS_CallInternal+0x36d2>
   28b11:	8b 79 fc             	mov    -0x4(%rcx),%edi
   28b14:	8d 57 ff             	lea    -0x1(%rdi),%edx
   28b17:	89 51 fc             	mov    %edx,-0x4(%rcx)
   28b1a:	85 d2                	test   %edx,%edx
   28b1c:	0f 8e 81 51 00 00    	jle    2dca3 <JS_CallInternal+0x8853>
   28b22:	41 0f b6 04 24       	movzbl (%r12),%eax
   28b27:	49 83 c4 01          	add    $0x1,%r12
   28b2b:	49 89 c2             	mov    %rax,%r10
   28b2e:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28b32:	ff e0                	jmp    *%rax
   28b34:	f3 0f 1e fa          	endbr64
   28b38:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   28b3c:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   28b40:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   28b43:	76 04                	jbe    28b49 <JS_CallInternal+0x36f9>
   28b45:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   28b49:	48 8b 85 48 fe ff ff 	mov    -0x1b8(%rbp),%rax
   28b50:	48 8b 40 10          	mov    0x10(%rax),%rax
   28b54:	48 8b 40 18          	mov    0x18(%rax),%rax
   28b58:	48 8b 50 08          	mov    0x8(%rax),%rdx
   28b5c:	48 8b 38             	mov    (%rax),%rdi
   28b5f:	48 89 48 08          	mov    %rcx,0x8(%rax)
   28b63:	48 89 30             	mov    %rsi,(%rax)
   28b66:	83 fa f6             	cmp    $0xfffffff6,%edx
   28b69:	76 11                	jbe    28b7c <JS_CallInternal+0x372c>
   28b6b:	8b 47 fc             	mov    -0x4(%rdi),%eax
   28b6e:	83 e8 01             	sub    $0x1,%eax
   28b71:	89 47 fc             	mov    %eax,-0x4(%rdi)
   28b74:	85 c0                	test   %eax,%eax
   28b76:	0f 8e cf 50 00 00    	jle    2dc4b <JS_CallInternal+0x87fb>
   28b7c:	41 0f b6 04 24       	movzbl (%r12),%eax
   28b81:	49 83 c4 01          	add    $0x1,%r12
   28b85:	49 89 c2             	mov    %rax,%r10
   28b88:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28b8c:	ff e0                	jmp    *%rax
   28b8e:	f3 0f 1e fa          	endbr64
   28b92:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   28b96:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   28b9a:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   28b9d:	76 04                	jbe    28ba3 <JS_CallInternal+0x3753>
   28b9f:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   28ba3:	48 8b 85 48 fe ff ff 	mov    -0x1b8(%rbp),%rax
   28baa:	48 8b 00             	mov    (%rax),%rax
   28bad:	48 8b 40 18          	mov    0x18(%rax),%rax
   28bb1:	48 8b 50 08          	mov    0x8(%rax),%rdx
   28bb5:	48 8b 38             	mov    (%rax),%rdi
   28bb8:	48 89 48 08          	mov    %rcx,0x8(%rax)
   28bbc:	48 89 30             	mov    %rsi,(%rax)
   28bbf:	83 fa f6             	cmp    $0xfffffff6,%edx
   28bc2:	76 11                	jbe    28bd5 <JS_CallInternal+0x3785>
   28bc4:	8b 47 fc             	mov    -0x4(%rdi),%eax
   28bc7:	83 e8 01             	sub    $0x1,%eax
   28bca:	89 47 fc             	mov    %eax,-0x4(%rdi)
   28bcd:	85 c0                	test   %eax,%eax
   28bcf:	0f 8e 98 50 00 00    	jle    2dc6d <JS_CallInternal+0x881d>
   28bd5:	41 0f b6 04 24       	movzbl (%r12),%eax
   28bda:	49 83 c4 01          	add    $0x1,%r12
   28bde:	49 89 c2             	mov    %rax,%r10
   28be1:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28be5:	ff e0                	jmp    *%rax
   28be7:	f3 0f 1e fa          	endbr64
   28beb:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   28bef:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   28bf3:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   28bf6:	76 04                	jbe    28bfc <JS_CallInternal+0x37ac>
   28bf8:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   28bfc:	48 8b 85 48 fe ff ff 	mov    -0x1b8(%rbp),%rax
   28c03:	48 8b 40 08          	mov    0x8(%rax),%rax
   28c07:	48 8b 40 18          	mov    0x18(%rax),%rax
   28c0b:	48 8b 50 08          	mov    0x8(%rax),%rdx
   28c0f:	48 8b 38             	mov    (%rax),%rdi
   28c12:	48 89 48 08          	mov    %rcx,0x8(%rax)
   28c16:	48 89 30             	mov    %rsi,(%rax)
   28c19:	83 fa f6             	cmp    $0xfffffff6,%edx
   28c1c:	76 11                	jbe    28c2f <JS_CallInternal+0x37df>
   28c1e:	8b 47 fc             	mov    -0x4(%rdi),%eax
   28c21:	83 e8 01             	sub    $0x1,%eax
   28c24:	89 47 fc             	mov    %eax,-0x4(%rdi)
   28c27:	85 c0                	test   %eax,%eax
   28c29:	0f 8e 2d 50 00 00    	jle    2dc5c <JS_CallInternal+0x880c>
   28c2f:	41 0f b6 04 24       	movzbl (%r12),%eax
   28c34:	49 83 c4 01          	add    $0x1,%r12
   28c38:	49 89 c2             	mov    %rax,%r10
   28c3b:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28c3f:	ff e0                	jmp    *%rax
   28c41:	f3 0f 1e fa          	endbr64
   28c45:	48 8b 85 48 fe ff ff 	mov    -0x1b8(%rbp),%rax
   28c4c:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   28c51:	48 83 eb 10          	sub    $0x10,%rbx
   28c55:	48 8b 40 18          	mov    0x18(%rax),%rax
   28c59:	48 8b 40 18          	mov    0x18(%rax),%rax
   28c5d:	48 8b 50 08          	mov    0x8(%rax),%rdx
   28c61:	48 8b 08             	mov    (%rax),%rcx
   28c64:	0f 11 00             	movups %xmm0,(%rax)
   28c67:	83 fa f6             	cmp    $0xfffffff6,%edx
   28c6a:	76 11                	jbe    28c7d <JS_CallInternal+0x382d>
   28c6c:	8b 41 fc             	mov    -0x4(%rcx),%eax
   28c6f:	83 e8 01             	sub    $0x1,%eax
   28c72:	89 41 fc             	mov    %eax,-0x4(%rcx)
   28c75:	85 c0                	test   %eax,%eax
   28c77:	0f 8e 01 50 00 00    	jle    2dc7e <JS_CallInternal+0x882e>
   28c7d:	41 0f b6 04 24       	movzbl (%r12),%eax
   28c82:	49 83 c4 01          	add    $0x1,%r12
   28c86:	49 89 c2             	mov    %rax,%r10
   28c89:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28c8d:	ff e0                	jmp    *%rax
   28c8f:	f3 0f 1e fa          	endbr64
   28c93:	48 8b 85 48 fe ff ff 	mov    -0x1b8(%rbp),%rax
   28c9a:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   28c9f:	48 83 eb 10          	sub    $0x10,%rbx
   28ca3:	48 8b 40 10          	mov    0x10(%rax),%rax
   28ca7:	48 8b 40 18          	mov    0x18(%rax),%rax
   28cab:	48 8b 50 08          	mov    0x8(%rax),%rdx
   28caf:	48 8b 08             	mov    (%rax),%rcx
   28cb2:	0f 11 00             	movups %xmm0,(%rax)
   28cb5:	83 fa f6             	cmp    $0xfffffff6,%edx
   28cb8:	76 11                	jbe    28ccb <JS_CallInternal+0x387b>
   28cba:	8b 41 fc             	mov    -0x4(%rcx),%eax
   28cbd:	83 e8 01             	sub    $0x1,%eax
   28cc0:	89 41 fc             	mov    %eax,-0x4(%rcx)
   28cc3:	85 c0                	test   %eax,%eax
   28cc5:	0f 8e 78 50 00 00    	jle    2dd43 <JS_CallInternal+0x88f3>
   28ccb:	41 0f b6 04 24       	movzbl (%r12),%eax
   28cd0:	49 83 c4 01          	add    $0x1,%r12
   28cd4:	49 89 c2             	mov    %rax,%r10
   28cd7:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28cdb:	ff e0                	jmp    *%rax
   28cdd:	f3 0f 1e fa          	endbr64
   28ce1:	48 8b 85 48 fe ff ff 	mov    -0x1b8(%rbp),%rax
   28ce8:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   28ced:	48 83 eb 10          	sub    $0x10,%rbx
   28cf1:	48 8b 00             	mov    (%rax),%rax
   28cf4:	48 8b 40 18          	mov    0x18(%rax),%rax
   28cf8:	48 8b 50 08          	mov    0x8(%rax),%rdx
   28cfc:	48 8b 08             	mov    (%rax),%rcx
   28cff:	0f 11 00             	movups %xmm0,(%rax)
   28d02:	83 fa f6             	cmp    $0xfffffff6,%edx
   28d05:	76 11                	jbe    28d18 <JS_CallInternal+0x38c8>
   28d07:	8b 41 fc             	mov    -0x4(%rcx),%eax
   28d0a:	83 e8 01             	sub    $0x1,%eax
   28d0d:	89 41 fc             	mov    %eax,-0x4(%rcx)
   28d10:	85 c0                	test   %eax,%eax
   28d12:	0f 8e 80 50 00 00    	jle    2dd98 <JS_CallInternal+0x8948>
   28d18:	41 0f b6 04 24       	movzbl (%r12),%eax
   28d1d:	49 83 c4 01          	add    $0x1,%r12
   28d21:	49 89 c2             	mov    %rax,%r10
   28d24:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28d28:	ff e0                	jmp    *%rax
   28d2a:	f3 0f 1e fa          	endbr64
   28d2e:	48 8b 85 48 fe ff ff 	mov    -0x1b8(%rbp),%rax
   28d35:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   28d3a:	48 83 eb 10          	sub    $0x10,%rbx
   28d3e:	48 8b 40 08          	mov    0x8(%rax),%rax
   28d42:	48 8b 40 18          	mov    0x18(%rax),%rax
   28d46:	48 8b 50 08          	mov    0x8(%rax),%rdx
   28d4a:	48 8b 08             	mov    (%rax),%rcx
   28d4d:	0f 11 00             	movups %xmm0,(%rax)
   28d50:	83 fa f6             	cmp    $0xfffffff6,%edx
   28d53:	76 11                	jbe    28d66 <JS_CallInternal+0x3916>
   28d55:	8b 41 fc             	mov    -0x4(%rcx),%eax
   28d58:	83 e8 01             	sub    $0x1,%eax
   28d5b:	89 41 fc             	mov    %eax,-0x4(%rcx)
   28d5e:	85 c0                	test   %eax,%eax
   28d60:	0f 8e ee 4f 00 00    	jle    2dd54 <JS_CallInternal+0x8904>
   28d66:	41 0f b6 04 24       	movzbl (%r12),%eax
   28d6b:	49 83 c4 01          	add    $0x1,%r12
   28d6f:	49 89 c2             	mov    %rax,%r10
   28d72:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28d76:	ff e0                	jmp    *%rax
   28d78:	f3 0f 1e fa          	endbr64
   28d7c:	48 8b 85 48 fe ff ff 	mov    -0x1b8(%rbp),%rax
   28d83:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   28d87:	48 8b 40 18          	mov    0x18(%rax),%rax
   28d8b:	48 8b 40 18          	mov    0x18(%rax),%rax
   28d8f:	48 8b 10             	mov    (%rax),%rdx
   28d92:	48 8b 40 08          	mov    0x8(%rax),%rax
   28d96:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28d99:	76 04                	jbe    28d9f <JS_CallInternal+0x394f>
   28d9b:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   28d9f:	48 89 13             	mov    %rdx,(%rbx)
   28da2:	49 83 c4 01          	add    $0x1,%r12
   28da6:	48 89 43 08          	mov    %rax,0x8(%rbx)
   28daa:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28db0:	48 89 cb             	mov    %rcx,%rbx
   28db3:	49 89 c2             	mov    %rax,%r10
   28db6:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28dba:	ff e0                	jmp    *%rax
   28dbc:	f3 0f 1e fa          	endbr64
   28dc0:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   28dc4:	41 0f b7 04 24       	movzwl (%r12),%eax
   28dc9:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   28dcd:	83 fe f6             	cmp    $0xfffffff6,%esi
   28dd0:	76 04                	jbe    28dd6 <JS_CallInternal+0x3986>
   28dd2:	83 47 fc 01          	addl   $0x1,-0x4(%rdi)
   28dd6:	48 8b 8d 48 fe ff ff 	mov    -0x1b8(%rbp),%rcx
   28ddd:	48 8b 04 c1          	mov    (%rcx,%rax,8),%rax
   28de1:	48 8b 40 18          	mov    0x18(%rax),%rax
   28de5:	48 8b 50 08          	mov    0x8(%rax),%rdx
   28de9:	48 8b 08             	mov    (%rax),%rcx
   28dec:	48 89 70 08          	mov    %rsi,0x8(%rax)
   28df0:	48 89 38             	mov    %rdi,(%rax)
   28df3:	83 fa f6             	cmp    $0xfffffff6,%edx
   28df6:	76 11                	jbe    28e09 <JS_CallInternal+0x39b9>
   28df8:	8b 41 fc             	mov    -0x4(%rcx),%eax
   28dfb:	83 e8 01             	sub    $0x1,%eax
   28dfe:	89 41 fc             	mov    %eax,-0x4(%rcx)
   28e01:	85 c0                	test   %eax,%eax
   28e03:	0f 8e 7e 4f 00 00    	jle    2dd87 <JS_CallInternal+0x8937>
   28e09:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   28e0f:	49 83 c4 03          	add    $0x3,%r12
   28e13:	49 89 c2             	mov    %rax,%r10
   28e16:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28e1a:	ff e0                	jmp    *%rax
   28e1c:	f3 0f 1e fa          	endbr64
   28e20:	41 0f b7 04 24       	movzwl (%r12),%eax
   28e25:	48 8b 8d 48 fe ff ff 	mov    -0x1b8(%rbp),%rcx
   28e2c:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   28e31:	48 8b 04 c1          	mov    (%rcx,%rax,8),%rax
   28e35:	48 8b 40 18          	mov    0x18(%rax),%rax
   28e39:	48 8b 50 08          	mov    0x8(%rax),%rdx
   28e3d:	48 8b 08             	mov    (%rax),%rcx
   28e40:	0f 11 00             	movups %xmm0,(%rax)
   28e43:	83 fa f6             	cmp    $0xfffffff6,%edx
   28e46:	76 11                	jbe    28e59 <JS_CallInternal+0x3a09>
   28e48:	8b 41 fc             	mov    -0x4(%rcx),%eax
   28e4b:	83 e8 01             	sub    $0x1,%eax
   28e4e:	89 41 fc             	mov    %eax,-0x4(%rcx)
   28e51:	85 c0                	test   %eax,%eax
   28e53:	0f 8e 0c 4f 00 00    	jle    2dd65 <JS_CallInternal+0x8915>
   28e59:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   28e5f:	48 83 eb 10          	sub    $0x10,%rbx
   28e63:	49 83 c4 03          	add    $0x3,%r12
   28e67:	49 89 c2             	mov    %rax,%r10
   28e6a:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28e6e:	ff e0                	jmp    *%rax
   28e70:	f3 0f 1e fa          	endbr64
   28e74:	41 0f b7 04 24       	movzwl (%r12),%eax
   28e79:	48 8b 8d 48 fe ff ff 	mov    -0x1b8(%rbp),%rcx
   28e80:	48 8b 04 c1          	mov    (%rcx,%rax,8),%rax
   28e84:	48 8b 40 18          	mov    0x18(%rax),%rax
   28e88:	48 8b 10             	mov    (%rax),%rdx
   28e8b:	48 8b 40 08          	mov    0x8(%rax),%rax
   28e8f:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28e92:	76 04                	jbe    28e98 <JS_CallInternal+0x3a48>
   28e94:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   28e98:	48 89 13             	mov    %rdx,(%rbx)
   28e9b:	49 83 c4 03          	add    $0x3,%r12
   28e9f:	48 83 c3 10          	add    $0x10,%rbx
   28ea3:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   28ea7:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28ead:	49 89 c2             	mov    %rax,%r10
   28eb0:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28eb4:	ff e0                	jmp    *%rax
   28eb6:	f3 0f 1e fa          	endbr64
   28eba:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   28ebe:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   28ec2:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   28ec5:	76 04                	jbe    28ecb <JS_CallInternal+0x3a7b>
   28ec7:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   28ecb:	48 8b 85 48 fe ff ff 	mov    -0x1b8(%rbp),%rax
   28ed2:	48 8b 40 18          	mov    0x18(%rax),%rax
   28ed6:	48 8b 40 18          	mov    0x18(%rax),%rax
   28eda:	48 8b 50 08          	mov    0x8(%rax),%rdx
   28ede:	48 8b 38             	mov    (%rax),%rdi
   28ee1:	48 89 48 08          	mov    %rcx,0x8(%rax)
   28ee5:	48 89 30             	mov    %rsi,(%rax)
   28ee8:	83 fa f6             	cmp    $0xfffffff6,%edx
   28eeb:	76 11                	jbe    28efe <JS_CallInternal+0x3aae>
   28eed:	8b 47 fc             	mov    -0x4(%rdi),%eax
   28ef0:	83 e8 01             	sub    $0x1,%eax
   28ef3:	89 47 fc             	mov    %eax,-0x4(%rdi)
   28ef6:	85 c0                	test   %eax,%eax
   28ef8:	0f 8e 78 4e 00 00    	jle    2dd76 <JS_CallInternal+0x8926>
   28efe:	41 0f b6 04 24       	movzbl (%r12),%eax
   28f03:	49 83 c4 01          	add    $0x1,%r12
   28f07:	49 89 c2             	mov    %rax,%r10
   28f0a:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28f0e:	ff e0                	jmp    *%rax
   28f10:	f3 0f 1e fa          	endbr64
   28f14:	41 0f b7 34 24       	movzwl (%r12),%esi
   28f19:	48 8b 85 48 fe ff ff 	mov    -0x1b8(%rbp),%rax
   28f20:	49 8d 4c 24 02       	lea    0x2(%r12),%rcx
   28f25:	48 8b 04 f0          	mov    (%rax,%rsi,8),%rax
   28f29:	48 8b 40 18          	mov    0x18(%rax),%rax
   28f2d:	48 8b 10             	mov    (%rax),%rdx
   28f30:	48 8b 40 08          	mov    0x8(%rax),%rax
   28f34:	83 f8 04             	cmp    $0x4,%eax
   28f37:	0f 84 f8 54 00 00    	je     2e435 <JS_CallInternal+0x8fe5>
   28f3d:	83 f8 f6             	cmp    $0xfffffff6,%eax
   28f40:	76 04                	jbe    28f46 <JS_CallInternal+0x3af6>
   28f42:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   28f46:	48 89 13             	mov    %rdx,(%rbx)
   28f49:	49 83 c4 03          	add    $0x3,%r12
   28f4d:	48 83 c3 10          	add    $0x10,%rbx
   28f51:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   28f55:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   28f5b:	49 89 c2             	mov    %rax,%r10
   28f5e:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28f62:	ff e0                	jmp    *%rax
   28f64:	f3 0f 1e fa          	endbr64
   28f68:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   28f6c:	41 0f b7 04 24       	movzwl (%r12),%eax
   28f71:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   28f75:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   28f78:	76 04                	jbe    28f7e <JS_CallInternal+0x3b2e>
   28f7a:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   28f7e:	48 c1 e0 04          	shl    $0x4,%rax
   28f82:	48 03 85 40 fe ff ff 	add    -0x1c0(%rbp),%rax
   28f89:	48 8b 50 08          	mov    0x8(%rax),%rdx
   28f8d:	48 8b 38             	mov    (%rax),%rdi
   28f90:	48 89 48 08          	mov    %rcx,0x8(%rax)
   28f94:	48 89 30             	mov    %rsi,(%rax)
   28f97:	83 fa f6             	cmp    $0xfffffff6,%edx
   28f9a:	76 11                	jbe    28fad <JS_CallInternal+0x3b5d>
   28f9c:	8b 47 fc             	mov    -0x4(%rdi),%eax
   28f9f:	83 e8 01             	sub    $0x1,%eax
   28fa2:	89 47 fc             	mov    %eax,-0x4(%rdi)
   28fa5:	85 c0                	test   %eax,%eax
   28fa7:	0f 8e d4 48 00 00    	jle    2d881 <JS_CallInternal+0x8431>
   28fad:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   28fb3:	49 83 c4 03          	add    $0x3,%r12
   28fb7:	49 89 c2             	mov    %rax,%r10
   28fba:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   28fbe:	ff e0                	jmp    *%rax
   28fc0:	f3 0f 1e fa          	endbr64
   28fc4:	41 0f b7 04 24       	movzwl (%r12),%eax
   28fc9:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   28fce:	48 c1 e0 04          	shl    $0x4,%rax
   28fd2:	48 03 85 40 fe ff ff 	add    -0x1c0(%rbp),%rax
   28fd9:	48 8b 50 08          	mov    0x8(%rax),%rdx
   28fdd:	48 8b 08             	mov    (%rax),%rcx
   28fe0:	0f 11 00             	movups %xmm0,(%rax)
   28fe3:	83 fa f6             	cmp    $0xfffffff6,%edx
   28fe6:	76 11                	jbe    28ff9 <JS_CallInternal+0x3ba9>
   28fe8:	8b 41 fc             	mov    -0x4(%rcx),%eax
   28feb:	83 e8 01             	sub    $0x1,%eax
   28fee:	89 41 fc             	mov    %eax,-0x4(%rcx)
   28ff1:	85 c0                	test   %eax,%eax
   28ff3:	0f 8e 99 48 00 00    	jle    2d892 <JS_CallInternal+0x8442>
   28ff9:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   28fff:	48 83 eb 10          	sub    $0x10,%rbx
   29003:	49 83 c4 03          	add    $0x3,%r12
   29007:	49 89 c2             	mov    %rax,%r10
   2900a:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2900e:	ff e0                	jmp    *%rax
   29010:	f3 0f 1e fa          	endbr64
   29014:	41 0f b7 04 24       	movzwl (%r12),%eax
   29019:	48 c1 e0 04          	shl    $0x4,%rax
   2901d:	48 03 85 40 fe ff ff 	add    -0x1c0(%rbp),%rax
   29024:	48 8b 10             	mov    (%rax),%rdx
   29027:	48 8b 40 08          	mov    0x8(%rax),%rax
   2902b:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2902e:	76 04                	jbe    29034 <JS_CallInternal+0x3be4>
   29030:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   29034:	48 89 13             	mov    %rdx,(%rbx)
   29037:	49 83 c4 03          	add    $0x3,%r12
   2903b:	48 83 c3 10          	add    $0x10,%rbx
   2903f:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   29043:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29049:	49 89 c2             	mov    %rax,%r10
   2904c:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29050:	ff e0                	jmp    *%rax
   29052:	f3 0f 1e fa          	endbr64
   29056:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2905a:	41 0f b7 04 24       	movzwl (%r12),%eax
   2905f:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   29063:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   29066:	76 04                	jbe    2906c <JS_CallInternal+0x3c1c>
   29068:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2906c:	48 c1 e0 04          	shl    $0x4,%rax
   29070:	48 03 85 58 fe ff ff 	add    -0x1a8(%rbp),%rax
   29077:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2907b:	48 8b 38             	mov    (%rax),%rdi
   2907e:	48 89 48 08          	mov    %rcx,0x8(%rax)
   29082:	48 89 30             	mov    %rsi,(%rax)
   29085:	83 fa f6             	cmp    $0xfffffff6,%edx
   29088:	76 11                	jbe    2909b <JS_CallInternal+0x3c4b>
   2908a:	8b 47 fc             	mov    -0x4(%rdi),%eax
   2908d:	83 e8 01             	sub    $0x1,%eax
   29090:	89 47 fc             	mov    %eax,-0x4(%rdi)
   29093:	85 c0                	test   %eax,%eax
   29095:	0f 8e 19 47 00 00    	jle    2d7b4 <JS_CallInternal+0x8364>
   2909b:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   290a1:	49 83 c4 03          	add    $0x3,%r12
   290a5:	49 89 c2             	mov    %rax,%r10
   290a8:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   290ac:	ff e0                	jmp    *%rax
   290ae:	f3 0f 1e fa          	endbr64
   290b2:	48 8b 43 e0          	mov    -0x20(%rbx),%rax
   290b6:	4c 8d 4b e0          	lea    -0x20(%rbx),%r9
   290ba:	4c 8d 43 f0          	lea    -0x10(%rbx),%r8
   290be:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   290c2:	49 8b 58 08          	mov    0x8(%r8),%rbx
   290c6:	4c 89 8d b0 fd ff ff 	mov    %r9,-0x250(%rbp)
   290cd:	48 89 85 e8 fd ff ff 	mov    %rax,-0x218(%rbp)
   290d4:	49 8b 41 08          	mov    0x8(%r9),%rax
   290d8:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   290df:	48 89 85 d0 fd ff ff 	mov    %rax,-0x230(%rbp)
   290e6:	4c 89 85 c0 fd ff ff 	mov    %r8,-0x240(%rbp)
   290ed:	83 fb f9             	cmp    $0xfffffff9,%ebx
   290f0:	0f 85 40 3f 00 00    	jne    2d036 <JS_CallInternal+0x7be6>
   290f6:	83 f8 f9             	cmp    $0xfffffff9,%eax
   290f9:	0f 85 37 3f 00 00    	jne    2d036 <JS_CallInternal+0x7be6>
   290ff:	49 8b 75 48          	mov    0x48(%r13),%rsi
   29103:	48 8d 8d 50 ff ff ff 	lea    -0xb0(%rbp),%rcx
   2910a:	ba 12 00 00 00       	mov    $0x12,%edx
   2910f:	4c 89 ef             	mov    %r13,%rdi
   29112:	48 c7 85 50 ff ff ff 	movq   $0x0,-0xb0(%rbp)
   29119:	00 00 00 00 
   2911d:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   29121:	48 c7 85 58 ff ff ff 	movq   $0x0,-0xa8(%rbp)
   29128:	00 00 00 00 
   2912c:	e8 8f 18 02 00       	call   4a9c0 <JS_NewObjectFromShape>
   29131:	4c 8b 85 c0 fd ff ff 	mov    -0x240(%rbp),%r8
   29138:	4c 8b 8d b0 fd ff ff 	mov    -0x250(%rbp),%r9
   2913f:	83 fa 06             	cmp    $0x6,%edx
   29142:	0f 84 0d 3f 00 00    	je     2d055 <JS_CallInternal+0x7c05>
   29148:	f3 0f 7e 85 e8 fd ff 	movq   -0x218(%rbp),%xmm0
   2914f:	ff 
   29150:	0f 16 85 f0 fd ff ff 	movhps -0x210(%rbp),%xmm0
   29157:	0f 11 40 28          	movups %xmm0,0x28(%rax)
   2915b:	49 89 01             	mov    %rax,(%r9)
   2915e:	49 89 51 08          	mov    %rdx,0x8(%r9)
   29162:	41 83 78 f8 06       	cmpl   $0x6,-0x8(%r8)
   29167:	0f 84 59 53 00 00    	je     2e4c6 <JS_CallInternal+0x9076>
   2916d:	41 0f b6 04 24       	movzbl (%r12),%eax
   29172:	4c 89 c3             	mov    %r8,%rbx
   29175:	49 83 c4 01          	add    $0x1,%r12
   29179:	49 89 c2             	mov    %rax,%r10
   2917c:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29180:	ff e0                	jmp    *%rax
   29182:	f3 0f 1e fa          	endbr64
   29186:	41 0f b7 04 24       	movzwl (%r12),%eax
   2918b:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2918f:	4c 89 ef             	mov    %r13,%rdi
   29192:	48 8d b5 9c fe ff ff 	lea    -0x164(%rbp),%rsi
   29199:	48 8b 8d 80 fe ff ff 	mov    -0x180(%rbp),%rcx
   291a0:	66 89 85 e8 fd ff ff 	mov    %ax,-0x218(%rbp)
   291a7:	49 8d 44 24 02       	lea    0x2(%r12),%rax
   291ac:	48 89 41 30          	mov    %rax,0x30(%rcx)
   291b0:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   291b4:	48 89 85 a0 fd ff ff 	mov    %rax,-0x260(%rbp)
   291bb:	48 8d 43 f0          	lea    -0x10(%rbx),%rax
   291bf:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   291c6:	e8 35 48 06 00       	call   8da00 <build_arg_list>
   291cb:	49 89 c2             	mov    %rax,%r10
   291ce:	48 85 c0             	test   %rax,%rax
   291d1:	0f 84 ac 45 00 00    	je     2d783 <JS_CallInternal+0x8333>
   291d7:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   291db:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   291df:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   291e5:	4c 89 95 d0 fd ff ff 	mov    %r10,-0x230(%rbp)
   291ec:	49 8b 95 70 01 00 00 	mov    0x170(%r13),%rdx
   291f3:	49 8b 8d 78 01 00 00 	mov    0x178(%r13),%rcx
   291fa:	48 89 c6             	mov    %rax,%rsi
   291fd:	48 89 bd c0 fd ff ff 	mov    %rdi,-0x240(%rbp)
   29204:	48 89 85 b0 fd ff ff 	mov    %rax,-0x250(%rbp)
   2920b:	e8 60 2f ff ff       	call   1c170 <js_strict_eq2.isra.0>
   29210:	44 8b 9d 9c fe ff ff 	mov    -0x164(%rbp),%r11d
   29217:	4c 8b 95 d0 fd ff ff 	mov    -0x230(%rbp),%r10
   2921e:	85 c0                	test   %eax,%eax
   29220:	0f 84 38 3a 00 00    	je     2cc5e <JS_CallInternal+0x780e>
   29226:	0f b7 85 e8 fd ff ff 	movzwl -0x218(%rbp),%eax
   2922d:	83 e8 02             	sub    $0x2,%eax
   29230:	45 85 db             	test   %r11d,%r11d
   29233:	0f 84 18 3a 00 00    	je     2cc51 <JS_CallInternal+0x7801>
   29239:	49 8b 0a             	mov    (%r10),%rcx
   2923c:	4d 8b 42 08          	mov    0x8(%r10),%r8
   29240:	48 83 ec 08          	sub    $0x8,%rsp
   29244:	44 89 9d b0 fd ff ff 	mov    %r11d,-0x250(%rbp)
   2924b:	31 f6                	xor    %esi,%esi
   2924d:	4c 89 ef             	mov    %r13,%rdi
   29250:	4c 89 95 d0 fd ff ff 	mov    %r10,-0x230(%rbp)
   29257:	41 b9 02 00 00 00    	mov    $0x2,%r9d
   2925d:	ba 03 00 00 00       	mov    $0x3,%edx
   29262:	50                   	push   %rax
   29263:	e8 b8 bd 01 00       	call   45020 <JS_EvalObject>
   29268:	48 89 85 c0 fd ff ff 	mov    %rax,-0x240(%rbp)
   2926f:	48 89 95 e8 fd ff ff 	mov    %rdx,-0x218(%rbp)
   29276:	41 5a                	pop    %r10
   29278:	4c 8b 95 d0 fd ff ff 	mov    -0x230(%rbp),%r10
   2927f:	41 5b                	pop    %r11
   29281:	44 8b 9d b0 fd ff ff 	mov    -0x250(%rbp),%r11d
   29288:	45 85 db             	test   %r11d,%r11d
   2928b:	0f 84 88 2b 00 00    	je     2be19 <JS_CallInternal+0x69c9>
   29291:	45 89 d8             	mov    %r11d,%r8d
   29294:	48 89 9d b0 fd ff ff 	mov    %rbx,-0x250(%rbp)
   2929b:	4c 89 d3             	mov    %r10,%rbx
   2929e:	49 c1 e0 04          	shl    $0x4,%r8
   292a2:	4c 89 95 a8 fd ff ff 	mov    %r10,-0x258(%rbp)
   292a9:	4d 01 d0             	add    %r10,%r8
   292ac:	4d 89 ea             	mov    %r13,%r10
   292af:	4d 89 e5             	mov    %r12,%r13
   292b2:	4d 89 c4             	mov    %r8,%r12
   292b5:	eb 16                	jmp    292cd <JS_CallInternal+0x3e7d>
   292b7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   292be:	00 00 
   292c0:	48 83 c3 10          	add    $0x10,%rbx
   292c4:	4c 39 e3             	cmp    %r12,%rbx
   292c7:	0f 84 38 2b 00 00    	je     2be05 <JS_CallInternal+0x69b5>
   292cd:	48 8b 43 08          	mov    0x8(%rbx),%rax
   292d1:	83 f8 f6             	cmp    $0xfffffff6,%eax
   292d4:	76 ea                	jbe    292c0 <JS_CallInternal+0x3e70>
   292d6:	48 8b 33             	mov    (%rbx),%rsi
   292d9:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   292dc:	8d 51 ff             	lea    -0x1(%rcx),%edx
   292df:	89 56 fc             	mov    %edx,-0x4(%rsi)
   292e2:	85 d2                	test   %edx,%edx
   292e4:	7f da                	jg     292c0 <JS_CallInternal+0x3e70>
   292e6:	49 8b 7a 10          	mov    0x10(%r10),%rdi
   292ea:	48 89 c2             	mov    %rax,%rdx
   292ed:	4c 89 95 d0 fd ff ff 	mov    %r10,-0x230(%rbp)
   292f4:	e8 a7 56 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   292f9:	4c 8b 95 d0 fd ff ff 	mov    -0x230(%rbp),%r10
   29300:	eb be                	jmp    292c0 <JS_CallInternal+0x3e70>
   29302:	f3 0f 1e fa          	endbr64
   29306:	41 0f b7 0c 24       	movzwl (%r12),%ecx
   2930b:	49 89 da             	mov    %rbx,%r10
   2930e:	41 0f b7 7c 24 02    	movzwl 0x2(%r12),%edi
   29314:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   2931a:	49 8b 95 70 01 00 00 	mov    0x170(%r13),%rdx
   29321:	48 89 c8             	mov    %rcx,%rax
   29324:	89 8d f0 fd ff ff    	mov    %ecx,-0x210(%rbp)
   2932a:	49 8d 4c 24 04       	lea    0x4(%r12),%rcx
   2932f:	48 c1 e0 04          	shl    $0x4,%rax
   29333:	66 89 bd c0 fd ff ff 	mov    %di,-0x240(%rbp)
   2933a:	49 29 c2             	sub    %rax,%r10
   2933d:	48 89 85 d0 fd ff ff 	mov    %rax,-0x230(%rbp)
   29344:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2934b:	49 8b 7a f0          	mov    -0x10(%r10),%rdi
   2934f:	48 89 8d b0 fd ff ff 	mov    %rcx,-0x250(%rbp)
   29356:	48 89 48 30          	mov    %rcx,0x30(%rax)
   2935a:	49 8b 42 f8          	mov    -0x8(%r10),%rax
   2935e:	49 8b 8d 78 01 00 00 	mov    0x178(%r13),%rcx
   29365:	4c 89 95 e8 fd ff ff 	mov    %r10,-0x218(%rbp)
   2936c:	48 89 c6             	mov    %rax,%rsi
   2936f:	48 89 bd a8 fd ff ff 	mov    %rdi,-0x258(%rbp)
   29376:	48 89 85 a0 fd ff ff 	mov    %rax,-0x260(%rbp)
   2937d:	e8 ee 2d ff ff       	call   1c170 <js_strict_eq2.isra.0>
   29382:	4c 8b 95 e8 fd ff ff 	mov    -0x218(%rbp),%r10
   29389:	85 c0                	test   %eax,%eax
   2938b:	0f 84 59 37 00 00    	je     2caea <JS_CallInternal+0x769a>
   29391:	0f b7 85 c0 fd ff ff 	movzwl -0x240(%rbp),%eax
   29398:	8b b5 f0 fd ff ff    	mov    -0x210(%rbp),%esi
   2939e:	83 e8 02             	sub    $0x2,%eax
   293a1:	85 f6                	test   %esi,%esi
   293a3:	0f 84 a6 37 00 00    	je     2cb4f <JS_CallInternal+0x76ff>
   293a9:	49 8b 0a             	mov    (%r10),%rcx
   293ac:	4d 8b 42 08          	mov    0x8(%r10),%r8
   293b0:	48 83 ec 08          	sub    $0x8,%rsp
   293b4:	4c 89 95 e8 fd ff ff 	mov    %r10,-0x218(%rbp)
   293bb:	31 f6                	xor    %esi,%esi
   293bd:	4c 89 ef             	mov    %r13,%rdi
   293c0:	50                   	push   %rax
   293c1:	41 b9 02 00 00 00    	mov    $0x2,%r9d
   293c7:	ba 03 00 00 00       	mov    $0x3,%edx
   293cc:	e8 4f bc 01 00       	call   45020 <JS_EvalObject>
   293d1:	4c 8b 95 e8 fd ff ff 	mov    -0x218(%rbp),%r10
   293d8:	48 89 c6             	mov    %rax,%rsi
   293db:	58                   	pop    %rax
   293dc:	59                   	pop    %rcx
   293dd:	83 fa 06             	cmp    $0x6,%edx
   293e0:	0f 84 bd 4d 00 00    	je     2e1a3 <JS_CallInternal+0x8d53>
   293e6:	48 8b 8d d0 fd ff ff 	mov    -0x230(%rbp),%rcx
   293ed:	49 8d 42 f0          	lea    -0x10(%r10),%rax
   293f1:	4c 89 a5 e8 fd ff ff 	mov    %r12,-0x218(%rbp)
   293f8:	4c 89 bd b0 fd ff ff 	mov    %r15,-0x250(%rbp)
   293ff:	49 89 df             	mov    %rbx,%r15
   29402:	48 89 c3             	mov    %rax,%rbx
   29405:	48 89 b5 d0 fd ff ff 	mov    %rsi,-0x230(%rbp)
   2940c:	4e 8d 24 11          	lea    (%rcx,%r10,1),%r12
   29410:	48 89 95 c0 fd ff ff 	mov    %rdx,-0x240(%rbp)
   29417:	eb 14                	jmp    2942d <JS_CallInternal+0x3fdd>
   29419:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   29420:	48 83 c3 10          	add    $0x10,%rbx
   29424:	4c 39 e3             	cmp    %r12,%rbx
   29427:	0f 84 c6 2a 00 00    	je     2bef3 <JS_CallInternal+0x6aa3>
   2942d:	48 8b 43 08          	mov    0x8(%rbx),%rax
   29431:	83 f8 f6             	cmp    $0xfffffff6,%eax
   29434:	76 ea                	jbe    29420 <JS_CallInternal+0x3fd0>
   29436:	48 8b 33             	mov    (%rbx),%rsi
   29439:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   2943c:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2943f:	89 56 fc             	mov    %edx,-0x4(%rsi)
   29442:	85 d2                	test   %edx,%edx
   29444:	7f da                	jg     29420 <JS_CallInternal+0x3fd0>
   29446:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2944a:	48 89 c2             	mov    %rax,%rdx
   2944d:	e8 4e 55 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   29452:	eb cc                	jmp    29420 <JS_CallInternal+0x3fd0>
   29454:	f3 0f 1e fa          	endbr64
   29458:	41 0f b6 44 24 04    	movzbl 0x4(%r12),%eax
   2945e:	41 8b 34 24          	mov    (%r12),%esi
   29462:	49 83 c4 05          	add    $0x5,%r12
   29466:	3c 04                	cmp    $0x4,%al
   29468:	0f 87 17 41 00 00    	ja     2d585 <JS_CallInternal+0x8135>
   2946e:	48 8d 15 63 9d 0b 00 	lea    0xb9d63(%rip),%rdx        # e31d8 <qjsc_repl_size+0x4cc>
   29475:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
   29479:	48 01 d0             	add    %rdx,%rax
   2947c:	3e ff e0             	notrack jmp *%rax
   2947f:	48 8d 35 0a 39 0b 00 	lea    0xb390a(%rip),%rsi        # dcd90 <_IO_stdin_used+0x3d90>
   29486:	4c 89 ef             	mov    %r13,%rdi
   29489:	31 c0                	xor    %eax,%eax
   2948b:	e8 10 d0 00 00       	call   364a0 <JS_ThrowReferenceError>
   29490:	e9 eb c7 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   29495:	48 8d 15 21 00 0b 00 	lea    0xb0021(%rip),%rdx        # d94bd <_IO_stdin_used+0x4bd>
   2949c:	85 f6                	test   %esi,%esi
   2949e:	0f 85 9d 5e 00 00    	jne    2f341 <JS_CallInternal+0x9ef1>
   294a4:	48 8d 35 6e 00 0b 00 	lea    0xb006e(%rip),%rsi        # d9519 <_IO_stdin_used+0x519>
   294ab:	4c 89 ef             	mov    %r13,%rdi
   294ae:	31 c0                	xor    %eax,%eax
   294b0:	e8 eb cf 00 00       	call   364a0 <JS_ThrowReferenceError>
   294b5:	e9 c6 c7 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   294ba:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   294be:	89 f2                	mov    %esi,%edx
   294c0:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   294c4:	e8 a7 f8 fe ff       	call   18d70 <JS_AtomGetStrRT.constprop.0>
   294c9:	48 8d 35 33 00 0b 00 	lea    0xb0033(%rip),%rsi        # d9503 <_IO_stdin_used+0x503>
   294d0:	4c 89 ef             	mov    %r13,%rdi
   294d3:	48 89 c2             	mov    %rax,%rdx
   294d6:	31 c0                	xor    %eax,%eax
   294d8:	e8 93 ac 00 00       	call   34170 <JS_ThrowSyntaxError>
   294dd:	e9 9e c7 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   294e2:	4c 89 ef             	mov    %r13,%rdi
   294e5:	e8 26 c4 00 00       	call   35910 <JS_ThrowTypeErrorReadOnly.part.0>
   294ea:	e9 91 c7 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   294ef:	48 8d 35 c2 38 0b 00 	lea    0xb38c2(%rip),%rsi        # dcdb8 <_IO_stdin_used+0x3db8>
   294f6:	4c 89 ef             	mov    %r13,%rdi
   294f9:	31 c0                	xor    %eax,%eax
   294fb:	e8 c0 b0 00 00       	call   345c0 <JS_ThrowTypeError>
   29500:	e9 7b c7 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   29505:	f3 0f 1e fa          	endbr64
   29509:	44 8b 5b f8          	mov    -0x8(%rbx),%r11d
   2950d:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   29511:	45 85 db             	test   %r11d,%r11d
   29514:	0f 85 98 30 00 00    	jne    2c5b2 <JS_CallInternal+0x7162>
   2951a:	3d ff ff ff 7f       	cmp    $0x7fffffff,%eax
   2951f:	0f 84 8d 30 00 00    	je     2c5b2 <JS_CallInternal+0x7162>
   29525:	83 c0 01             	add    $0x1,%eax
   29528:	48 c7 43 08 00 00 00 	movq   $0x0,0x8(%rbx)
   2952f:	00 
   29530:	48 89 03             	mov    %rax,(%rbx)
   29533:	41 0f b6 04 24       	movzbl (%r12),%eax
   29538:	48 83 c3 10          	add    $0x10,%rbx
   2953c:	49 83 c4 01          	add    $0x1,%r12
   29540:	49 89 c2             	mov    %rax,%r10
   29543:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29547:	ff e0                	jmp    *%rax
   29549:	f3 0f 1e fa          	endbr64
   2954d:	8b 53 f8             	mov    -0x8(%rbx),%edx
   29550:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   29554:	85 d2                	test   %edx,%edx
   29556:	0f 85 ec 30 00 00    	jne    2c648 <JS_CallInternal+0x71f8>
   2955c:	3d 00 00 00 80       	cmp    $0x80000000,%eax
   29561:	0f 84 e1 30 00 00    	je     2c648 <JS_CallInternal+0x71f8>
   29567:	83 e8 01             	sub    $0x1,%eax
   2956a:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   29571:	00 
   29572:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29576:	41 0f b6 04 24       	movzbl (%r12),%eax
   2957b:	49 83 c4 01          	add    $0x1,%r12
   2957f:	49 89 c2             	mov    %rax,%r10
   29582:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29586:	ff e0                	jmp    *%rax
   29588:	f3 0f 1e fa          	endbr64
   2958c:	83 bd 38 fe ff ff 03 	cmpl   $0x3,-0x1c8(%rbp)
   29593:	0f 84 14 61 00 00    	je     2f6ad <JS_CallInternal+0xa25d>
   29599:	41 0f b6 04 24       	movzbl (%r12),%eax
   2959e:	49 83 c4 01          	add    $0x1,%r12
   295a2:	49 89 c2             	mov    %rax,%r10
   295a5:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   295a9:	ff e0                	jmp    *%rax
   295ab:	f3 0f 1e fa          	endbr64
   295af:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   295b3:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   295b7:	45 31 c9             	xor    %r9d,%r9d
   295ba:	4c 89 ef             	mov    %r13,%rdi
   295bd:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   295c4:	48 8b 4b d0          	mov    -0x30(%rbx),%rcx
   295c8:	48 c7 85 80 fd ff ff 	movq   $0x0,-0x280(%rbp)
   295cf:	00 00 00 00 
   295d3:	48 c7 85 88 fd ff ff 	movq   $0x3,-0x278(%rbp)
   295da:	03 00 00 00 
   295de:	4c 8b 43 d8          	mov    -0x28(%rbx),%r8
   295e2:	4c 89 60 30          	mov    %r12,0x30(%rax)
   295e6:	48 c7 43 f0 00 00 00 	movq   $0x0,-0x10(%rbx)
   295ed:	00 
   295ee:	48 c7 43 f8 03 00 00 	movq   $0x3,-0x8(%rbx)
   295f5:	00 
   295f6:	6a 02                	push   $0x2
   295f8:	6a 00                	push   $0x0
   295fa:	ff b5 88 fd ff ff    	push   -0x278(%rbp)
   29600:	ff b5 80 fd ff ff    	push   -0x280(%rbp)
   29606:	e8 45 be ff ff       	call   25450 <JS_CallInternal>
   2960b:	48 83 c4 20          	add    $0x20,%rsp
   2960f:	83 fa 06             	cmp    $0x6,%edx
   29612:	0f 84 68 c6 ff ff    	je     25c80 <JS_CallInternal+0x830>
   29618:	48 89 03             	mov    %rax,(%rbx)
   2961b:	49 83 c4 01          	add    $0x1,%r12
   2961f:	48 83 c3 10          	add    $0x10,%rbx
   29623:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   29627:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2962d:	49 89 c2             	mov    %rax,%r10
   29630:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29634:	ff e0                	jmp    *%rax
   29636:	f3 0f 1e fa          	endbr64
   2963a:	48 8b 85 58 fe ff ff 	mov    -0x1a8(%rbp),%rax
   29641:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   29645:	48 8b 50 30          	mov    0x30(%rax),%rdx
   29649:	48 8b 40 38          	mov    0x38(%rax),%rax
   2964d:	83 f8 f6             	cmp    $0xfffffff6,%eax
   29650:	76 04                	jbe    29656 <JS_CallInternal+0x4206>
   29652:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   29656:	48 89 13             	mov    %rdx,(%rbx)
   29659:	49 83 c4 01          	add    $0x1,%r12
   2965d:	48 89 43 08          	mov    %rax,0x8(%rbx)
   29661:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29667:	48 89 cb             	mov    %rcx,%rbx
   2966a:	49 89 c2             	mov    %rax,%r10
   2966d:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29671:	ff e0                	jmp    *%rax
   29673:	f3 0f 1e fa          	endbr64
   29677:	48 8b 85 58 fe ff ff 	mov    -0x1a8(%rbp),%rax
   2967e:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   29682:	48 8b 50 20          	mov    0x20(%rax),%rdx
   29686:	48 8b 40 28          	mov    0x28(%rax),%rax
   2968a:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2968d:	76 04                	jbe    29693 <JS_CallInternal+0x4243>
   2968f:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   29693:	48 89 13             	mov    %rdx,(%rbx)
   29696:	49 83 c4 01          	add    $0x1,%r12
   2969a:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2969e:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   296a4:	48 89 cb             	mov    %rcx,%rbx
   296a7:	49 89 c2             	mov    %rax,%r10
   296aa:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   296ae:	ff e0                	jmp    *%rax
   296b0:	f3 0f 1e fa          	endbr64
   296b4:	48 8b 85 58 fe ff ff 	mov    -0x1a8(%rbp),%rax
   296bb:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   296bf:	48 8b 50 10          	mov    0x10(%rax),%rdx
   296c3:	48 8b 40 18          	mov    0x18(%rax),%rax
   296c7:	83 f8 f6             	cmp    $0xfffffff6,%eax
   296ca:	76 04                	jbe    296d0 <JS_CallInternal+0x4280>
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
   296f1:	48 8b 8d 58 fe ff ff 	mov    -0x1a8(%rbp),%rcx
   296f8:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   296fc:	48 8b 01             	mov    (%rcx),%rax
   296ff:	83 fa ff             	cmp    $0xffffffff,%edx
   29702:	0f 84 74 32 00 00    	je     2c97c <JS_CallInternal+0x752c>
   29708:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   2970c:	83 fa f6             	cmp    $0xfffffff6,%edx
   2970f:	76 04                	jbe    29715 <JS_CallInternal+0x42c5>
   29711:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   29715:	48 89 03             	mov    %rax,(%rbx)
   29718:	4c 89 e0             	mov    %r12,%rax
   2971b:	4d 8d 64 24 01       	lea    0x1(%r12),%r12
   29720:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   29724:	0f b6 00             	movzbl (%rax),%eax
   29727:	48 89 cb             	mov    %rcx,%rbx
   2972a:	49 89 c2             	mov    %rax,%r10
   2972d:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   29731:	f3 0f 1e fa          	endbr64
   29735:	48 8b 85 58 fe ff ff 	mov    -0x1a8(%rbp),%rax
   2973c:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   29740:	48 8b 10             	mov    (%rax),%rdx
   29743:	48 8b 40 08          	mov    0x8(%rax),%rax
   29747:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2974a:	76 04                	jbe    29750 <JS_CallInternal+0x4300>
   2974c:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   29750:	48 89 13             	mov    %rdx,(%rbx)
   29753:	49 83 c4 01          	add    $0x1,%r12
   29757:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2975b:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29761:	48 89 cb             	mov    %rcx,%rbx
   29764:	49 89 c2             	mov    %rax,%r10
   29767:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2976b:	ff e0                	jmp    *%rax
   2976d:	f3 0f 1e fa          	endbr64
   29771:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   29775:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   29779:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2977c:	76 04                	jbe    29782 <JS_CallInternal+0x4332>
   2977e:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   29782:	41 0f b6 04 24       	movzbl (%r12),%eax
   29787:	48 c1 e0 04          	shl    $0x4,%rax
   2978b:	48 03 85 58 fe ff ff 	add    -0x1a8(%rbp),%rax
   29792:	48 8b 50 08          	mov    0x8(%rax),%rdx
   29796:	48 8b 38             	mov    (%rax),%rdi
   29799:	48 89 48 08          	mov    %rcx,0x8(%rax)
   2979d:	48 89 30             	mov    %rsi,(%rax)
   297a0:	83 fa f6             	cmp    $0xfffffff6,%edx
   297a3:	76 11                	jbe    297b6 <JS_CallInternal+0x4366>
   297a5:	8b 47 fc             	mov    -0x4(%rdi),%eax
   297a8:	83 e8 01             	sub    $0x1,%eax
   297ab:	89 47 fc             	mov    %eax,-0x4(%rdi)
   297ae:	85 c0                	test   %eax,%eax
   297b0:	0f 8e d9 3f 00 00    	jle    2d78f <JS_CallInternal+0x833f>
   297b6:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
   297bc:	49 83 c4 02          	add    $0x2,%r12
   297c0:	49 89 c2             	mov    %rax,%r10
   297c3:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   297c7:	ff e0                	jmp    *%rax
   297c9:	f3 0f 1e fa          	endbr64
   297cd:	41 0f b6 04 24       	movzbl (%r12),%eax
   297d2:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   297d7:	48 83 eb 10          	sub    $0x10,%rbx
   297db:	48 c1 e0 04          	shl    $0x4,%rax
   297df:	48 03 85 58 fe ff ff 	add    -0x1a8(%rbp),%rax
   297e6:	48 8b 50 08          	mov    0x8(%rax),%rdx
   297ea:	48 8b 08             	mov    (%rax),%rcx
   297ed:	0f 11 00             	movups %xmm0,(%rax)
   297f0:	83 fa f6             	cmp    $0xfffffff6,%edx
   297f3:	76 11                	jbe    29806 <JS_CallInternal+0x43b6>
   297f5:	8b 41 fc             	mov    -0x4(%rcx),%eax
   297f8:	83 e8 01             	sub    $0x1,%eax
   297fb:	89 41 fc             	mov    %eax,-0x4(%rcx)
   297fe:	85 c0                	test   %eax,%eax
   29800:	0f 8e 0a 42 00 00    	jle    2da10 <JS_CallInternal+0x85c0>
   29806:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
   2980c:	49 83 c4 02          	add    $0x2,%r12
   29810:	49 89 c2             	mov    %rax,%r10
   29813:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29817:	ff e0                	jmp    *%rax
   29819:	f3 0f 1e fa          	endbr64
   2981d:	41 0f b6 04 24       	movzbl (%r12),%eax
   29822:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   29826:	48 c1 e0 04          	shl    $0x4,%rax
   2982a:	48 03 85 58 fe ff ff 	add    -0x1a8(%rbp),%rax
   29831:	48 8b 10             	mov    (%rax),%rdx
   29834:	48 8b 40 08          	mov    0x8(%rax),%rax
   29838:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2983b:	76 04                	jbe    29841 <JS_CallInternal+0x43f1>
   2983d:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   29841:	48 89 13             	mov    %rdx,(%rbx)
   29844:	49 83 c4 02          	add    $0x2,%r12
   29848:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2984c:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29852:	48 89 cb             	mov    %rcx,%rbx
   29855:	49 89 c2             	mov    %rax,%r10
   29858:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2985c:	ff e0                	jmp    *%rax
   2985e:	f3 0f 1e fa          	endbr64
   29862:	48 8b bd 58 fe ff ff 	mov    -0x1a8(%rbp),%rdi
   29869:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2986e:	48 83 eb 10          	sub    $0x10,%rbx
   29872:	48 8b 47 38          	mov    0x38(%rdi),%rax
   29876:	48 8b 4f 30          	mov    0x30(%rdi),%rcx
   2987a:	0f 11 47 30          	movups %xmm0,0x30(%rdi)
   2987e:	83 f8 f6             	cmp    $0xfffffff6,%eax
   29881:	76 11                	jbe    29894 <JS_CallInternal+0x4444>
   29883:	8b 79 fc             	mov    -0x4(%rcx),%edi
   29886:	8d 57 ff             	lea    -0x1(%rdi),%edx
   29889:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2988c:	85 d2                	test   %edx,%edx
   2988e:	0f 8e 68 41 00 00    	jle    2d9fc <JS_CallInternal+0x85ac>
   29894:	41 0f b6 04 24       	movzbl (%r12),%eax
   29899:	49 83 c4 01          	add    $0x1,%r12
   2989d:	49 89 c2             	mov    %rax,%r10
   298a0:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   298a4:	ff e0                	jmp    *%rax
   298a6:	f3 0f 1e fa          	endbr64
   298aa:	48 8b bd 58 fe ff ff 	mov    -0x1a8(%rbp),%rdi
   298b1:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   298b6:	48 83 eb 10          	sub    $0x10,%rbx
   298ba:	48 8b 47 28          	mov    0x28(%rdi),%rax
   298be:	48 8b 4f 20          	mov    0x20(%rdi),%rcx
   298c2:	0f 11 47 20          	movups %xmm0,0x20(%rdi)
   298c6:	83 f8 f6             	cmp    $0xfffffff6,%eax
   298c9:	76 11                	jbe    298dc <JS_CallInternal+0x448c>
   298cb:	8b 79 fc             	mov    -0x4(%rcx),%edi
   298ce:	8d 57 ff             	lea    -0x1(%rdi),%edx
   298d1:	89 51 fc             	mov    %edx,-0x4(%rcx)
   298d4:	85 d2                	test   %edx,%edx
   298d6:	0f 8e 0c 41 00 00    	jle    2d9e8 <JS_CallInternal+0x8598>
   298dc:	41 0f b6 04 24       	movzbl (%r12),%eax
   298e1:	49 83 c4 01          	add    $0x1,%r12
   298e5:	49 89 c2             	mov    %rax,%r10
   298e8:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   298ec:	ff e0                	jmp    *%rax
   298ee:	f3 0f 1e fa          	endbr64
   298f2:	48 8b bd 58 fe ff ff 	mov    -0x1a8(%rbp),%rdi
   298f9:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   298fe:	48 83 eb 10          	sub    $0x10,%rbx
   29902:	48 8b 47 18          	mov    0x18(%rdi),%rax
   29906:	48 8b 4f 10          	mov    0x10(%rdi),%rcx
   2990a:	0f 11 47 10          	movups %xmm0,0x10(%rdi)
   2990e:	83 f8 f6             	cmp    $0xfffffff6,%eax
   29911:	76 11                	jbe    29924 <JS_CallInternal+0x44d4>
   29913:	8b 79 fc             	mov    -0x4(%rcx),%edi
   29916:	8d 57 ff             	lea    -0x1(%rdi),%edx
   29919:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2991c:	85 d2                	test   %edx,%edx
   2991e:	0f 8e b0 40 00 00    	jle    2d9d4 <JS_CallInternal+0x8584>
   29924:	41 0f b6 04 24       	movzbl (%r12),%eax
   29929:	49 83 c4 01          	add    $0x1,%r12
   2992d:	49 89 c2             	mov    %rax,%r10
   29930:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29934:	ff e0                	jmp    *%rax
   29936:	f3 0f 1e fa          	endbr64
   2993a:	48 8b bd 58 fe ff ff 	mov    -0x1a8(%rbp),%rdi
   29941:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   29946:	48 83 eb 10          	sub    $0x10,%rbx
   2994a:	48 8b 47 08          	mov    0x8(%rdi),%rax
   2994e:	48 8b 0f             	mov    (%rdi),%rcx
   29951:	0f 11 07             	movups %xmm0,(%rdi)
   29954:	83 f8 f6             	cmp    $0xfffffff6,%eax
   29957:	76 11                	jbe    2996a <JS_CallInternal+0x451a>
   29959:	8b 79 fc             	mov    -0x4(%rcx),%edi
   2995c:	8d 57 ff             	lea    -0x1(%rdi),%edx
   2995f:	89 51 fc             	mov    %edx,-0x4(%rcx)
   29962:	85 d2                	test   %edx,%edx
   29964:	0f 8e 56 40 00 00    	jle    2d9c0 <JS_CallInternal+0x8570>
   2996a:	41 0f b6 04 24       	movzbl (%r12),%eax
   2996f:	49 83 c4 01          	add    $0x1,%r12
   29973:	49 89 c2             	mov    %rax,%r10
   29976:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2997a:	ff e0                	jmp    *%rax
   2997c:	f3 0f 1e fa          	endbr64
   29980:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   29984:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   29988:	83 fa f6             	cmp    $0xfffffff6,%edx
   2998b:	76 04                	jbe    29991 <JS_CallInternal+0x4541>
   2998d:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   29991:	48 8b bd 58 fe ff ff 	mov    -0x1a8(%rbp),%rdi
   29998:	48 8b 47 18          	mov    0x18(%rdi),%rax
   2999c:	48 8b 77 10          	mov    0x10(%rdi),%rsi
   299a0:	48 89 57 18          	mov    %rdx,0x18(%rdi)
   299a4:	48 89 4f 10          	mov    %rcx,0x10(%rdi)
   299a8:	83 f8 f6             	cmp    $0xfffffff6,%eax
   299ab:	76 11                	jbe    299be <JS_CallInternal+0x456e>
   299ad:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   299b0:	8d 51 ff             	lea    -0x1(%rcx),%edx
   299b3:	89 56 fc             	mov    %edx,-0x4(%rsi)
   299b6:	85 d2                	test   %edx,%edx
   299b8:	0f 8e f1 3f 00 00    	jle    2d9af <JS_CallInternal+0x855f>
   299be:	41 0f b6 04 24       	movzbl (%r12),%eax
   299c3:	49 83 c4 01          	add    $0x1,%r12
   299c7:	49 89 c2             	mov    %rax,%r10
   299ca:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   299ce:	ff e0                	jmp    *%rax
   299d0:	f3 0f 1e fa          	endbr64
   299d4:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   299d8:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   299dc:	83 fa f6             	cmp    $0xfffffff6,%edx
   299df:	76 04                	jbe    299e5 <JS_CallInternal+0x4595>
   299e1:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   299e5:	48 8b bd 58 fe ff ff 	mov    -0x1a8(%rbp),%rdi
   299ec:	48 8b 47 08          	mov    0x8(%rdi),%rax
   299f0:	48 8b 37             	mov    (%rdi),%rsi
   299f3:	48 89 57 08          	mov    %rdx,0x8(%rdi)
   299f7:	48 89 0f             	mov    %rcx,(%rdi)
   299fa:	83 f8 f6             	cmp    $0xfffffff6,%eax
   299fd:	76 11                	jbe    29a10 <JS_CallInternal+0x45c0>
   299ff:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   29a02:	8d 51 ff             	lea    -0x1(%rcx),%edx
   29a05:	89 56 fc             	mov    %edx,-0x4(%rsi)
   29a08:	85 d2                	test   %edx,%edx
   29a0a:	0f 8e 8e 3f 00 00    	jle    2d99e <JS_CallInternal+0x854e>
   29a10:	41 0f b6 04 24       	movzbl (%r12),%eax
   29a15:	49 83 c4 01          	add    $0x1,%r12
   29a19:	49 89 c2             	mov    %rax,%r10
   29a1c:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29a20:	ff e0                	jmp    *%rax
   29a22:	f3 0f 1e fa          	endbr64
   29a26:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   29a2a:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   29a2e:	83 fa f6             	cmp    $0xfffffff6,%edx
   29a31:	76 04                	jbe    29a37 <JS_CallInternal+0x45e7>
   29a33:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   29a37:	48 8b bd 58 fe ff ff 	mov    -0x1a8(%rbp),%rdi
   29a3e:	48 8b 47 28          	mov    0x28(%rdi),%rax
   29a42:	48 8b 77 20          	mov    0x20(%rdi),%rsi
   29a46:	48 89 57 28          	mov    %rdx,0x28(%rdi)
   29a4a:	48 89 4f 20          	mov    %rcx,0x20(%rdi)
   29a4e:	83 f8 f6             	cmp    $0xfffffff6,%eax
   29a51:	76 11                	jbe    29a64 <JS_CallInternal+0x4614>
   29a53:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   29a56:	8d 51 ff             	lea    -0x1(%rcx),%edx
   29a59:	89 56 fc             	mov    %edx,-0x4(%rsi)
   29a5c:	85 d2                	test   %edx,%edx
   29a5e:	0f 8e f9 3e 00 00    	jle    2d95d <JS_CallInternal+0x850d>
   29a64:	41 0f b6 04 24       	movzbl (%r12),%eax
   29a69:	49 83 c4 01          	add    $0x1,%r12
   29a6d:	49 89 c2             	mov    %rax,%r10
   29a70:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29a74:	ff e0                	jmp    *%rax
   29a76:	f3 0f 1e fa          	endbr64
   29a7a:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   29a7e:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   29a82:	4c 8d 4b f0          	lea    -0x10(%rbx),%r9
   29a86:	4c 89 ef             	mov    %r13,%rdi
   29a89:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   29a8d:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   29a94:	4c 89 8d f0 fd ff ff 	mov    %r9,-0x210(%rbp)
   29a9b:	4c 8b 43 f8          	mov    -0x8(%rbx),%r8
   29a9f:	4c 89 60 30          	mov    %r12,0x30(%rax)
   29aa3:	e8 38 a8 08 00       	call   b42e0 <js_dynamic_import>
   29aa8:	48 89 c1             	mov    %rax,%rcx
   29aab:	48 89 d0             	mov    %rdx,%rax
   29aae:	83 fa 06             	cmp    $0x6,%edx
   29ab1:	0f 84 c9 c1 ff ff    	je     25c80 <JS_CallInternal+0x830>
   29ab7:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   29abb:	4c 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%r9
   29ac2:	83 fe f6             	cmp    $0xfffffff6,%esi
   29ac5:	76 15                	jbe    29adc <JS_CallInternal+0x468c>
   29ac7:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   29acb:	8b 5f fc             	mov    -0x4(%rdi),%ebx
   29ace:	8d 53 ff             	lea    -0x1(%rbx),%edx
   29ad1:	89 57 fc             	mov    %edx,-0x4(%rdi)
   29ad4:	85 d2                	test   %edx,%edx
   29ad6:	0f 8e e9 3c 00 00    	jle    2d7c5 <JS_CallInternal+0x8375>
   29adc:	49 8b 71 08          	mov    0x8(%r9),%rsi
   29ae0:	83 fe f6             	cmp    $0xfffffff6,%esi
   29ae3:	76 14                	jbe    29af9 <JS_CallInternal+0x46a9>
   29ae5:	49 8b 39             	mov    (%r9),%rdi
   29ae8:	8b 5f fc             	mov    -0x4(%rdi),%ebx
   29aeb:	8d 53 ff             	lea    -0x1(%rbx),%edx
   29aee:	89 57 fc             	mov    %edx,-0x4(%rdi)
   29af1:	85 d2                	test   %edx,%edx
   29af3:	0f 8e 03 3d 00 00    	jle    2d7fc <JS_CallInternal+0x83ac>
   29af9:	49 89 49 f0          	mov    %rcx,-0x10(%r9)
   29afd:	4c 89 cb             	mov    %r9,%rbx
   29b00:	49 83 c4 01          	add    $0x1,%r12
   29b04:	49 89 41 f8          	mov    %rax,-0x8(%r9)
   29b08:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29b0e:	49 89 c2             	mov    %rax,%r10
   29b11:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29b15:	ff e0                	jmp    *%rax
   29b17:	f3 0f 1e fa          	endbr64
   29b1b:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   29b22:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   29b26:	4c 89 ef             	mov    %r13,%rdi
   29b29:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   29b2d:	4c 89 60 30          	mov    %r12,0x30(%rax)
   29b31:	e8 2a b1 ff ff       	call   24c60 <JS_GetPrototype>
   29b36:	48 89 c1             	mov    %rax,%rcx
   29b39:	48 89 d0             	mov    %rdx,%rax
   29b3c:	83 fa 06             	cmp    $0x6,%edx
   29b3f:	0f 84 3b c1 ff ff    	je     25c80 <JS_CallInternal+0x830>
   29b45:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   29b49:	83 fe f6             	cmp    $0xfffffff6,%esi
   29b4c:	76 15                	jbe    29b63 <JS_CallInternal+0x4713>
   29b4e:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   29b52:	8b 57 fc             	mov    -0x4(%rdi),%edx
   29b55:	83 ea 01             	sub    $0x1,%edx
   29b58:	89 57 fc             	mov    %edx,-0x4(%rdi)
   29b5b:	85 d2                	test   %edx,%edx
   29b5d:	0f 8e 0b 3e 00 00    	jle    2d96e <JS_CallInternal+0x851e>
   29b63:	48 89 4b f0          	mov    %rcx,-0x10(%rbx)
   29b67:	49 83 c4 01          	add    $0x1,%r12
   29b6b:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   29b6f:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29b75:	49 89 c2             	mov    %rax,%r10
   29b78:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29b7c:	ff e0                	jmp    *%rax
   29b7e:	f3 0f 1e fa          	endbr64
   29b82:	49 8b 45 58          	mov    0x58(%r13),%rax
   29b86:	b9 01 00 00 00       	mov    $0x1,%ecx
   29b8b:	4c 89 ef             	mov    %r13,%rdi
   29b8e:	48 8b 70 10          	mov    0x10(%rax),%rsi
   29b92:	48 8b 50 18          	mov    0x18(%rax),%rdx
   29b96:	e8 d5 16 02 00       	call   4b270 <JS_NewObjectProtoClass>
   29b9b:	48 89 03             	mov    %rax,(%rbx)
   29b9e:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   29ba2:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   29ba6:	0f 84 8c 4a 00 00    	je     2e638 <JS_CallInternal+0x91e8>
   29bac:	41 0f b6 04 24       	movzbl (%r12),%eax
   29bb1:	48 83 c3 10          	add    $0x10,%rbx
   29bb5:	49 83 c4 01          	add    $0x1,%r12
   29bb9:	49 89 c2             	mov    %rax,%r10
   29bbc:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29bc0:	ff e0                	jmp    *%rax
   29bc2:	f3 0f 1e fa          	endbr64
   29bc6:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   29bcd:	49 83 c4 01          	add    $0x1,%r12
   29bd1:	48 83 c3 10          	add    $0x10,%rbx
   29bd5:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   29bdc:	00 
   29bdd:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29be3:	49 89 c2             	mov    %rax,%r10
   29be6:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29bea:	ff e0                	jmp    *%rax
   29bec:	f3 0f 1e fa          	endbr64
   29bf0:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   29bf7:	49 83 c4 01          	add    $0x1,%r12
   29bfb:	48 83 c3 10          	add    $0x10,%rbx
   29bff:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   29c06:	00 
   29c07:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29c0d:	49 89 c2             	mov    %rax,%r10
   29c10:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29c14:	ff e0                	jmp    *%rax
   29c16:	f3 0f 1e fa          	endbr64
   29c1a:	48 8b 85 70 fe ff ff 	mov    -0x190(%rbp),%rax
   29c21:	f6 40 10 01          	testb  $0x1,0x10(%rax)
   29c25:	75 0d                	jne    29c34 <JS_CallInternal+0x47e4>
   29c27:	83 bd 30 fe ff ff ff 	cmpl   $0xffffffff,-0x1d0(%rbp)
   29c2e:	0f 85 ca 5a 00 00    	jne    2f6fe <JS_CallInternal+0xa2ae>
   29c34:	83 bd 30 fe ff ff f6 	cmpl   $0xfffffff6,-0x1d0(%rbp)
   29c3b:	76 0b                	jbe    29c48 <JS_CallInternal+0x47f8>
   29c3d:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   29c44:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   29c48:	48 8b 85 30 fe ff ff 	mov    -0x1d0(%rbp),%rax
   29c4f:	48 8b 95 10 fe ff ff 	mov    -0x1f0(%rbp),%rdx
   29c56:	48 89 13             	mov    %rdx,(%rbx)
   29c59:	49 83 c4 01          	add    $0x1,%r12
   29c5d:	48 83 c3 10          	add    $0x10,%rbx
   29c61:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   29c65:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29c6b:	49 89 c2             	mov    %rax,%r10
   29c6e:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29c72:	ff e0                	jmp    *%rax
   29c74:	f3 0f 1e fa          	endbr64
   29c78:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   29c7f:	49 83 c4 01          	add    $0x1,%r12
   29c83:	48 83 c3 10          	add    $0x10,%rbx
   29c87:	48 c7 43 f8 02 00 00 	movq   $0x2,-0x8(%rbx)
   29c8e:	00 
   29c8f:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29c95:	49 89 c2             	mov    %rax,%r10
   29c98:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29c9c:	ff e0                	jmp    *%rax
   29c9e:	f3 0f 1e fa          	endbr64
   29ca2:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   29ca9:	49 83 c4 01          	add    $0x1,%r12
   29cad:	48 83 c3 10          	add    $0x10,%rbx
   29cb1:	48 c7 43 f8 03 00 00 	movq   $0x3,-0x8(%rbx)
   29cb8:	00 
   29cb9:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29cbf:	49 89 c2             	mov    %rax,%r10
   29cc2:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29cc6:	ff e0                	jmp    *%rax
   29cc8:	f3 0f 1e fa          	endbr64
   29ccc:	41 8b 34 24          	mov    (%r12),%esi
   29cd0:	31 d2                	xor    %edx,%edx
   29cd2:	4c 89 ef             	mov    %r13,%rdi
   29cd5:	48 83 c3 10          	add    $0x10,%rbx
   29cd9:	49 83 c4 05          	add    $0x5,%r12
   29cdd:	e8 5e 24 01 00       	call   3c140 <__JS_AtomToValue>
   29ce2:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29ce6:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   29cea:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29cf0:	49 89 c2             	mov    %rax,%r10
   29cf3:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29cf7:	ff e0                	jmp    *%rax
   29cf9:	f3 0f 1e fa          	endbr64
   29cfd:	ba 01 00 00 00       	mov    $0x1,%edx
   29d02:	4c 89 ef             	mov    %r13,%rdi
   29d05:	48 83 c3 10          	add    $0x10,%rbx
   29d09:	49 83 c4 01          	add    $0x1,%r12
   29d0d:	be 2f 00 00 00       	mov    $0x2f,%esi
   29d12:	e8 29 24 01 00       	call   3c140 <__JS_AtomToValue>
   29d17:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29d1b:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   29d1f:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29d25:	49 89 c2             	mov    %rax,%r10
   29d28:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29d2c:	ff e0                	jmp    *%rax
   29d2e:	f3 0f 1e fa          	endbr64
   29d32:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   29d36:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   29d3a:	83 f8 f6             	cmp    $0xfffffff6,%eax
   29d3d:	76 11                	jbe    29d50 <JS_CallInternal+0x4900>
   29d3f:	8b 79 fc             	mov    -0x4(%rcx),%edi
   29d42:	8d 57 ff             	lea    -0x1(%rdi),%edx
   29d45:	89 51 fc             	mov    %edx,-0x4(%rcx)
   29d48:	85 d2                	test   %edx,%edx
   29d4a:	0f 8e d1 3c 00 00    	jle    2da21 <JS_CallInternal+0x85d1>
   29d50:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   29d55:	49 83 c4 01          	add    $0x1,%r12
   29d59:	48 83 eb 10          	sub    $0x10,%rbx
   29d5d:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   29d61:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29d67:	49 89 c2             	mov    %rax,%r10
   29d6a:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29d6e:	ff e0                	jmp    *%rax
   29d70:	f3 0f 1e fa          	endbr64
   29d74:	e9 c7 b9 ff ff       	jmp    25740 <JS_CallInternal+0x2f0>
   29d79:	f3 0f 1e fa          	endbr64
   29d7d:	e9 be b9 ff ff       	jmp    25740 <JS_CallInternal+0x2f0>
   29d82:	f3 0f 1e fa          	endbr64
   29d86:	e9 b5 b9 ff ff       	jmp    25740 <JS_CallInternal+0x2f0>
   29d8b:	f3 0f 1e fa          	endbr64
   29d8f:	e9 ac b9 ff ff       	jmp    25740 <JS_CallInternal+0x2f0>
   29d94:	f3 0f 1e fa          	endbr64
   29d98:	48 8b 8d 70 fe ff ff 	mov    -0x190(%rbp),%rcx
   29d9f:	41 8b 04 24          	mov    (%r12),%eax
   29da3:	48 c1 e0 04          	shl    $0x4,%rax
   29da7:	48 03 41 50          	add    0x50(%rcx),%rax
   29dab:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   29daf:	48 8b 10             	mov    (%rax),%rdx
   29db2:	48 8b 40 08          	mov    0x8(%rax),%rax
   29db6:	83 f8 f6             	cmp    $0xfffffff6,%eax
   29db9:	76 04                	jbe    29dbf <JS_CallInternal+0x496f>
   29dbb:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   29dbf:	48 89 13             	mov    %rdx,(%rbx)
   29dc2:	49 83 c4 05          	add    $0x5,%r12
   29dc6:	48 89 43 08          	mov    %rax,0x8(%rbx)
   29dca:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29dd0:	48 89 cb             	mov    %rcx,%rbx
   29dd3:	49 89 c2             	mov    %rax,%r10
   29dd6:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29dda:	ff e0                	jmp    *%rax
   29ddc:	f3 0f 1e fa          	endbr64
   29de0:	49 63 04 24          	movslq (%r12),%rax
   29de4:	48 c7 43 08 07 00 00 	movq   $0x7,0x8(%rbx)
   29deb:	00 
   29dec:	49 83 c4 05          	add    $0x5,%r12
   29df0:	48 83 c3 10          	add    $0x10,%rbx
   29df4:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29df8:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29dfe:	49 89 c2             	mov    %rax,%r10
   29e01:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29e05:	ff e0                	jmp    *%rax
   29e07:	f3 0f 1e fa          	endbr64
   29e0b:	41 8b 04 24          	mov    (%r12),%eax
   29e0f:	48 c7 43 08 00 00 00 	movq   $0x0,0x8(%rbx)
   29e16:	00 
   29e17:	49 83 c4 05          	add    $0x5,%r12
   29e1b:	48 83 c3 10          	add    $0x10,%rbx
   29e1f:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29e23:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29e29:	49 89 c2             	mov    %rax,%r10
   29e2c:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29e30:	ff e0                	jmp    *%rax
   29e32:	f3 0f 1e fa          	endbr64
   29e36:	e9 05 b9 ff ff       	jmp    25740 <JS_CallInternal+0x2f0>
   29e3b:	f3 0f 1e fa          	endbr64
   29e3f:	e9 fc b8 ff ff       	jmp    25740 <JS_CallInternal+0x2f0>
   29e44:	f3 0f 1e fa          	endbr64
   29e48:	e9 f3 b8 ff ff       	jmp    25740 <JS_CallInternal+0x2f0>
   29e4d:	f3 0f 1e fa          	endbr64
   29e51:	41 0f bf 04 24       	movswl (%r12),%eax
   29e56:	48 83 c3 10          	add    $0x10,%rbx
   29e5a:	49 83 c4 03          	add    $0x3,%r12
   29e5e:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   29e65:	00 
   29e66:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29e6a:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29e70:	49 89 c2             	mov    %rax,%r10
   29e73:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29e77:	ff e0                	jmp    *%rax
   29e79:	f3 0f 1e fa          	endbr64
   29e7d:	41 0f be 04 24       	movsbl (%r12),%eax
   29e82:	48 83 c3 10          	add    $0x10,%rbx
   29e86:	49 83 c4 02          	add    $0x2,%r12
   29e8a:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   29e91:	00 
   29e92:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   29e96:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29e9c:	49 89 c2             	mov    %rax,%r10
   29e9f:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29ea3:	ff e0                	jmp    *%rax
   29ea5:	f3 0f 1e fa          	endbr64
   29ea9:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   29ead:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   29eb1:	83 f8 f6             	cmp    $0xfffffff6,%eax
   29eb4:	76 04                	jbe    29eba <JS_CallInternal+0x4a6a>
   29eb6:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   29eba:	48 89 13             	mov    %rdx,(%rbx)
   29ebd:	49 83 c4 01          	add    $0x1,%r12
   29ec1:	48 83 c3 10          	add    $0x10,%rbx
   29ec5:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   29ec9:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29ecf:	49 89 c2             	mov    %rax,%r10
   29ed2:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29ed6:	ff e0                	jmp    *%rax
   29ed8:	f3 0f 1e fa          	endbr64
   29edc:	48 8b 43 d8          	mov    -0x28(%rbx),%rax
   29ee0:	48 8b 4b d0          	mov    -0x30(%rbx),%rcx
   29ee4:	83 f8 f6             	cmp    $0xfffffff6,%eax
   29ee7:	76 11                	jbe    29efa <JS_CallInternal+0x4aaa>
   29ee9:	8b 79 fc             	mov    -0x4(%rcx),%edi
   29eec:	8d 57 ff             	lea    -0x1(%rdi),%edx
   29eef:	89 51 fc             	mov    %edx,-0x4(%rcx)
   29ef2:	85 d2                	test   %edx,%edx
   29ef4:	0f 8e c0 3b 00 00    	jle    2daba <JS_CallInternal+0x866a>
   29efa:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   29eff:	49 83 c4 01          	add    $0x1,%r12
   29f03:	48 83 eb 10          	sub    $0x10,%rbx
   29f07:	0f 11 43 e0          	movups %xmm0,-0x20(%rbx)
   29f0b:	f3 0f 6f 03          	movdqu (%rbx),%xmm0
   29f0f:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   29f13:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   29f19:	49 89 c2             	mov    %rax,%r10
   29f1c:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29f20:	ff e0                	jmp    *%rax
   29f22:	f3 0f 1e fa          	endbr64
   29f26:	8b 8d 60 fe ff ff    	mov    -0x1a0(%rbp),%ecx
   29f2c:	41 0f b7 04 24       	movzwl (%r12),%eax
   29f31:	4c 89 ef             	mov    %r13,%rdi
   29f34:	39 c8                	cmp    %ecx,%eax
   29f36:	0f 4f c1             	cmovg  %ecx,%eax
   29f39:	48 63 d0             	movslq %eax,%rdx
   29f3c:	29 c1                	sub    %eax,%ecx
   29f3e:	48 c1 e2 04          	shl    $0x4,%rdx
   29f42:	89 ce                	mov    %ecx,%esi
   29f44:	48 03 95 50 fe ff ff 	add    -0x1b0(%rbp),%rdx
   29f4b:	e8 80 30 02 00       	call   4cfd0 <js_create_array>
   29f50:	48 89 03             	mov    %rax,(%rbx)
   29f53:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   29f57:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   29f5b:	0f 84 70 4d 00 00    	je     2ecd1 <JS_CallInternal+0x9881>
   29f61:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   29f67:	48 83 c3 10          	add    $0x10,%rbx
   29f6b:	49 83 c4 03          	add    $0x3,%r12
   29f6f:	49 89 c2             	mov    %rax,%r10
   29f72:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29f76:	ff e0                	jmp    *%rax
   29f78:	f3 0f 1e fa          	endbr64
   29f7c:	49 8d 44 24 01       	lea    0x1(%r12),%rax
   29f81:	48 89 85 e8 fd ff ff 	mov    %rax,-0x218(%rbp)
   29f88:	41 80 3c 24 06       	cmpb   $0x6,(%r12)
   29f8d:	0f 87 4a 86 fe ff    	ja     125dd <JS_CallInternal.cold>
   29f93:	41 0f b6 04 24       	movzbl (%r12),%eax
   29f98:	48 8d 15 4d 92 0b 00 	lea    0xb924d(%rip),%rdx        # e31ec <qjsc_repl_size+0x4e0>
   29f9f:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
   29fa3:	48 01 d0             	add    %rdx,%rax
   29fa6:	3e ff e0             	notrack jmp *%rax
   29fa9:	48 8d 43 10          	lea    0x10(%rbx),%rax
   29fad:	b9 01 00 00 00       	mov    $0x1,%ecx
   29fb2:	31 f6                	xor    %esi,%esi
   29fb4:	ba 02 00 00 00       	mov    $0x2,%edx
   29fb9:	4c 89 ef             	mov    %r13,%rdi
   29fbc:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   29fc3:	e8 a8 12 02 00       	call   4b270 <JS_NewObjectProtoClass>
   29fc8:	48 89 03             	mov    %rax,(%rbx)
   29fcb:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   29fcf:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   29fd3:	0f 84 74 01 00 00    	je     2a14d <JS_CallInternal+0x4cfd>
   29fd9:	48 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%rbx
   29fe0:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
   29fe6:	49 83 c4 02          	add    $0x2,%r12
   29fea:	49 89 c2             	mov    %rax,%r10
   29fed:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   29ff1:	ff e0                	jmp    *%rax
   29ff3:	48 8b 85 00 fe ff ff 	mov    -0x200(%rbp),%rax
   29ffa:	48 8b 40 38          	mov    0x38(%rax),%rax
   29ffe:	48 85 c0             	test   %rax,%rax
   2a001:	0f 84 1f 60 00 00    	je     30026 <JS_CallInternal+0xabd6>
   2a007:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2a00b:	48 83 c3 10          	add    $0x10,%rbx
   2a00f:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2a013:	48 c7 43 f8 ff ff ff 	movq   $0xffffffffffffffff,-0x8(%rbx)
   2a01a:	ff 
   2a01b:	eb c3                	jmp    29fe0 <JS_CallInternal+0x4b90>
   2a01d:	48 8d 43 10          	lea    0x10(%rbx),%rax
   2a021:	49 8b 95 58 01 00 00 	mov    0x158(%r13),%rdx
   2a028:	48 c7 85 58 ff ff ff 	movq   $0x0,-0xa8(%rbp)
   2a02f:	00 00 00 00 
   2a033:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   2a03a:	8b 85 60 fe ff ff    	mov    -0x1a0(%rbp),%eax
   2a040:	48 89 85 50 ff ff ff 	mov    %rax,-0xb0(%rbp)
   2a047:	49 8b 85 50 01 00 00 	mov    0x150(%r13),%rax
   2a04e:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a051:	76 04                	jbe    2a057 <JS_CallInternal+0x4c07>
   2a053:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2a057:	48 89 85 60 ff ff ff 	mov    %rax,-0xa0(%rbp)
   2a05e:	49 8b 85 60 01 00 00 	mov    0x160(%r13),%rax
   2a065:	41 83 bd 68 01 00 00 	cmpl   $0xfffffff6,0x168(%r13)
   2a06c:	f6 
   2a06d:	48 89 95 68 ff ff ff 	mov    %rdx,-0x98(%rbp)
   2a074:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
   2a07b:	76 04                	jbe    2a081 <JS_CallInternal+0x4c31>
   2a07d:	83 40 fc 02          	addl   $0x2,-0x4(%rax)
   2a081:	49 8b 75 38          	mov    0x38(%r13),%rsi
   2a085:	48 8d 8d 50 ff ff ff 	lea    -0xb0(%rbp),%rcx
   2a08c:	ba 08 00 00 00       	mov    $0x8,%edx
   2a091:	4c 89 ef             	mov    %r13,%rdi
   2a094:	48 89 85 78 ff ff ff 	mov    %rax,-0x88(%rbp)
   2a09b:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2a09f:	e8 1c 09 02 00       	call   4a9c0 <JS_NewObjectFromShape>
   2a0a4:	48 89 c1             	mov    %rax,%rcx
   2a0a7:	83 fa 06             	cmp    $0x6,%edx
   2a0aa:	0f 84 80 56 00 00    	je     2f730 <JS_CallInternal+0xa2e0>
   2a0b0:	8b 85 60 fe ff ff    	mov    -0x1a0(%rbp),%eax
   2a0b6:	85 c0                	test   %eax,%eax
   2a0b8:	0f 8f 72 53 00 00    	jg     2f430 <JS_CallInternal+0x9fe0>
   2a0be:	48 c7 41 30 00 00 00 	movq   $0x0,0x30(%rcx)
   2a0c5:	00 
   2a0c6:	89 41 38             	mov    %eax,0x38(%rcx)
   2a0c9:	48 89 0b             	mov    %rcx,(%rbx)
   2a0cc:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2a0d0:	e9 04 ff ff ff       	jmp    29fd9 <JS_CallInternal+0x4b89>
   2a0d5:	48 8b 95 80 fe ff ff 	mov    -0x180(%rbp),%rdx
   2a0dc:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   2a0e0:	48 8b 42 08          	mov    0x8(%rdx),%rax
   2a0e4:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   2a0e8:	83 fa f6             	cmp    $0xfffffff6,%edx
   2a0eb:	76 04                	jbe    2a0f1 <JS_CallInternal+0x4ca1>
   2a0ed:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2a0f1:	48 89 03             	mov    %rax,(%rbx)
   2a0f4:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2a0f8:	48 89 cb             	mov    %rcx,%rbx
   2a0fb:	e9 e0 fe ff ff       	jmp    29fe0 <JS_CallInternal+0x4b90>
   2a100:	48 8b 8d 70 fe ff ff 	mov    -0x190(%rbp),%rcx
   2a107:	48 8d 43 10          	lea    0x10(%rbx),%rax
   2a10b:	48 8b 95 50 fe ff ff 	mov    -0x1b0(%rbp),%rdx
   2a112:	4c 89 ef             	mov    %r13,%rdi
   2a115:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   2a11c:	8b 85 60 fe ff ff    	mov    -0x1a0(%rbp),%eax
   2a122:	44 0f b7 41 38       	movzwl 0x38(%rcx),%r8d
   2a127:	48 8b 8d 80 fe ff ff 	mov    -0x180(%rbp),%rcx
   2a12e:	89 c6                	mov    %eax,%esi
   2a130:	41 39 c0             	cmp    %eax,%r8d
   2a133:	44 0f 4f c0          	cmovg  %eax,%r8d
   2a137:	e8 b4 0c 02 00       	call   4adf0 <js_build_mapped_arguments>
   2a13c:	48 89 03             	mov    %rax,(%rbx)
   2a13f:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2a143:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   2a147:	0f 85 8c fe ff ff    	jne    29fd9 <JS_CallInternal+0x4b89>
   2a14d:	48 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%rbx
   2a154:	4c 8b a5 e8 fd ff ff 	mov    -0x218(%rbp),%r12
   2a15b:	e9 20 bb ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2a160:	48 8d 43 10          	lea    0x10(%rbx),%rax
   2a164:	31 f6                	xor    %esi,%esi
   2a166:	4c 89 ef             	mov    %r13,%rdi
   2a169:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   2a170:	e8 8b b1 ff ff       	call   25300 <JS_GetScriptOrModuleName>
   2a175:	89 c2                	mov    %eax,%edx
   2a177:	85 d2                	test   %edx,%edx
   2a179:	0f 84 1a 4d 00 00    	je     2ee99 <JS_CallInternal+0x9a49>
   2a17f:	49 8b 85 b8 01 00 00 	mov    0x1b8(%r13),%rax
   2a186:	49 8d 8d b0 01 00 00 	lea    0x1b0(%r13),%rcx
   2a18d:	48 39 c8             	cmp    %rcx,%rax
   2a190:	75 1b                	jne    2a1ad <JS_CallInternal+0x4d5d>
   2a192:	e9 d9 4c 00 00       	jmp    2ee70 <JS_CallInternal+0x9a20>
   2a197:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   2a19e:	00 00 
   2a1a0:	48 8b 40 08          	mov    0x8(%rax),%rax
   2a1a4:	48 39 c8             	cmp    %rcx,%rax
   2a1a7:	0f 84 33 52 00 00    	je     2f3e0 <JS_CallInternal+0x9f90>
   2a1ad:	3b 50 f8             	cmp    -0x8(%rax),%edx
   2a1b0:	75 ee                	jne    2a1a0 <JS_CallInternal+0x4d50>
   2a1b2:	48 83 e8 18          	sub    $0x18,%rax
   2a1b6:	81 fa f2 00 00 00    	cmp    $0xf2,%edx
   2a1bc:	0f 8f 2c 52 00 00    	jg     2f3ee <JS_CallInternal+0x9f9e>
   2a1c2:	48 89 c6             	mov    %rax,%rsi
   2a1c5:	4c 89 ef             	mov    %r13,%rdi
   2a1c8:	e8 03 b2 ff ff       	call   253d0 <JS_GetImportMeta>
   2a1cd:	48 89 03             	mov    %rax,(%rbx)
   2a1d0:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2a1d4:	83 fa 06             	cmp    $0x6,%edx
   2a1d7:	0f 85 fc fd ff ff    	jne    29fd9 <JS_CallInternal+0x4b89>
   2a1dd:	e9 6b ff ff ff       	jmp    2a14d <JS_CallInternal+0x4cfd>
   2a1e2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   2a1e8:	48 8d 43 10          	lea    0x10(%rbx),%rax
   2a1ec:	83 bd 38 fe ff ff f6 	cmpl   $0xfffffff6,-0x1c8(%rbp)
   2a1f3:	76 0b                	jbe    2a200 <JS_CallInternal+0x4db0>
   2a1f5:	48 8b 8d 18 fe ff ff 	mov    -0x1e8(%rbp),%rcx
   2a1fc:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   2a200:	48 8b 8d 18 fe ff ff 	mov    -0x1e8(%rbp),%rcx
   2a207:	48 89 0b             	mov    %rcx,(%rbx)
   2a20a:	48 8b 8d 38 fe ff ff 	mov    -0x1c8(%rbp),%rcx
   2a211:	48 89 4b 08          	mov    %rcx,0x8(%rbx)
   2a215:	48 89 c3             	mov    %rax,%rbx
   2a218:	e9 c3 fd ff ff       	jmp    29fe0 <JS_CallInternal+0x4b90>
   2a21d:	f3 0f 1e fa          	endbr64
   2a221:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2a225:	48 83 eb 10          	sub    $0x10,%rbx
   2a229:	48 8b 0b             	mov    (%rbx),%rcx
   2a22c:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2a22f:	76 11                	jbe    2a242 <JS_CallInternal+0x4df2>
   2a231:	8b 79 fc             	mov    -0x4(%rcx),%edi
   2a234:	8d 57 ff             	lea    -0x1(%rdi),%edx
   2a237:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2a23a:	85 d2                	test   %edx,%edx
   2a23c:	0f 8e 5e 35 00 00    	jle    2d7a0 <JS_CallInternal+0x8350>
   2a242:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a247:	49 83 c4 01          	add    $0x1,%r12
   2a24b:	49 89 c2             	mov    %rax,%r10
   2a24e:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a252:	ff e0                	jmp    *%rax
   2a254:	f3 0f 1e fa          	endbr64
   2a258:	f3 0f 6f 4b c0       	movdqu -0x40(%rbx),%xmm1
   2a25d:	f3 0f 6f 43 b0       	movdqu -0x50(%rbx),%xmm0
   2a262:	49 83 c4 01          	add    $0x1,%r12
   2a266:	0f 11 4b b0          	movups %xmm1,-0x50(%rbx)
   2a26a:	f3 0f 6f 4b d0       	movdqu -0x30(%rbx),%xmm1
   2a26f:	0f 11 4b c0          	movups %xmm1,-0x40(%rbx)
   2a273:	f3 0f 6f 4b e0       	movdqu -0x20(%rbx),%xmm1
   2a278:	0f 11 4b d0          	movups %xmm1,-0x30(%rbx)
   2a27c:	f3 0f 6f 4b f0       	movdqu -0x10(%rbx),%xmm1
   2a281:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   2a285:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   2a289:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a28f:	49 89 c2             	mov    %rax,%r10
   2a292:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a296:	ff e0                	jmp    *%rax
   2a298:	f3 0f 1e fa          	endbr64
   2a29c:	f3 0f 6f 4b d0       	movdqu -0x30(%rbx),%xmm1
   2a2a1:	f3 0f 6f 43 c0       	movdqu -0x40(%rbx),%xmm0
   2a2a6:	49 83 c4 01          	add    $0x1,%r12
   2a2aa:	0f 11 4b c0          	movups %xmm1,-0x40(%rbx)
   2a2ae:	f3 0f 6f 4b e0       	movdqu -0x20(%rbx),%xmm1
   2a2b3:	0f 11 4b d0          	movups %xmm1,-0x30(%rbx)
   2a2b7:	f3 0f 6f 4b f0       	movdqu -0x10(%rbx),%xmm1
   2a2bc:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   2a2c0:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   2a2c4:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a2ca:	49 89 c2             	mov    %rax,%r10
   2a2cd:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a2d1:	ff e0                	jmp    *%rax
   2a2d3:	f3 0f 1e fa          	endbr64
   2a2d7:	f3 0f 6f 4b e0       	movdqu -0x20(%rbx),%xmm1
   2a2dc:	f3 0f 6f 43 d0       	movdqu -0x30(%rbx),%xmm0
   2a2e1:	49 83 c4 01          	add    $0x1,%r12
   2a2e5:	0f 11 4b d0          	movups %xmm1,-0x30(%rbx)
   2a2e9:	f3 0f 6f 4b f0       	movdqu -0x10(%rbx),%xmm1
   2a2ee:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   2a2f2:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   2a2f6:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a2fc:	49 89 c2             	mov    %rax,%r10
   2a2ff:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a303:	ff e0                	jmp    *%rax
   2a305:	f3 0f 1e fa          	endbr64
   2a309:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   2a30e:	f3 0f 6f 4b d0       	movdqu -0x30(%rbx),%xmm1
   2a313:	49 83 c4 01          	add    $0x1,%r12
   2a317:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   2a31b:	0f 11 43 d0          	movups %xmm0,-0x30(%rbx)
   2a31f:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a325:	49 89 c2             	mov    %rax,%r10
   2a328:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a32c:	ff e0                	jmp    *%rax
   2a32e:	f3 0f 1e fa          	endbr64
   2a332:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2a337:	0f 11 03             	movups %xmm0,(%rbx)
   2a33a:	66 48 0f 7e c2       	movq   %xmm0,%rdx
   2a33f:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   2a344:	48 8b 43 08          	mov    0x8(%rbx),%rax
   2a348:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   2a34c:	f3 0f 6f 43 d0       	movdqu -0x30(%rbx),%xmm0
   2a351:	0f 11 43 e0          	movups %xmm0,-0x20(%rbx)
   2a355:	f3 0f 6f 43 c0       	movdqu -0x40(%rbx),%xmm0
   2a35a:	0f 11 43 d0          	movups %xmm0,-0x30(%rbx)
   2a35e:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2a361:	76 04                	jbe    2a367 <JS_CallInternal+0x4f17>
   2a363:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2a367:	48 89 53 c0          	mov    %rdx,-0x40(%rbx)
   2a36b:	49 83 c4 01          	add    $0x1,%r12
   2a36f:	48 83 c3 10          	add    $0x10,%rbx
   2a373:	48 89 43 b8          	mov    %rax,-0x48(%rbx)
   2a377:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a37d:	49 89 c2             	mov    %rax,%r10
   2a380:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a384:	ff e0                	jmp    *%rax
   2a386:	f3 0f 1e fa          	endbr64
   2a38a:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2a38f:	0f 11 03             	movups %xmm0,(%rbx)
   2a392:	66 48 0f 7e c2       	movq   %xmm0,%rdx
   2a397:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   2a39c:	48 8b 43 08          	mov    0x8(%rbx),%rax
   2a3a0:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   2a3a4:	f3 0f 6f 43 d0       	movdqu -0x30(%rbx),%xmm0
   2a3a9:	0f 11 43 e0          	movups %xmm0,-0x20(%rbx)
   2a3ad:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2a3b0:	76 04                	jbe    2a3b6 <JS_CallInternal+0x4f66>
   2a3b2:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2a3b6:	48 89 53 d0          	mov    %rdx,-0x30(%rbx)
   2a3ba:	49 83 c4 01          	add    $0x1,%r12
   2a3be:	48 83 c3 10          	add    $0x10,%rbx
   2a3c2:	48 89 43 c8          	mov    %rax,-0x38(%rbx)
   2a3c6:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a3cc:	49 89 c2             	mov    %rax,%r10
   2a3cf:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a3d3:	ff e0                	jmp    *%rax
   2a3d5:	f3 0f 1e fa          	endbr64
   2a3d9:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2a3de:	0f 11 03             	movups %xmm0,(%rbx)
   2a3e1:	66 48 0f 7e c2       	movq   %xmm0,%rdx
   2a3e6:	48 8b 43 08          	mov    0x8(%rbx),%rax
   2a3ea:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   2a3ef:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   2a3f3:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2a3f6:	76 04                	jbe    2a3fc <JS_CallInternal+0x4fac>
   2a3f8:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2a3fc:	48 89 53 e0          	mov    %rdx,-0x20(%rbx)
   2a400:	49 83 c4 01          	add    $0x1,%r12
   2a404:	48 83 c3 10          	add    $0x10,%rbx
   2a408:	48 89 43 d8          	mov    %rax,-0x28(%rbx)
   2a40c:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a412:	49 89 c2             	mov    %rax,%r10
   2a415:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a419:	ff e0                	jmp    *%rax
   2a41b:	f3 0f 1e fa          	endbr64
   2a41f:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2a424:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   2a428:	48 8b 53 e0          	mov    -0x20(%rbx),%rdx
   2a42c:	0f 11 03             	movups %xmm0,(%rbx)
   2a42f:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2a432:	76 04                	jbe    2a438 <JS_CallInternal+0x4fe8>
   2a434:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2a438:	48 89 53 f0          	mov    %rdx,-0x10(%rbx)
   2a43c:	49 83 c4 01          	add    $0x1,%r12
   2a440:	48 83 c3 10          	add    $0x10,%rbx
   2a444:	48 89 43 e8          	mov    %rax,-0x18(%rbx)
   2a448:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a44e:	49 89 c2             	mov    %rax,%r10
   2a451:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a455:	ff e0                	jmp    *%rax
   2a457:	f3 0f 1e fa          	endbr64
   2a45b:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   2a460:	f3 0f 6f 4b f0       	movdqu -0x10(%rbx),%xmm1
   2a465:	49 83 c4 01          	add    $0x1,%r12
   2a469:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   2a46d:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   2a471:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a477:	49 89 c2             	mov    %rax,%r10
   2a47a:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a47e:	ff e0                	jmp    *%rax
   2a480:	f3 0f 1e fa          	endbr64
   2a484:	f3 0f 6f 4b d0       	movdqu -0x30(%rbx),%xmm1
   2a489:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   2a48e:	49 83 c4 01          	add    $0x1,%r12
   2a492:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   2a496:	f3 0f 6f 4b c0       	movdqu -0x40(%rbx),%xmm1
   2a49b:	0f 11 4b d0          	movups %xmm1,-0x30(%rbx)
   2a49f:	f3 0f 6f 4b b0       	movdqu -0x50(%rbx),%xmm1
   2a4a4:	0f 11 43 b0          	movups %xmm0,-0x50(%rbx)
   2a4a8:	0f 11 4b c0          	movups %xmm1,-0x40(%rbx)
   2a4ac:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a4b2:	49 89 c2             	mov    %rax,%r10
   2a4b5:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a4b9:	ff e0                	jmp    *%rax
   2a4bb:	f3 0f 1e fa          	endbr64
   2a4bf:	f3 0f 6f 4b d0       	movdqu -0x30(%rbx),%xmm1
   2a4c4:	f3 0f 6f 43 e0       	movdqu -0x20(%rbx),%xmm0
   2a4c9:	49 83 c4 01          	add    $0x1,%r12
   2a4cd:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   2a4d1:	f3 0f 6f 4b c0       	movdqu -0x40(%rbx),%xmm1
   2a4d6:	0f 11 43 c0          	movups %xmm0,-0x40(%rbx)
   2a4da:	0f 11 4b d0          	movups %xmm1,-0x30(%rbx)
   2a4de:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a4e4:	49 89 c2             	mov    %rax,%r10
   2a4e7:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a4eb:	ff e0                	jmp    *%rax
   2a4ed:	f3 0f 1e fa          	endbr64
   2a4f1:	f3 0f 6f 4b e0       	movdqu -0x20(%rbx),%xmm1
   2a4f6:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2a4fb:	49 83 c4 01          	add    $0x1,%r12
   2a4ff:	0f 11 4b f0          	movups %xmm1,-0x10(%rbx)
   2a503:	f3 0f 6f 4b d0       	movdqu -0x30(%rbx),%xmm1
   2a508:	0f 11 43 d0          	movups %xmm0,-0x30(%rbx)
   2a50c:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   2a510:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a516:	49 89 c2             	mov    %rax,%r10
   2a519:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a51d:	ff e0                	jmp    *%rax
   2a51f:	f3 0f 1e fa          	endbr64
   2a523:	41 8b 04 24          	mov    (%r12),%eax
   2a527:	48 8b 8d 70 fe ff ff 	mov    -0x190(%rbp),%rcx
   2a52e:	48 c1 e0 04          	shl    $0x4,%rax
   2a532:	48 03 41 50          	add    0x50(%rcx),%rax
   2a536:	48 8b 10             	mov    (%rax),%rdx
   2a539:	48 8b 40 08          	mov    0x8(%rax),%rax
   2a53d:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2a540:	76 04                	jbe    2a546 <JS_CallInternal+0x50f6>
   2a542:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2a546:	48 92                	xchg   %rax,%rdx
   2a548:	4c 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%r8
   2a54f:	45 31 c9             	xor    %r9d,%r9d
   2a552:	4c 89 ef             	mov    %r13,%rdi
   2a555:	48 8b 8d 48 fe ff ff 	mov    -0x1b8(%rbp),%rcx
   2a55c:	48 89 c6             	mov    %rax,%rsi
   2a55f:	e8 9c 4a 02 00       	call   4f000 <js_closure>
   2a564:	48 89 03             	mov    %rax,(%rbx)
   2a567:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2a56b:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   2a56f:	0f 84 44 3f 00 00    	je     2e4b9 <JS_CallInternal+0x9069>
   2a575:	41 0f b6 44 24 04    	movzbl 0x4(%r12),%eax
   2a57b:	48 83 c3 10          	add    $0x10,%rbx
   2a57f:	49 83 c4 05          	add    $0x5,%r12
   2a583:	49 89 c2             	mov    %rax,%r10
   2a586:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a58a:	ff e0                	jmp    *%rax
   2a58c:	f3 0f 1e fa          	endbr64
   2a590:	f3 0f 6f 53 e0       	movdqu -0x20(%rbx),%xmm2
   2a595:	f3 0f 6f 4b c0       	movdqu -0x40(%rbx),%xmm1
   2a59a:	49 83 c4 01          	add    $0x1,%r12
   2a59e:	f3 0f 6f 43 d0       	movdqu -0x30(%rbx),%xmm0
   2a5a3:	0f 11 53 c0          	movups %xmm2,-0x40(%rbx)
   2a5a7:	f3 0f 6f 53 f0       	movdqu -0x10(%rbx),%xmm2
   2a5ac:	0f 11 4b e0          	movups %xmm1,-0x20(%rbx)
   2a5b0:	0f 11 53 d0          	movups %xmm2,-0x30(%rbx)
   2a5b4:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   2a5b8:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a5be:	49 89 c2             	mov    %rax,%r10
   2a5c1:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a5c5:	ff e0                	jmp    *%rax
   2a5c7:	f3 0f 1e fa          	endbr64
   2a5cb:	e9 6e b2 ff ff       	jmp    2583e <JS_CallInternal+0x3ee>
   2a5d0:	f3 0f 1e fa          	endbr64
   2a5d4:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2a5d8:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   2a5dc:	4c 89 ef             	mov    %r13,%rdi
   2a5df:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   2a5e3:	4c 8b 43 f8          	mov    -0x8(%rbx),%r8
   2a5e7:	e8 84 a3 00 00       	call   34970 <JS_CheckBrand>
   2a5ec:	83 f8 ff             	cmp    $0xffffffff,%eax
   2a5ef:	0f 84 8b b6 ff ff    	je     25c80 <JS_CallInternal+0x830>
   2a5f5:	85 c0                	test   %eax,%eax
   2a5f7:	0f 84 81 58 00 00    	je     2fe7e <JS_CallInternal+0xaa2e>
   2a5fd:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a602:	49 83 c4 01          	add    $0x1,%r12
   2a606:	49 89 c2             	mov    %rax,%r10
   2a609:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a60d:	ff e0                	jmp    *%rax
   2a60f:	f3 0f 1e fa          	endbr64
   2a613:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2a61a:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2a61e:	83 bd 38 fe ff ff 03 	cmpl   $0x3,-0x1c8(%rbp)
   2a625:	0f 84 82 50 00 00    	je     2f6ad <JS_CallInternal+0xa25d>
   2a62b:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2a632:	48 8b 95 28 fe ff ff 	mov    -0x1d8(%rbp),%rdx
   2a639:	4c 89 ef             	mov    %r13,%rdi
   2a63c:	48 89 c6             	mov    %rax,%rsi
   2a63f:	48 89 85 20 fe ff ff 	mov    %rax,-0x1e0(%rbp)
   2a646:	48 89 95 28 fe ff ff 	mov    %rdx,-0x1d8(%rbp)
   2a64d:	e8 0e a6 ff ff       	call   24c60 <JS_GetPrototype>
   2a652:	48 89 c6             	mov    %rax,%rsi
   2a655:	49 89 d2             	mov    %rdx,%r10
   2a658:	83 fa 06             	cmp    $0x6,%edx
   2a65b:	0f 84 1f b6 ff ff    	je     25c80 <JS_CallInternal+0x830>
   2a661:	48 8b 95 38 fe ff ff 	mov    -0x1c8(%rbp),%rdx
   2a668:	48 8b 85 18 fe ff ff 	mov    -0x1e8(%rbp),%rax
   2a66f:	6a 02                	push   $0x2
   2a671:	4c 89 ef             	mov    %r13,%rdi
   2a674:	ff b5 50 fe ff ff    	push   -0x1b0(%rbp)
   2a67a:	44 8b 8d 60 fe ff ff 	mov    -0x1a0(%rbp),%r9d
   2a681:	49 89 d0             	mov    %rdx,%r8
   2a684:	48 89 c1             	mov    %rax,%rcx
   2a687:	4c 89 d2             	mov    %r10,%rdx
   2a68a:	4c 89 95 f0 fd ff ff 	mov    %r10,-0x210(%rbp)
   2a691:	48 89 b5 e8 fd ff ff 	mov    %rsi,-0x218(%rbp)
   2a698:	e8 83 0d 07 00       	call   9b420 <JS_CallConstructorInternal>
   2a69d:	4c 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%r10
   2a6a4:	5f                   	pop    %rdi
   2a6a5:	48 89 c1             	mov    %rax,%rcx
   2a6a8:	41 58                	pop    %r8
   2a6aa:	48 89 d0             	mov    %rdx,%rax
   2a6ad:	41 83 fa f6          	cmp    $0xfffffff6,%r10d
   2a6b1:	76 18                	jbe    2a6cb <JS_CallInternal+0x527b>
   2a6b3:	48 8b b5 e8 fd ff ff 	mov    -0x218(%rbp),%rsi
   2a6ba:	8b 7e fc             	mov    -0x4(%rsi),%edi
   2a6bd:	8d 57 ff             	lea    -0x1(%rdi),%edx
   2a6c0:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2a6c3:	85 d2                	test   %edx,%edx
   2a6c5:	0f 8e 5f 3a 00 00    	jle    2e12a <JS_CallInternal+0x8cda>
   2a6cb:	83 f8 06             	cmp    $0x6,%eax
   2a6ce:	0f 84 ac b5 ff ff    	je     25c80 <JS_CallInternal+0x830>
   2a6d4:	48 89 0b             	mov    %rcx,(%rbx)
   2a6d7:	49 83 c4 01          	add    $0x1,%r12
   2a6db:	48 83 c3 10          	add    $0x10,%rbx
   2a6df:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2a6e3:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a6e9:	49 89 c2             	mov    %rax,%r10
   2a6ec:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a6f0:	ff e0                	jmp    *%rax
   2a6f2:	f3 0f 1e fa          	endbr64
   2a6f6:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2a6fa:	48 8b 73 e8          	mov    -0x18(%rbx),%rsi
   2a6fe:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   2a702:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2a706:	89 c7                	mov    %eax,%edi
   2a708:	09 f7                	or     %esi,%edi
   2a70a:	0f 85 66 3a 00 00    	jne    2e176 <JS_CallInternal+0x8d26>
   2a710:	48 63 f2             	movslq %edx,%rsi
   2a713:	48 63 c1             	movslq %ecx,%rax
   2a716:	48 0f af c6          	imul   %rsi,%rax
   2a71a:	48 63 f0             	movslq %eax,%rsi
   2a71d:	48 39 c6             	cmp    %rax,%rsi
   2a720:	0f 85 31 3a 00 00    	jne    2e157 <JS_CallInternal+0x8d07>
   2a726:	48 85 f6             	test   %rsi,%rsi
   2a729:	0f 84 8f 47 00 00    	je     2eebe <JS_CallInternal+0x9a6e>
   2a72f:	83 e0 ff             	and    $0xffffffff,%eax
   2a732:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   2a739:	00 
   2a73a:	48 83 eb 10          	sub    $0x10,%rbx
   2a73e:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2a742:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a747:	49 83 c4 01          	add    $0x1,%r12
   2a74b:	49 89 c2             	mov    %rax,%r10
   2a74e:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a752:	ff e0                	jmp    *%rax
   2a754:	f3 0f 1e fa          	endbr64
   2a758:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2a75c:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   2a760:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   2a764:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2a768:	89 c6                	mov    %eax,%esi
   2a76a:	09 d6                	or     %edx,%esi
   2a76c:	0f 85 52 3c 00 00    	jne    2e3c4 <JS_CallInternal+0x8f74>
   2a772:	89 fa                	mov    %edi,%edx
   2a774:	48 63 f1             	movslq %ecx,%rsi
   2a777:	48 63 c7             	movslq %edi,%rax
   2a77a:	29 ca                	sub    %ecx,%edx
   2a77c:	48 29 f0             	sub    %rsi,%rax
   2a77f:	48 63 ca             	movslq %edx,%rcx
   2a782:	48 39 c1             	cmp    %rax,%rcx
   2a785:	0f 85 1e 3c 00 00    	jne    2e3a9 <JS_CallInternal+0x8f59>
   2a78b:	89 d0                	mov    %edx,%eax
   2a78d:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   2a794:	00 
   2a795:	48 89 43 e0          	mov    %rax,-0x20(%rbx)
   2a799:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a79e:	48 83 eb 10          	sub    $0x10,%rbx
   2a7a2:	49 83 c4 01          	add    $0x1,%r12
   2a7a6:	49 89 c2             	mov    %rax,%r10
   2a7a9:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a7ad:	ff e0                	jmp    *%rax
   2a7af:	f3 0f 1e fa          	endbr64
   2a7b3:	45 0f b6 0c 24       	movzbl (%r12),%r9d
   2a7b8:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2a7bc:	4d 8d 54 24 01       	lea    0x1(%r12),%r10
   2a7c1:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2a7c5:	49 c1 e1 04          	shl    $0x4,%r9
   2a7c9:	4c 03 8d 58 fe ff ff 	add    -0x1a8(%rbp),%r9
   2a7d0:	89 cf                	mov    %ecx,%edi
   2a7d2:	49 8b 41 08          	mov    0x8(%r9),%rax
   2a7d6:	09 c7                	or     %eax,%edi
   2a7d8:	0f 85 7c 40 00 00    	jne    2e85a <JS_CallInternal+0x940a>
   2a7de:	49 8b 01             	mov    (%r9),%rax
   2a7e1:	48 63 f2             	movslq %edx,%rsi
   2a7e4:	48 63 c8             	movslq %eax,%rcx
   2a7e7:	01 d0                	add    %edx,%eax
   2a7e9:	48 01 f1             	add    %rsi,%rcx
   2a7ec:	48 63 d0             	movslq %eax,%rdx
   2a7ef:	48 39 ca             	cmp    %rcx,%rdx
   2a7f2:	0f 85 4a 40 00 00    	jne    2e842 <JS_CallInternal+0x93f2>
   2a7f8:	89 c0                	mov    %eax,%eax
   2a7fa:	49 89 01             	mov    %rax,(%r9)
   2a7fd:	31 c0                	xor    %eax,%eax
   2a7ff:	49 89 41 08          	mov    %rax,0x8(%r9)
   2a803:	48 83 eb 10          	sub    $0x10,%rbx
   2a807:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
   2a80d:	49 83 c4 02          	add    $0x2,%r12
   2a811:	49 89 c2             	mov    %rax,%r10
   2a814:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a818:	ff e0                	jmp    *%rax
   2a81a:	f3 0f 1e fa          	endbr64
   2a81e:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2a822:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   2a826:	48 8b 7b e0          	mov    -0x20(%rbx),%rdi
   2a82a:	48 8b 4b f0          	mov    -0x10(%rbx),%rcx
   2a82e:	89 c6                	mov    %eax,%esi
   2a830:	09 d6                	or     %edx,%esi
   2a832:	0f 85 8c 35 00 00    	jne    2ddc4 <JS_CallInternal+0x8974>
   2a838:	48 63 f1             	movslq %ecx,%rsi
   2a83b:	48 63 c7             	movslq %edi,%rax
   2a83e:	8d 14 39             	lea    (%rcx,%rdi,1),%edx
   2a841:	48 01 f0             	add    %rsi,%rax
   2a844:	48 63 ca             	movslq %edx,%rcx
   2a847:	48 39 c1             	cmp    %rax,%rcx
   2a84a:	0f 85 59 35 00 00    	jne    2dda9 <JS_CallInternal+0x8959>
   2a850:	89 d0                	mov    %edx,%eax
   2a852:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   2a859:	00 
   2a85a:	48 89 43 e0          	mov    %rax,-0x20(%rbx)
   2a85e:	48 83 eb 10          	sub    $0x10,%rbx
   2a862:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a867:	49 83 c4 01          	add    $0x1,%r12
   2a86b:	49 89 c2             	mov    %rax,%r10
   2a86e:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a872:	ff e0                	jmp    *%rax
   2a874:	f3 0f 1e fa          	endbr64
   2a878:	b8 03 00 00 00       	mov    $0x3,%eax
   2a87d:	31 c9                	xor    %ecx,%ecx
   2a87f:	e9 50 b3 ff ff       	jmp    25bd4 <JS_CallInternal+0x784>
   2a884:	f3 0f 1e fa          	endbr64
   2a888:	48 8d 43 e0          	lea    -0x20(%rbx),%rax
   2a88c:	48 8d 4b f0          	lea    -0x10(%rbx),%rcx
   2a890:	4c 8b 5b e0          	mov    -0x20(%rbx),%r11
   2a894:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2a898:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   2a89f:	4c 8b 51 08          	mov    0x8(%rcx),%r10
   2a8a3:	83 7b e8 ff          	cmpl   $0xffffffff,-0x18(%rbx)
   2a8a7:	0f 85 74 43 00 00    	jne    2ec21 <JS_CallInternal+0x97d1>
   2a8ad:	41 83 fa f8          	cmp    $0xfffffff8,%r10d
   2a8b1:	0f 85 4a 3b 00 00    	jne    2e401 <JS_CallInternal+0x8fb1>
   2a8b7:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2a8bb:	48 89 d6             	mov    %rdx,%rsi
   2a8be:	4c 89 9d c0 fd ff ff 	mov    %r11,-0x240(%rbp)
   2a8c5:	48 89 8d d0 fd ff ff 	mov    %rcx,-0x230(%rbp)
   2a8cc:	48 89 bd a8 fd ff ff 	mov    %rdi,-0x258(%rbp)
   2a8d3:	4c 89 95 b0 fd ff ff 	mov    %r10,-0x250(%rbp)
   2a8da:	48 89 95 e8 fd ff ff 	mov    %rdx,-0x218(%rbp)
   2a8e1:	e8 1a d9 fe ff       	call   18200 <js_get_atom_index>
   2a8e6:	4c 8b 9d c0 fd ff ff 	mov    -0x240(%rbp),%r11
   2a8ed:	48 8b 8d d0 fd ff ff 	mov    -0x230(%rbp),%rcx
   2a8f4:	41 89 c0             	mov    %eax,%r8d
   2a8f7:	49 8b 7b 18          	mov    0x18(%r11),%rdi
   2a8fb:	8b 77 18             	mov    0x18(%rdi),%esi
   2a8fe:	21 f0                	and    %esi,%eax
   2a900:	8b 44 87 38          	mov    0x38(%rdi,%rax,4),%eax
   2a904:	48 85 c0             	test   %rax,%rax
   2a907:	0f 84 56 43 00 00    	je     2ec63 <JS_CallInternal+0x9813>
   2a90d:	48 8b 95 e8 fd ff ff 	mov    -0x218(%rbp),%rdx
   2a914:	4c 8b 95 b0 fd ff ff 	mov    -0x250(%rbp),%r10
   2a91b:	4c 8d 0c b5 3c 00 00 	lea    0x3c(,%rsi,4),%r9
   2a922:	00 
   2a923:	48 83 e8 01          	sub    $0x1,%rax
   2a927:	49 8d 34 c1          	lea    (%r9,%rax,8),%rsi
   2a92b:	48 01 fe             	add    %rdi,%rsi
   2a92e:	44 3b 46 04          	cmp    0x4(%rsi),%r8d
   2a932:	0f 85 1e 43 00 00    	jne    2ec56 <JS_CallInternal+0x9806>
   2a938:	48 c1 e0 04          	shl    $0x4,%rax
   2a93c:	49 03 43 20          	add    0x20(%r11),%rax
   2a940:	48 8b 30             	mov    (%rax),%rsi
   2a943:	48 8b 40 08          	mov    0x8(%rax),%rax
   2a947:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2a94a:	76 04                	jbe    2a950 <JS_CallInternal+0x5500>
   2a94c:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2a950:	49 89 f0             	mov    %rsi,%r8
   2a953:	41 89 c1             	mov    %eax,%r9d
   2a956:	41 83 fa f6          	cmp    $0xfffffff6,%r10d
   2a95a:	76 11                	jbe    2a96d <JS_CallInternal+0x551d>
   2a95c:	8b 7a fc             	mov    -0x4(%rdx),%edi
   2a95f:	8d 77 ff             	lea    -0x1(%rdi),%esi
   2a962:	89 72 fc             	mov    %esi,-0x4(%rdx)
   2a965:	85 f6                	test   %esi,%esi
   2a967:	0f 8e b3 31 00 00    	jle    2db20 <JS_CallInternal+0x86d0>
   2a96d:	48 8b bd f0 fd ff ff 	mov    -0x210(%rbp),%rdi
   2a974:	48 8b 77 08          	mov    0x8(%rdi),%rsi
   2a978:	83 fe f6             	cmp    $0xfffffff6,%esi
   2a97b:	76 1b                	jbe    2a998 <JS_CallInternal+0x5548>
   2a97d:	48 8b bd f0 fd ff ff 	mov    -0x210(%rbp),%rdi
   2a984:	48 8b 3f             	mov    (%rdi),%rdi
   2a987:	8b 57 fc             	mov    -0x4(%rdi),%edx
   2a98a:	83 ea 01             	sub    $0x1,%edx
   2a98d:	89 57 fc             	mov    %edx,-0x4(%rdi)
   2a990:	85 d2                	test   %edx,%edx
   2a992:	0f 8e d4 31 00 00    	jle    2db6c <JS_CallInternal+0x871c>
   2a998:	4c 89 43 e0          	mov    %r8,-0x20(%rbx)
   2a99c:	48 89 43 e8          	mov    %rax,-0x18(%rbx)
   2a9a0:	41 83 f9 06          	cmp    $0x6,%r9d
   2a9a4:	0f 84 1f 43 00 00    	je     2ecc9 <JS_CallInternal+0x9879>
   2a9aa:	41 0f b6 04 24       	movzbl (%r12),%eax
   2a9af:	48 89 cb             	mov    %rcx,%rbx
   2a9b2:	49 83 c4 01          	add    $0x1,%r12
   2a9b6:	49 89 c2             	mov    %rax,%r10
   2a9b9:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a9bd:	ff e0                	jmp    *%rax
   2a9bf:	f3 0f 1e fa          	endbr64
   2a9c3:	41 8b 34 24          	mov    (%r12),%esi
   2a9c7:	4c 89 ef             	mov    %r13,%rdi
   2a9ca:	e8 01 c3 00 00       	call   36cd0 <JS_NewSymbolFromAtom.constprop.0>
   2a9cf:	83 fa 06             	cmp    $0x6,%edx
   2a9d2:	0f 84 4e 3f 00 00    	je     2e926 <JS_CallInternal+0x94d6>
   2a9d8:	48 89 03             	mov    %rax,(%rbx)
   2a9db:	49 83 c4 05          	add    $0x5,%r12
   2a9df:	48 83 c3 10          	add    $0x10,%rbx
   2a9e3:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2a9e7:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2a9ed:	49 89 c2             	mov    %rax,%r10
   2a9f0:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2a9f4:	ff e0                	jmp    *%rax
   2a9f6:	f3 0f 1e fa          	endbr64
   2a9fa:	48 8d 43 e0          	lea    -0x20(%rbx),%rax
   2a9fe:	48 8b 38             	mov    (%rax),%rdi
   2aa01:	4c 8d 43 f0          	lea    -0x10(%rbx),%r8
   2aa05:	48 83 eb 30          	sub    $0x30,%rbx
   2aa09:	48 8b 40 08          	mov    0x8(%rax),%rax
   2aa0d:	48 8b 0b             	mov    (%rbx),%rcx
   2aa10:	49 8b 30             	mov    (%r8),%rsi
   2aa13:	49 8b 50 08          	mov    0x8(%r8),%rdx
   2aa17:	48 89 bd f0 fd ff ff 	mov    %rdi,-0x210(%rbp)
   2aa1e:	48 89 85 e8 fd ff ff 	mov    %rax,-0x218(%rbp)
   2aa25:	83 7b 08 ff          	cmpl   $0xffffffff,0x8(%rbx)
   2aa29:	0f 85 3c 39 00 00    	jne    2e36b <JS_CallInternal+0x8f1b>
   2aa2f:	83 fa f8             	cmp    $0xfffffff8,%edx
   2aa32:	0f 85 d6 38 00 00    	jne    2e30e <JS_CallInternal+0x8ebe>
   2aa38:	49 8b 45 10          	mov    0x10(%r13),%rax
   2aa3c:	48 89 8d c0 fd ff ff 	mov    %rcx,-0x240(%rbp)
   2aa43:	4c 89 85 d0 fd ff ff 	mov    %r8,-0x230(%rbp)
   2aa4a:	48 89 c7             	mov    %rax,%rdi
   2aa4d:	48 89 85 b0 fd ff ff 	mov    %rax,-0x250(%rbp)
   2aa54:	e8 a7 d7 fe ff       	call   18200 <js_get_atom_index>
   2aa59:	48 8b 8d c0 fd ff ff 	mov    -0x240(%rbp),%rcx
   2aa60:	4c 8b 85 d0 fd ff ff 	mov    -0x230(%rbp),%r8
   2aa67:	89 c6                	mov    %eax,%esi
   2aa69:	48 8b 79 18          	mov    0x18(%rcx),%rdi
   2aa6d:	8b 57 18             	mov    0x18(%rdi),%edx
   2aa70:	21 d0                	and    %edx,%eax
   2aa72:	8b 44 87 38          	mov    0x38(%rdi,%rax,4),%eax
   2aa76:	48 85 c0             	test   %rax,%rax
   2aa79:	0f 84 cc 45 00 00    	je     2f04b <JS_CallInternal+0x9bfb>
   2aa7f:	4c 8d 0c 95 3c 00 00 	lea    0x3c(,%rdx,4),%r9
   2aa86:	00 
   2aa87:	48 83 e8 01          	sub    $0x1,%rax
   2aa8b:	49 8d 14 c1          	lea    (%r9,%rax,8),%rdx
   2aa8f:	48 01 fa             	add    %rdi,%rdx
   2aa92:	3b 72 04             	cmp    0x4(%rdx),%esi
   2aa95:	0f 85 a3 45 00 00    	jne    2f03e <JS_CallInternal+0x9bee>
   2aa9b:	48 8b bd f0 fd ff ff 	mov    -0x210(%rbp),%rdi
   2aaa2:	48 c1 e0 04          	shl    $0x4,%rax
   2aaa6:	48 03 41 20          	add    0x20(%rcx),%rax
   2aaaa:	48 8b 08             	mov    (%rax),%rcx
   2aaad:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2aab1:	48 89 38             	mov    %rdi,(%rax)
   2aab4:	48 8b bd e8 fd ff ff 	mov    -0x218(%rbp),%rdi
   2aabb:	48 89 78 08          	mov    %rdi,0x8(%rax)
   2aabf:	83 fa f6             	cmp    $0xfffffff6,%edx
   2aac2:	76 11                	jbe    2aad5 <JS_CallInternal+0x5685>
   2aac4:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2aac7:	83 e8 01             	sub    $0x1,%eax
   2aaca:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2aacd:	85 c0                	test   %eax,%eax
   2aacf:	0f 8e 1b 35 00 00    	jle    2dff0 <JS_CallInternal+0x8ba0>
   2aad5:	48 8b 43 08          	mov    0x8(%rbx),%rax
   2aad9:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2aadc:	0f 87 be 1b 00 00    	ja     2c6a0 <JS_CallInternal+0x7250>
   2aae2:	49 8b 40 08          	mov    0x8(%r8),%rax
   2aae6:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2aae9:	76 14                	jbe    2aaff <JS_CallInternal+0x56af>
   2aaeb:	49 8b 10             	mov    (%r8),%rdx
   2aaee:	8b 4a fc             	mov    -0x4(%rdx),%ecx
   2aaf1:	83 e9 01             	sub    $0x1,%ecx
   2aaf4:	89 4a fc             	mov    %ecx,-0x4(%rdx)
   2aaf7:	85 c9                	test   %ecx,%ecx
   2aaf9:	0f 8e e4 30 00 00    	jle    2dbe3 <JS_CallInternal+0x8793>
   2aaff:	41 0f b6 04 24       	movzbl (%r12),%eax
   2ab04:	49 83 c4 01          	add    $0x1,%r12
   2ab08:	49 89 c2             	mov    %rax,%r10
   2ab0b:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2ab0f:	ff e0                	jmp    *%rax
   2ab11:	f3 0f 1e fa          	endbr64
   2ab15:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2ab19:	83 f8 ff             	cmp    $0xffffffff,%eax
   2ab1c:	0f 84 bb 1d 00 00    	je     2c8dd <JS_CallInternal+0x748d>
   2ab22:	83 f8 03             	cmp    $0x3,%eax
   2ab25:	0f 85 55 4f 00 00    	jne    2fa80 <JS_CallInternal+0xa630>
   2ab2b:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   2ab32:	48 c7 43 08 01 00 00 	movq   $0x1,0x8(%rbx)
   2ab39:	00 
   2ab3a:	41 0f b6 04 24       	movzbl (%r12),%eax
   2ab3f:	48 83 c3 10          	add    $0x10,%rbx
   2ab43:	49 83 c4 01          	add    $0x1,%r12
   2ab47:	49 89 c2             	mov    %rax,%r10
   2ab4a:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2ab4e:	ff e0                	jmp    *%rax
   2ab50:	f3 0f 1e fa          	endbr64
   2ab54:	41 0f b6 04 24       	movzbl (%r12),%eax
   2ab59:	48 8b bd 58 fe ff ff 	mov    -0x1a8(%rbp),%rdi
   2ab60:	49 8d 4c 24 01       	lea    0x1(%r12),%rcx
   2ab65:	48 c1 e0 04          	shl    $0x4,%rax
   2ab69:	4c 8d 04 07          	lea    (%rdi,%rax,1),%r8
   2ab6d:	49 8b 50 08          	mov    0x8(%r8),%rdx
   2ab71:	49 8b 00             	mov    (%r8),%rax
   2ab74:	85 d2                	test   %edx,%edx
   2ab76:	0f 85 b8 16 00 00    	jne    2c234 <JS_CallInternal+0x6de4>
   2ab7c:	3d ff ff ff 7f       	cmp    $0x7fffffff,%eax
   2ab81:	0f 84 ad 16 00 00    	je     2c234 <JS_CallInternal+0x6de4>
   2ab87:	83 c0 01             	add    $0x1,%eax
   2ab8a:	49 c7 40 08 00 00 00 	movq   $0x0,0x8(%r8)
   2ab91:	00 
   2ab92:	49 89 00             	mov    %rax,(%r8)
   2ab95:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
   2ab9b:	49 83 c4 02          	add    $0x2,%r12
   2ab9f:	49 89 c2             	mov    %rax,%r10
   2aba2:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2aba6:	ff e0                	jmp    *%rax
   2aba8:	f3 0f 1e fa          	endbr64
   2abac:	44 8b 4b f8          	mov    -0x8(%rbx),%r9d
   2abb0:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2abb4:	45 85 c9             	test   %r9d,%r9d
   2abb7:	0f 85 5e 1a 00 00    	jne    2c61b <JS_CallInternal+0x71cb>
   2abbd:	3d 00 00 00 80       	cmp    $0x80000000,%eax
   2abc2:	0f 84 53 1a 00 00    	je     2c61b <JS_CallInternal+0x71cb>
   2abc8:	83 e8 01             	sub    $0x1,%eax
   2abcb:	48 c7 43 08 00 00 00 	movq   $0x0,0x8(%rbx)
   2abd2:	00 
   2abd3:	48 89 03             	mov    %rax,(%rbx)
   2abd6:	41 0f b6 04 24       	movzbl (%r12),%eax
   2abdb:	48 83 c3 10          	add    $0x10,%rbx
   2abdf:	49 83 c4 01          	add    $0x1,%r12
   2abe3:	49 89 c2             	mov    %rax,%r10
   2abe6:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2abea:	ff e0                	jmp    *%rax
   2abec:	f3 0f 1e fa          	endbr64
   2abf0:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2abf4:	0b 43 e8             	or     -0x18(%rbx),%eax
   2abf7:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   2abfb:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2abff:	75 39                	jne    2ac3a <JS_CallInternal+0x57ea>
   2ac01:	89 c8                	mov    %ecx,%eax
   2ac03:	89 d6                	mov    %edx,%esi
   2ac05:	85 c9                	test   %ecx,%ecx
   2ac07:	78 31                	js     2ac3a <JS_CallInternal+0x57ea>
   2ac09:	85 d2                	test   %edx,%edx
   2ac0b:	7e 2d                	jle    2ac3a <JS_CallInternal+0x57ea>
   2ac0d:	99                   	cltd
   2ac0e:	48 c7 43 e8 00 00 00 	movq   $0x0,-0x18(%rbx)
   2ac15:	00 
   2ac16:	49 83 c4 01          	add    $0x1,%r12
   2ac1a:	48 83 eb 10          	sub    $0x10,%rbx
   2ac1e:	f7 fe                	idiv   %esi
   2ac20:	48 63 d2             	movslq %edx,%rdx
   2ac23:	48 89 53 f0          	mov    %rdx,-0x10(%rbx)
   2ac27:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2ac2d:	49 89 c2             	mov    %rax,%r10
   2ac30:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2ac34:	ff e0                	jmp    *%rax
   2ac36:	f3 0f 1e fa          	endbr64
   2ac3a:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2ac41:	44 89 d2             	mov    %r10d,%edx
   2ac44:	48 89 de             	mov    %rbx,%rsi
   2ac47:	4c 89 ef             	mov    %r13,%rdi
   2ac4a:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2ac4e:	e8 5d ba 02 00       	call   566b0 <js_binary_arith_slow>
   2ac53:	85 c0                	test   %eax,%eax
   2ac55:	0f 85 25 b0 ff ff    	jne    25c80 <JS_CallInternal+0x830>
   2ac5b:	41 0f b6 04 24       	movzbl (%r12),%eax
   2ac60:	48 83 eb 10          	sub    $0x10,%rbx
   2ac64:	49 83 c4 01          	add    $0x1,%r12
   2ac68:	49 89 c2             	mov    %rax,%r10
   2ac6b:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2ac6f:	ff e0                	jmp    *%rax
   2ac71:	f3 0f 1e fa          	endbr64
   2ac75:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2ac79:	0b 43 e8             	or     -0x18(%rbx),%eax
   2ac7c:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   2ac80:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2ac84:	75 b4                	jne    2ac3a <JS_CallInternal+0x57ea>
   2ac86:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2ac8a:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2ac8e:	f2 0f 2a c1          	cvtsi2sd %ecx,%xmm0
   2ac92:	f2 0f 2a ca          	cvtsi2sd %edx,%xmm1
   2ac96:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
   2ac9a:	66 0f 2f 05 ae 47 0b 	comisd 0xb47ae(%rip),%xmm0        # df450 <__PRETTY_FUNCTION__.0+0xc0>
   2aca1:	00 
   2aca2:	66 48 0f 7e c0       	movq   %xmm0,%rax
   2aca7:	0f 82 5f 13 00 00    	jb     2c00c <JS_CallInternal+0x6bbc>
   2acad:	f2 0f 10 0d a3 47 0b 	movsd  0xb47a3(%rip),%xmm1        # df458 <__PRETTY_FUNCTION__.0+0xc8>
   2acb4:	00 
   2acb5:	66 0f 2f c8          	comisd %xmm0,%xmm1
   2acb9:	0f 82 4d 13 00 00    	jb     2c00c <JS_CallInternal+0x6bbc>
   2acbf:	f2 0f 2c c8          	cvttsd2si %xmm0,%ecx
   2acc3:	66 0f ef f6          	pxor   %xmm6,%xmm6
   2acc7:	ba 08 00 00 00       	mov    $0x8,%edx
   2accc:	f2 0f 2a f1          	cvtsi2sd %ecx,%xmm6
   2acd0:	66 48 0f 7e f6       	movq   %xmm6,%rsi
   2acd5:	89 c9                	mov    %ecx,%ecx
   2acd7:	48 39 f0             	cmp    %rsi,%rax
   2acda:	be 00 00 00 00       	mov    $0x0,%esi
   2acdf:	48 0f 44 d6          	cmove  %rsi,%rdx
   2ace3:	48 0f 44 c1          	cmove  %rcx,%rax
   2ace7:	48 89 43 e0          	mov    %rax,-0x20(%rbx)
   2aceb:	49 83 c4 01          	add    $0x1,%r12
   2acef:	48 83 eb 10          	sub    $0x10,%rbx
   2acf3:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2acf7:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2acfd:	49 89 c2             	mov    %rax,%r10
   2ad00:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2ad04:	ff e0                	jmp    *%rax
   2ad06:	f3 0f 1e fa          	endbr64
   2ad0a:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2ad0e:	41 8b 0c 24          	mov    (%r12),%ecx
   2ad12:	4d 8d 54 24 04       	lea    0x4(%r12),%r10
   2ad17:	4c 8b 4b f0          	mov    -0x10(%rbx),%r9
   2ad1b:	83 f8 ff             	cmp    $0xffffffff,%eax
   2ad1e:	0f 85 fc 12 00 00    	jne    2c020 <JS_CallInternal+0x6bd0>
   2ad24:	4c 89 cf             	mov    %r9,%rdi
   2ad27:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   2ad2e:	00 00 
   2ad30:	4c 8b 47 18          	mov    0x18(%rdi),%r8
   2ad34:	41 8b 70 18          	mov    0x18(%r8),%esi
   2ad38:	89 f2                	mov    %esi,%edx
   2ad3a:	21 ca                	and    %ecx,%edx
   2ad3c:	41 8b 54 90 38       	mov    0x38(%r8,%rdx,4),%edx
   2ad41:	48 85 d2             	test   %rdx,%rdx
   2ad44:	0f 84 3c 0d 00 00    	je     2ba86 <JS_CallInternal+0x6636>
   2ad4a:	4c 8d 1c b5 3c 00 00 	lea    0x3c(,%rsi,4),%r11
   2ad51:	00 
   2ad52:	48 83 ea 01          	sub    $0x1,%rdx
   2ad56:	49 8d 34 d3          	lea    (%r11,%rdx,8),%rsi
   2ad5a:	4c 01 c6             	add    %r8,%rsi
   2ad5d:	3b 4e 04             	cmp    0x4(%rsi),%ecx
   2ad60:	0f 85 12 0d 00 00    	jne    2ba78 <JS_CallInternal+0x6628>
   2ad66:	48 8b 7f 20          	mov    0x20(%rdi),%rdi
   2ad6a:	80 7e 03 3f          	cmpb   $0x3f,0x3(%rsi)
   2ad6e:	0f 87 ac 12 00 00    	ja     2c020 <JS_CallInternal+0x6bd0>
   2ad74:	48 c1 e2 04          	shl    $0x4,%rdx
   2ad78:	48 01 d7             	add    %rdx,%rdi
   2ad7b:	48 8b 4f 08          	mov    0x8(%rdi),%rcx
   2ad7f:	48 8b 07             	mov    (%rdi),%rax
   2ad82:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2ad85:	76 04                	jbe    2ad8b <JS_CallInternal+0x593b>
   2ad87:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2ad8b:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   2ad8f:	83 fe f6             	cmp    $0xfffffff6,%esi
   2ad92:	76 15                	jbe    2ada9 <JS_CallInternal+0x5959>
   2ad94:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   2ad98:	8b 57 fc             	mov    -0x4(%rdi),%edx
   2ad9b:	83 ea 01             	sub    $0x1,%edx
   2ad9e:	89 57 fc             	mov    %edx,-0x4(%rdi)
   2ada1:	85 d2                	test   %edx,%edx
   2ada3:	0f 8e 45 28 00 00    	jle    2d5ee <JS_CallInternal+0x819e>
   2ada9:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2adad:	49 83 c4 05          	add    $0x5,%r12
   2adb1:	48 89 4b f8          	mov    %rcx,-0x8(%rbx)
   2adb5:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2adbb:	49 89 c2             	mov    %rax,%r10
   2adbe:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2adc2:	ff e0                	jmp    *%rax
   2adc4:	f3 0f 1e fa          	endbr64
   2adc8:	8b 85 44 fd ff ff    	mov    -0x2bc(%rbp),%eax
   2adce:	48 8b bd 70 fe ff ff 	mov    -0x190(%rbp),%rdi
   2add5:	49 8d 74 24 ff       	lea    -0x1(%r12),%rsi
   2adda:	48 8d 95 c0 fe ff ff 	lea    -0x140(%rbp),%rdx
   2ade1:	48 89 b5 f0 fd ff ff 	mov    %rsi,-0x210(%rbp)
   2ade8:	89 85 cc fe ff ff    	mov    %eax,-0x134(%rbp)
   2adee:	8b 85 40 fd ff ff    	mov    -0x2c0(%rbp),%eax
   2adf4:	89 85 d0 fe ff ff    	mov    %eax,-0x130(%rbp)
   2adfa:	48 8b 85 30 fd ff ff 	mov    -0x2d0(%rbp),%rax
   2ae01:	48 89 85 e0 fe ff ff 	mov    %rax,-0x120(%rbp)
   2ae08:	48 8b 85 38 fd ff ff 	mov    -0x2c8(%rbp),%rax
   2ae0f:	48 89 85 f0 fe ff ff 	mov    %rax,-0x110(%rbp)
   2ae16:	e8 75 db fe ff       	call   18990 <ex_bits_match>
   2ae1b:	8b 8d cc fe ff ff    	mov    -0x134(%rbp),%ecx
   2ae21:	89 8d 44 fd ff ff    	mov    %ecx,-0x2bc(%rbp)
   2ae27:	8b 8d d0 fe ff ff    	mov    -0x130(%rbp),%ecx
   2ae2d:	89 8d 40 fd ff ff    	mov    %ecx,-0x2c0(%rbp)
   2ae33:	48 8b 8d e0 fe ff ff 	mov    -0x120(%rbp),%rcx
   2ae3a:	48 89 8d 30 fd ff ff 	mov    %rcx,-0x2d0(%rbp)
   2ae41:	48 8b 8d f0 fe ff ff 	mov    -0x110(%rbp),%rcx
   2ae48:	48 89 8d 38 fd ff ff 	mov    %rcx,-0x2c8(%rbp)
   2ae4f:	85 c0                	test   %eax,%eax
   2ae51:	0f 84 8b 77 fe ff    	je     125e2 <JS_CallInternal.cold+0x5>
   2ae57:	48 63 85 44 fd ff ff 	movslq -0x2bc(%rbp),%rax
   2ae5e:	8b bd c8 fe ff ff    	mov    -0x138(%rbp),%edi
   2ae64:	48 c1 e0 04          	shl    $0x4,%rax
   2ae68:	85 ff                	test   %edi,%edi
   2ae6a:	0f 84 24 15 00 00    	je     2c394 <JS_CallInternal+0x6f44>
   2ae70:	48 03 85 40 fe ff ff 	add    -0x1c0(%rbp),%rax
   2ae77:	48 8b 08             	mov    (%rax),%rcx
   2ae7a:	48 8b 78 08          	mov    0x8(%rax),%rdi
   2ae7e:	48 63 85 c0 fe ff ff 	movslq -0x140(%rbp),%rax
   2ae85:	4c 8b 9d 58 fe ff ff 	mov    -0x1a8(%rbp),%r11
   2ae8c:	48 89 c2             	mov    %rax,%rdx
   2ae8f:	48 c1 e0 04          	shl    $0x4,%rax
   2ae93:	4c 01 d8             	add    %r11,%rax
   2ae96:	8b 70 08             	mov    0x8(%rax),%esi
   2ae99:	85 f6                	test   %esi,%esi
   2ae9b:	75 17                	jne    2aeb4 <JS_CallInternal+0x5a64>
   2ae9d:	48 63 b5 c4 fe ff ff 	movslq -0x13c(%rbp),%rsi
   2aea4:	48 c1 e6 04          	shl    $0x4,%rsi
   2aea8:	4c 01 de             	add    %r11,%rsi
   2aeab:	0b 7e 08             	or     0x8(%rsi),%edi
   2aeae:	0f 84 a9 40 00 00    	je     2ef5d <JS_CallInternal+0x9b0d>
   2aeb4:	83 ea 3d             	sub    $0x3d,%edx
   2aeb7:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   2aebb:	41 88 54 24 ff       	mov    %dl,-0x1(%r12)
   2aec0:	48 8b 10             	mov    (%rax),%rdx
   2aec3:	48 8b 40 08          	mov    0x8(%rax),%rax
   2aec7:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2aeca:	76 04                	jbe    2aed0 <JS_CallInternal+0x5a80>
   2aecc:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2aed0:	48 89 13             	mov    %rdx,(%rbx)
   2aed3:	49 83 c4 01          	add    $0x1,%r12
   2aed7:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2aedb:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2aee1:	48 89 cb             	mov    %rcx,%rbx
   2aee4:	49 89 c2             	mov    %rax,%r10
   2aee7:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2aeeb:	ff e0                	jmp    *%rax
   2aeed:	f3 0f 1e fa          	endbr64
   2aef1:	45 8b 0c 24          	mov    (%r12),%r9d
   2aef5:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2aef9:	49 8d 4c 24 04       	lea    0x4(%r12),%rcx
   2aefe:	48 89 8d e8 fd ff ff 	mov    %rcx,-0x218(%rbp)
   2af05:	4c 8b 53 f0          	mov    -0x10(%rbx),%r10
   2af09:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   2af10:	4d 01 e1             	add    %r12,%r9
   2af13:	83 f8 ff             	cmp    $0xffffffff,%eax
   2af16:	0f 85 1e 36 00 00    	jne    2e53a <JS_CallInternal+0x90ea>
   2af1c:	41 0f b7 42 12       	movzwl 0x12(%r10),%eax
   2af21:	4d 8b 5a 18          	mov    0x18(%r10),%r11
   2af25:	66 89 85 d0 fd ff ff 	mov    %ax,-0x230(%rbp)
   2af2c:	66 83 f8 01          	cmp    $0x1,%ax
   2af30:	0f 84 fa 1d 00 00    	je     2cd30 <JS_CallInternal+0x78e0>
   2af36:	41 8b 49 14          	mov    0x14(%r9),%ecx
   2af3a:	4c 89 da             	mov    %r11,%rdx
   2af3d:	4c 89 d7             	mov    %r10,%rdi
   2af40:	8b 72 18             	mov    0x18(%rdx),%esi
   2af43:	89 f0                	mov    %esi,%eax
   2af45:	21 c8                	and    %ecx,%eax
   2af47:	8b 44 82 38          	mov    0x38(%rdx,%rax,4),%eax
   2af4b:	48 85 c0             	test   %rax,%rax
   2af4e:	0f 84 c3 0b 00 00    	je     2bb17 <JS_CallInternal+0x66c7>
   2af54:	4c 8d 04 b5 3c 00 00 	lea    0x3c(,%rsi,4),%r8
   2af5b:	00 
   2af5c:	48 83 e8 01          	sub    $0x1,%rax
   2af60:	49 8d 34 c0          	lea    (%r8,%rax,8),%rsi
   2af64:	48 01 d6             	add    %rdx,%rsi
   2af67:	39 4e 04             	cmp    %ecx,0x4(%rsi)
   2af6a:	0f 85 9a 0b 00 00    	jne    2bb0a <JS_CallInternal+0x66ba>
   2af70:	4c 8b 47 20          	mov    0x20(%rdi),%r8
   2af74:	80 7e 03 3f          	cmpb   $0x3f,0x3(%rsi)
   2af78:	0f 87 07 12 00 00    	ja     2c185 <JS_CallInternal+0x6d35>
   2af7e:	48 c1 e0 04          	shl    $0x4,%rax
   2af82:	49 01 c0             	add    %rax,%r8
   2af85:	48 89 c6             	mov    %rax,%rsi
   2af88:	49 8b 40 08          	mov    0x8(%r8),%rax
   2af8c:	49 8b 08             	mov    (%r8),%rcx
   2af8f:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2af92:	76 04                	jbe    2af98 <JS_CallInternal+0x5b48>
   2af94:	83 41 fc 01          	addl   $0x1,-0x4(%rcx)
   2af98:	49 39 fa             	cmp    %rdi,%r10
   2af9b:	0f 84 7e 45 00 00    	je     2f51f <JS_CallInternal+0xa0cf>
   2afa1:	49 39 7b 30          	cmp    %rdi,0x30(%r11)
   2afa5:	0f 84 d7 4f 00 00    	je     2ff82 <JS_CallInternal+0xab32>
   2afab:	48 89 0b             	mov    %rcx,(%rbx)
   2afae:	49 83 c4 05          	add    $0x5,%r12
   2afb2:	48 83 c3 10          	add    $0x10,%rbx
   2afb6:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2afba:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2afc0:	49 89 c2             	mov    %rax,%r10
   2afc3:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2afc7:	ff e0                	jmp    *%rax
   2afc9:	f3 0f 1e fa          	endbr64
   2afcd:	41 8b 04 24          	mov    (%r12),%eax
   2afd1:	4c 8b 5b f8          	mov    -0x8(%rbx),%r11
   2afd5:	49 8d 4c 24 04       	lea    0x4(%r12),%rcx
   2afda:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   2afe1:	4d 8d 14 04          	lea    (%r12,%rax,1),%r10
   2afe5:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2afe9:	41 83 fb ff          	cmp    $0xffffffff,%r11d
   2afed:	0f 85 3e 35 00 00    	jne    2e531 <JS_CallInternal+0x90e1>
   2aff3:	48 8b 78 18          	mov    0x18(%rax),%rdi
   2aff7:	66 83 78 12 01       	cmpw   $0x1,0x12(%rax)
   2affc:	0f 84 e8 1c 00 00    	je     2ccea <JS_CallInternal+0x789a>
   2b002:	41 8b 4a 14          	mov    0x14(%r10),%ecx
   2b006:	49 89 c0             	mov    %rax,%r8
   2b009:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2b010:	8b 77 18             	mov    0x18(%rdi),%esi
   2b013:	89 f2                	mov    %esi,%edx
   2b015:	21 ca                	and    %ecx,%edx
   2b017:	8b 54 97 38          	mov    0x38(%rdi,%rdx,4),%edx
   2b01b:	48 85 d2             	test   %rdx,%rdx
   2b01e:	0f 84 21 0b 00 00    	je     2bb45 <JS_CallInternal+0x66f5>
   2b024:	4c 8d 0c b5 3c 00 00 	lea    0x3c(,%rsi,4),%r9
   2b02b:	00 
   2b02c:	48 83 ea 01          	sub    $0x1,%rdx
   2b030:	49 8d 34 d1          	lea    (%r9,%rdx,8),%rsi
   2b034:	48 01 fe             	add    %rdi,%rsi
   2b037:	39 4e 04             	cmp    %ecx,0x4(%rsi)
   2b03a:	0f 85 f7 0a 00 00    	jne    2bb37 <JS_CallInternal+0x66e7>
   2b040:	4d 8b 48 20          	mov    0x20(%r8),%r9
   2b044:	80 7e 03 3f          	cmpb   $0x3f,0x3(%rsi)
   2b048:	0f 87 95 11 00 00    	ja     2c1e3 <JS_CallInternal+0x6d93>
   2b04e:	48 c1 e2 04          	shl    $0x4,%rdx
   2b052:	49 01 d1             	add    %rdx,%r9
   2b055:	49 8b 49 08          	mov    0x8(%r9),%rcx
   2b059:	49 8b 31             	mov    (%r9),%rsi
   2b05c:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2b05f:	76 04                	jbe    2b065 <JS_CallInternal+0x5c15>
   2b061:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2b065:	49 89 f1             	mov    %rsi,%r9
   2b068:	4c 39 c0             	cmp    %r8,%rax
   2b06b:	0f 84 5f 45 00 00    	je     2f5d0 <JS_CallInternal+0xa180>
   2b071:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2b075:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2b078:	76 15                	jbe    2b08f <JS_CallInternal+0x5c3f>
   2b07a:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2b07e:	8b 7e fc             	mov    -0x4(%rsi),%edi
   2b081:	8d 57 ff             	lea    -0x1(%rdi),%edx
   2b084:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2b087:	85 d2                	test   %edx,%edx
   2b089:	0f 8e a6 29 00 00    	jle    2da35 <JS_CallInternal+0x85e5>
   2b08f:	4c 89 4b f0          	mov    %r9,-0x10(%rbx)
   2b093:	49 83 c4 05          	add    $0x5,%r12
   2b097:	48 89 4b f8          	mov    %rcx,-0x8(%rbx)
   2b09b:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2b0a1:	49 89 c2             	mov    %rax,%r10
   2b0a4:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b0a8:	ff e0                	jmp    *%rax
   2b0aa:	f3 0f 1e fa          	endbr64
   2b0ae:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2b0b2:	41 8b 0c 24          	mov    (%r12),%ecx
   2b0b6:	4d 8d 54 24 04       	lea    0x4(%r12),%r10
   2b0bb:	4c 8b 4b f0          	mov    -0x10(%rbx),%r9
   2b0bf:	83 f8 ff             	cmp    $0xffffffff,%eax
   2b0c2:	0f 85 67 10 00 00    	jne    2c12f <JS_CallInternal+0x6cdf>
   2b0c8:	4c 89 cf             	mov    %r9,%rdi
   2b0cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2b0d0:	4c 8b 47 18          	mov    0x18(%rdi),%r8
   2b0d4:	41 8b 70 18          	mov    0x18(%r8),%esi
   2b0d8:	89 f2                	mov    %esi,%edx
   2b0da:	21 ca                	and    %ecx,%edx
   2b0dc:	41 8b 54 90 38       	mov    0x38(%r8,%rdx,4),%edx
   2b0e1:	48 85 d2             	test   %rdx,%rdx
   2b0e4:	0f 84 fd 09 00 00    	je     2bae7 <JS_CallInternal+0x6697>
   2b0ea:	4c 8d 1c b5 3c 00 00 	lea    0x3c(,%rsi,4),%r11
   2b0f1:	00 
   2b0f2:	48 83 ea 01          	sub    $0x1,%rdx
   2b0f6:	49 8d 34 d3          	lea    (%r11,%rdx,8),%rsi
   2b0fa:	4c 01 c6             	add    %r8,%rsi
   2b0fd:	3b 4e 04             	cmp    0x4(%rsi),%ecx
   2b100:	0f 85 d3 09 00 00    	jne    2bad9 <JS_CallInternal+0x6689>
   2b106:	48 8b 7f 20          	mov    0x20(%rdi),%rdi
   2b10a:	80 7e 03 3f          	cmpb   $0x3f,0x3(%rsi)
   2b10e:	0f 87 1b 10 00 00    	ja     2c12f <JS_CallInternal+0x6cdf>
   2b114:	48 c1 e2 04          	shl    $0x4,%rdx
   2b118:	48 01 d7             	add    %rdx,%rdi
   2b11b:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   2b11f:	48 8b 07             	mov    (%rdi),%rax
   2b122:	83 fa f6             	cmp    $0xfffffff6,%edx
   2b125:	76 04                	jbe    2b12b <JS_CallInternal+0x5cdb>
   2b127:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2b12b:	48 89 03             	mov    %rax,(%rbx)
   2b12e:	49 83 c4 05          	add    $0x5,%r12
   2b132:	48 83 c3 10          	add    $0x10,%rbx
   2b136:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2b13a:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2b140:	49 89 c2             	mov    %rax,%r10
   2b143:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b147:	ff e0                	jmp    *%rax
   2b149:	f3 0f 1e fa          	endbr64
   2b14d:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   2b151:	4c 8d 43 e0          	lea    -0x20(%rbx),%r8
   2b155:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   2b159:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2b15c:	76 11                	jbe    2b16f <JS_CallInternal+0x5d1f>
   2b15e:	8b 79 fc             	mov    -0x4(%rcx),%edi
   2b161:	8d 57 ff             	lea    -0x1(%rdi),%edx
   2b164:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2b167:	85 d2                	test   %edx,%edx
   2b169:	0f 8e 29 29 00 00    	jle    2da98 <JS_CallInternal+0x8648>
   2b16f:	4c 8d 5b d0          	lea    -0x30(%rbx),%r11
   2b173:	83 7b d8 03          	cmpl   $0x3,-0x28(%rbx)
   2b177:	74 58                	je     2b1d1 <JS_CallInternal+0x5d81>
   2b179:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2b180:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   2b184:	31 c9                	xor    %ecx,%ecx
   2b186:	4c 89 ef             	mov    %r13,%rdi
   2b189:	49 8b 53 08          	mov    0x8(%r11),%rdx
   2b18d:	4c 89 9d f0 fd ff ff 	mov    %r11,-0x210(%rbp)
   2b194:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2b198:	4c 89 85 e8 fd ff ff 	mov    %r8,-0x218(%rbp)
   2b19f:	e8 ac 9e 06 00       	call   95050 <JS_IteratorClose>
   2b1a4:	85 c0                	test   %eax,%eax
   2b1a6:	0f 85 a7 51 00 00    	jne    30353 <JS_CallInternal+0xaf03>
   2b1ac:	4c 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%r11
   2b1b3:	49 8b 43 08          	mov    0x8(%r11),%rax
   2b1b7:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2b1ba:	76 15                	jbe    2b1d1 <JS_CallInternal+0x5d81>
   2b1bc:	48 8b 4b d0          	mov    -0x30(%rbx),%rcx
   2b1c0:	8b 59 fc             	mov    -0x4(%rcx),%ebx
   2b1c3:	8d 53 ff             	lea    -0x1(%rbx),%edx
   2b1c6:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2b1c9:	85 d2                	test   %edx,%edx
   2b1cb:	0f 8e f2 44 00 00    	jle    2f6c3 <JS_CallInternal+0xa273>
   2b1d1:	41 0f b6 04 24       	movzbl (%r12),%eax
   2b1d6:	4c 89 db             	mov    %r11,%rbx
   2b1d9:	49 83 c4 01          	add    $0x1,%r12
   2b1dd:	49 89 c2             	mov    %rax,%r10
   2b1e0:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b1e4:	ff e0                	jmp    *%rax
   2b1e6:	f3 0f 1e fa          	endbr64
   2b1ea:	83 7b f8 ff          	cmpl   $0xffffffff,-0x8(%rbx)
   2b1ee:	0f 85 4f 33 00 00    	jne    2e543 <JS_CallInternal+0x90f3>
   2b1f4:	41 0f b6 04 24       	movzbl (%r12),%eax
   2b1f9:	49 83 c4 01          	add    $0x1,%r12
   2b1fd:	49 89 c2             	mov    %rax,%r10
   2b200:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b204:	ff e0                	jmp    *%rax
   2b206:	f3 0f 1e fa          	endbr64
   2b20a:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2b211:	4c 8b 43 f8          	mov    -0x8(%rbx),%r8
   2b215:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2b219:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2b21d:	41 83 f8 ff          	cmp    $0xffffffff,%r8d
   2b221:	0f 85 43 48 00 00    	jne    2fa6a <JS_CallInternal+0xa61a>
   2b227:	48 8d 8d 9c fe ff ff 	lea    -0x164(%rbp),%rcx
   2b22e:	4c 89 c2             	mov    %r8,%rdx
   2b231:	48 89 c6             	mov    %rax,%rsi
   2b234:	4c 89 ef             	mov    %r13,%rdi
   2b237:	4c 89 85 e8 fd ff ff 	mov    %r8,-0x218(%rbp)
   2b23e:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   2b245:	e8 d6 be 05 00       	call   87120 <JS_IteratorGetCompleteValue>
   2b24a:	48 89 c1             	mov    %rax,%rcx
   2b24d:	48 89 d0             	mov    %rdx,%rax
   2b250:	83 fa 06             	cmp    $0x6,%edx
   2b253:	0f 84 27 aa ff ff    	je     25c80 <JS_CallInternal+0x830>
   2b259:	48 8b b5 f0 fd ff ff 	mov    -0x210(%rbp),%rsi
   2b260:	8b 7e fc             	mov    -0x4(%rsi),%edi
   2b263:	8d 57 ff             	lea    -0x1(%rdi),%edx
   2b266:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2b269:	85 d2                	test   %edx,%edx
   2b26b:	0f 8e 3e 2f 00 00    	jle    2e1af <JS_CallInternal+0x8d5f>
   2b271:	8b 95 9c fe ff ff    	mov    -0x164(%rbp),%edx
   2b277:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2b27b:	31 c0                	xor    %eax,%eax
   2b27d:	48 c7 43 e0 00 00 00 	movq   $0x0,-0x20(%rbx)
   2b284:	00 
   2b285:	85 d2                	test   %edx,%edx
   2b287:	48 c7 43 e8 05 00 00 	movq   $0x5,-0x18(%rbx)
   2b28e:	00 
   2b28f:	0f 95 c0             	setne  %al
   2b292:	48 89 4b f0          	mov    %rcx,-0x10(%rbx)
   2b296:	49 83 c4 01          	add    $0x1,%r12
   2b29a:	48 83 c3 10          	add    $0x10,%rbx
   2b29e:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2b2a2:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   2b2a9:	00 
   2b2aa:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2b2b0:	49 89 c2             	mov    %rax,%r10
   2b2b3:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b2b7:	ff e0                	jmp    *%rax
   2b2b9:	f3 0f 1e fa          	endbr64
   2b2bd:	8b 4b f8             	mov    -0x8(%rbx),%ecx
   2b2c0:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2b2c4:	85 c9                	test   %ecx,%ecx
   2b2c6:	0f 85 a4 13 00 00    	jne    2c670 <JS_CallInternal+0x7220>
   2b2cc:	3d ff ff ff 7f       	cmp    $0x7fffffff,%eax
   2b2d1:	0f 84 99 13 00 00    	je     2c670 <JS_CallInternal+0x7220>
   2b2d7:	83 c0 01             	add    $0x1,%eax
   2b2da:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   2b2e1:	00 
   2b2e2:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2b2e6:	41 0f b6 04 24       	movzbl (%r12),%eax
   2b2eb:	49 83 c4 01          	add    $0x1,%r12
   2b2ef:	49 89 c2             	mov    %rax,%r10
   2b2f2:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b2f6:	ff e0                	jmp    *%rax
   2b2f8:	f3 0f 1e fa          	endbr64
   2b2fc:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2b300:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2b304:	83 fa 02             	cmp    $0x2,%edx
   2b307:	0f 87 5f 10 00 00    	ja     2c36c <JS_CallInternal+0x6f1c>
   2b30d:	85 c0                	test   %eax,%eax
   2b30f:	0f 84 fd 41 00 00    	je     2f512 <JS_CallInternal+0xa0c2>
   2b315:	3d 00 00 00 80       	cmp    $0x80000000,%eax
   2b31a:	0f 84 e5 41 00 00    	je     2f505 <JS_CallInternal+0xa0b5>
   2b320:	f7 d8                	neg    %eax
   2b322:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   2b329:	00 
   2b32a:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2b32e:	41 0f b6 04 24       	movzbl (%r12),%eax
   2b333:	49 83 c4 01          	add    $0x1,%r12
   2b337:	49 89 c2             	mov    %rax,%r10
   2b33a:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b33e:	ff e0                	jmp    *%rax
   2b340:	f3 0f 1e fa          	endbr64
   2b344:	41 8b 85 a8 01 00 00 	mov    0x1a8(%r13),%eax
   2b34b:	49 63 14 24          	movslq (%r12),%rdx
   2b34f:	83 e8 01             	sub    $0x1,%eax
   2b352:	4c 01 e2             	add    %r12,%rdx
   2b355:	41 89 85 a8 01 00 00 	mov    %eax,0x1a8(%r13)
   2b35c:	85 c0                	test   %eax,%eax
   2b35e:	0f 8e 5e 32 00 00    	jle    2e5c2 <JS_CallInternal+0x9172>
   2b364:	0f b6 02             	movzbl (%rdx),%eax
   2b367:	4c 8d 62 01          	lea    0x1(%rdx),%r12
   2b36b:	49 89 c2             	mov    %rax,%r10
   2b36e:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2b372:	f3 0f 1e fa          	endbr64
   2b376:	41 8b 85 a8 01 00 00 	mov    0x1a8(%r13),%eax
   2b37d:	49 0f bf 14 24       	movswq (%r12),%rdx
   2b382:	83 e8 01             	sub    $0x1,%eax
   2b385:	4c 01 e2             	add    %r12,%rdx
   2b388:	41 89 85 a8 01 00 00 	mov    %eax,0x1a8(%r13)
   2b38f:	85 c0                	test   %eax,%eax
   2b391:	0f 8e 64 38 00 00    	jle    2ebfb <JS_CallInternal+0x97ab>
   2b397:	0f b6 02             	movzbl (%rdx),%eax
   2b39a:	4c 8d 62 01          	lea    0x1(%rdx),%r12
   2b39e:	49 89 c2             	mov    %rax,%r10
   2b3a1:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2b3a5:	f3 0f 1e fa          	endbr64
   2b3a9:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2b3b0:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2b3b4:	4c 89 ef             	mov    %r13,%rdi
   2b3b7:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2b3bb:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2b3bf:	e8 cc 4e 04 00       	call   70290 <build_for_in_iterator>
   2b3c4:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2b3c8:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2b3cc:	83 7b f8 06          	cmpl   $0x6,-0x8(%rbx)
   2b3d0:	0f 84 aa a8 ff ff    	je     25c80 <JS_CallInternal+0x830>
   2b3d6:	41 0f b6 04 24       	movzbl (%r12),%eax
   2b3db:	49 83 c4 01          	add    $0x1,%r12
   2b3df:	49 89 c2             	mov    %rax,%r10
   2b3e2:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b3e6:	ff e0                	jmp    *%rax
   2b3e8:	f3 0f 1e fa          	endbr64
   2b3ec:	41 0f b7 04 24       	movzwl (%r12),%eax
   2b3f1:	48 89 c1             	mov    %rax,%rcx
   2b3f4:	48 c1 e0 04          	shl    $0x4,%rax
   2b3f8:	48 03 85 58 fe ff ff 	add    -0x1a8(%rbp),%rax
   2b3ff:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2b403:	83 fa 04             	cmp    $0x4,%edx
   2b406:	0f 84 73 31 00 00    	je     2e57f <JS_CallInternal+0x912f>
   2b40c:	48 8b 4b f8          	mov    -0x8(%rbx),%rcx
   2b410:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2b414:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2b417:	76 04                	jbe    2b41d <JS_CallInternal+0x5fcd>
   2b419:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2b41d:	48 8b 38             	mov    (%rax),%rdi
   2b420:	48 89 48 08          	mov    %rcx,0x8(%rax)
   2b424:	48 89 30             	mov    %rsi,(%rax)
   2b427:	83 fa f6             	cmp    $0xfffffff6,%edx
   2b42a:	76 11                	jbe    2b43d <JS_CallInternal+0x5fed>
   2b42c:	8b 47 fc             	mov    -0x4(%rdi),%eax
   2b42f:	83 e8 01             	sub    $0x1,%eax
   2b432:	89 47 fc             	mov    %eax,-0x4(%rdi)
   2b435:	85 c0                	test   %eax,%eax
   2b437:	0f 8e 36 26 00 00    	jle    2da73 <JS_CallInternal+0x8623>
   2b43d:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   2b443:	49 83 c4 03          	add    $0x3,%r12
   2b447:	49 89 c2             	mov    %rax,%r10
   2b44a:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b44e:	ff e0                	jmp    *%rax
   2b450:	f3 0f 1e fa          	endbr64
   2b454:	41 0f b7 04 24       	movzwl (%r12),%eax
   2b459:	48 89 c1             	mov    %rax,%rcx
   2b45c:	48 c1 e0 04          	shl    $0x4,%rax
   2b460:	48 03 85 58 fe ff ff 	add    -0x1a8(%rbp),%rax
   2b467:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2b46b:	83 fa 04             	cmp    $0x4,%edx
   2b46e:	0f 84 18 2f 00 00    	je     2e38c <JS_CallInternal+0x8f3c>
   2b474:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2b479:	48 8b 08             	mov    (%rax),%rcx
   2b47c:	0f 11 00             	movups %xmm0,(%rax)
   2b47f:	83 fa f6             	cmp    $0xfffffff6,%edx
   2b482:	76 11                	jbe    2b495 <JS_CallInternal+0x6045>
   2b484:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2b487:	83 e8 01             	sub    $0x1,%eax
   2b48a:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2b48d:	85 c0                	test   %eax,%eax
   2b48f:	0f 8e c0 22 00 00    	jle    2d755 <JS_CallInternal+0x8305>
   2b495:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   2b49b:	48 83 eb 10          	sub    $0x10,%rbx
   2b49f:	49 83 c4 03          	add    $0x3,%r12
   2b4a3:	49 89 c2             	mov    %rax,%r10
   2b4a6:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b4aa:	ff e0                	jmp    *%rax
   2b4ac:	f3 0f 1e fa          	endbr64
   2b4b0:	49 8b b5 90 01 00 00 	mov    0x190(%r13),%rsi
   2b4b7:	41 8b 0c 24          	mov    (%r12),%ecx
   2b4bb:	4d 8d 44 24 04       	lea    0x4(%r12),%r8
   2b4c0:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2b4c7:	48 8b 7e 18          	mov    0x18(%rsi),%rdi
   2b4cb:	4c 89 40 30          	mov    %r8,0x30(%rax)
   2b4cf:	89 c8                	mov    %ecx,%eax
   2b4d1:	8b 57 18             	mov    0x18(%rdi),%edx
   2b4d4:	21 d0                	and    %edx,%eax
   2b4d6:	8b 44 87 38          	mov    0x38(%rdi,%rax,4),%eax
   2b4da:	48 85 c0             	test   %rax,%rax
   2b4dd:	0f 84 8e 1f 00 00    	je     2d471 <JS_CallInternal+0x8021>
   2b4e3:	4c 8d 0c 95 3c 00 00 	lea    0x3c(,%rdx,4),%r9
   2b4ea:	00 
   2b4eb:	48 83 e8 01          	sub    $0x1,%rax
   2b4ef:	49 8d 14 c1          	lea    (%r9,%rax,8),%rdx
   2b4f3:	48 01 fa             	add    %rdi,%rdx
   2b4f6:	3b 4a 04             	cmp    0x4(%rdx),%ecx
   2b4f9:	0f 85 65 1f 00 00    	jne    2d464 <JS_CallInternal+0x8014>
   2b4ff:	48 c1 e0 04          	shl    $0x4,%rax
   2b503:	48 03 46 20          	add    0x20(%rsi),%rax
   2b507:	48 8b 00             	mov    (%rax),%rax
   2b50a:	48 8b 40 18          	mov    0x18(%rax),%rax
   2b50e:	83 78 08 04          	cmpl   $0x4,0x8(%rax)
   2b512:	0f 84 b8 38 00 00    	je     2edd0 <JS_CallInternal+0x9980>
   2b518:	f6 42 03 08          	testb  $0x8,0x3(%rdx)
   2b51c:	0f 84 78 38 00 00    	je     2ed9a <JS_CallInternal+0x994a>
   2b522:	49 8b 85 98 01 00 00 	mov    0x198(%r13),%rax
   2b529:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2b52c:	76 04                	jbe    2b532 <JS_CallInternal+0x60e2>
   2b52e:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2b532:	48 89 33             	mov    %rsi,(%rbx)
   2b535:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2b539:	31 d2                	xor    %edx,%edx
   2b53b:	89 ce                	mov    %ecx,%esi
   2b53d:	4c 89 ef             	mov    %r13,%rdi
   2b540:	48 83 c3 20          	add    $0x20,%rbx
   2b544:	e8 f7 0b 01 00       	call   3c140 <__JS_AtomToValue>
   2b549:	49 83 c4 05          	add    $0x5,%r12
   2b54d:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2b551:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2b555:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2b55b:	49 89 c2             	mov    %rax,%r10
   2b55e:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b562:	ff e0                	jmp    *%rax
   2b564:	f3 0f 1e fa          	endbr64
   2b568:	48 8b 8d 70 fe ff ff 	mov    -0x190(%rbp),%rcx
   2b56f:	41 0f b7 04 24       	movzwl (%r12),%eax
   2b574:	48 8b b5 80 fe ff ff 	mov    -0x180(%rbp),%rsi
   2b57b:	0f b7 51 38          	movzwl 0x38(%rcx),%edx
   2b57f:	48 8b 79 28          	mov    0x28(%rcx),%rdi
   2b583:	48 8b 4e 28          	mov    0x28(%rsi),%rcx
   2b587:	01 d0                	add    %edx,%eax
   2b589:	48 98                	cltq
   2b58b:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
   2b58f:	48 8d 04 87          	lea    (%rdi,%rax,4),%rax
   2b593:	0f b7 40 0a          	movzwl 0xa(%rax),%eax
   2b597:	48 c1 e0 03          	shl    $0x3,%rax
   2b59b:	48 01 c1             	add    %rax,%rcx
   2b59e:	48 8b 11             	mov    (%rcx),%rdx
   2b5a1:	48 85 d2             	test   %rdx,%rdx
   2b5a4:	74 47                	je     2b5ed <JS_CallInternal+0x619d>
   2b5a6:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2b5aa:	f6 46 3c 04          	testb  $0x4,0x3c(%rsi)
   2b5ae:	0f 85 52 1e 00 00    	jne    2d406 <JS_CallInternal+0x7fb6>
   2b5b4:	48 8b 72 18          	mov    0x18(%rdx),%rsi
   2b5b8:	48 8b 06             	mov    (%rsi),%rax
   2b5bb:	48 8b 76 08          	mov    0x8(%rsi),%rsi
   2b5bf:	83 fe f6             	cmp    $0xfffffff6,%esi
   2b5c2:	76 04                	jbe    2b5c8 <JS_CallInternal+0x6178>
   2b5c4:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2b5c8:	48 8d 7a 20          	lea    0x20(%rdx),%rdi
   2b5cc:	66 48 0f 6e e8       	movq   %rax,%xmm5
   2b5d1:	48 89 72 28          	mov    %rsi,0x28(%rdx)
   2b5d5:	66 48 0f 6e c7       	movq   %rdi,%xmm0
   2b5da:	c6 42 10 01          	movb   $0x1,0x10(%rdx)
   2b5de:	66 0f 6c c5          	punpcklqdq %xmm5,%xmm0
   2b5e2:	0f 11 42 18          	movups %xmm0,0x18(%rdx)
   2b5e6:	48 c7 01 00 00 00 00 	movq   $0x0,(%rcx)
   2b5ed:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
   2b5f3:	49 83 c4 03          	add    $0x3,%r12
   2b5f7:	49 89 c2             	mov    %rax,%r10
   2b5fa:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b5fe:	ff e0                	jmp    *%rax
   2b600:	f3 0f 1e fa          	endbr64
   2b604:	41 0f b7 04 24       	movzwl (%r12),%eax
   2b609:	48 c1 e0 04          	shl    $0x4,%rax
   2b60d:	48 03 85 58 fe ff ff 	add    -0x1a8(%rbp),%rax
   2b614:	83 78 08 04          	cmpl   $0x4,0x8(%rax)
   2b618:	0f 85 ca 2f 00 00    	jne    2e5e8 <JS_CallInternal+0x9198>
   2b61e:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2b623:	49 83 c4 03          	add    $0x3,%r12
   2b627:	48 83 eb 10          	sub    $0x10,%rbx
   2b62b:	0f 11 00             	movups %xmm0,(%rax)
   2b62e:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2b634:	49 89 c2             	mov    %rax,%r10
   2b637:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b63b:	ff e0                	jmp    *%rax
   2b63d:	f3 0f 1e fa          	endbr64
   2b641:	e9 7a a3 ff ff       	jmp    259c0 <JS_CallInternal+0x570>
   2b646:	f3 0f 1e fa          	endbr64
   2b64a:	41 0f b7 04 24       	movzwl (%r12),%eax
   2b64f:	48 89 c1             	mov    %rax,%rcx
   2b652:	48 c1 e0 04          	shl    $0x4,%rax
   2b656:	48 03 85 58 fe ff ff 	add    -0x1a8(%rbp),%rax
   2b65d:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2b661:	83 fa 04             	cmp    $0x4,%edx
   2b664:	0f 84 79 2b 00 00    	je     2e1e3 <JS_CallInternal+0x8d93>
   2b66a:	48 8b 00             	mov    (%rax),%rax
   2b66d:	83 fa f6             	cmp    $0xfffffff6,%edx
   2b670:	76 04                	jbe    2b676 <JS_CallInternal+0x6226>
   2b672:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2b676:	48 89 03             	mov    %rax,(%rbx)
   2b679:	49 83 c4 03          	add    $0x3,%r12
   2b67d:	48 83 c3 10          	add    $0x10,%rbx
   2b681:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2b685:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2b68b:	49 89 c2             	mov    %rax,%r10
   2b68e:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b692:	ff e0                	jmp    *%rax
   2b694:	f3 0f 1e fa          	endbr64
   2b698:	41 0f b7 04 24       	movzwl (%r12),%eax
   2b69d:	48 89 c1             	mov    %rax,%rcx
   2b6a0:	48 c1 e0 04          	shl    $0x4,%rax
   2b6a4:	48 03 85 58 fe ff ff 	add    -0x1a8(%rbp),%rax
   2b6ab:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2b6af:	83 fa 04             	cmp    $0x4,%edx
   2b6b2:	0f 84 39 2c 00 00    	je     2e2f1 <JS_CallInternal+0x8ea1>
   2b6b8:	48 8b 00             	mov    (%rax),%rax
   2b6bb:	83 fa f6             	cmp    $0xfffffff6,%edx
   2b6be:	76 04                	jbe    2b6c4 <JS_CallInternal+0x6274>
   2b6c0:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2b6c4:	48 89 03             	mov    %rax,(%rbx)
   2b6c7:	49 83 c4 03          	add    $0x3,%r12
   2b6cb:	48 83 c3 10          	add    $0x10,%rbx
   2b6cf:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2b6d3:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2b6d9:	49 89 c2             	mov    %rax,%r10
   2b6dc:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b6e0:	ff e0                	jmp    *%rax
   2b6e2:	f3 0f 1e fa          	endbr64
   2b6e6:	4c 8d 53 f0          	lea    -0x10(%rbx),%r10
   2b6ea:	48 8b 4b c0          	mov    -0x40(%rbx),%rcx
   2b6ee:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   2b6f2:	4c 89 ef             	mov    %r13,%rdi
   2b6f5:	48 8b 53 d8          	mov    -0x28(%rbx),%rdx
   2b6f9:	4c 8b 43 c8          	mov    -0x38(%rbx),%r8
   2b6fd:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   2b703:	48 c7 85 90 fd ff ff 	movq   $0x0,-0x270(%rbp)
   2b70a:	00 00 00 00 
   2b70e:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2b715:	48 c7 85 98 fd ff ff 	movq   $0x3,-0x268(%rbp)
   2b71c:	03 00 00 00 
   2b720:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2b724:	6a 02                	push   $0x2
   2b726:	41 52                	push   %r10
   2b728:	4c 89 95 f0 fd ff ff 	mov    %r10,-0x210(%rbp)
   2b72f:	ff b5 98 fd ff ff    	push   -0x268(%rbp)
   2b735:	ff b5 90 fd ff ff    	push   -0x270(%rbp)
   2b73b:	e8 10 9d ff ff       	call   25450 <JS_CallInternal>
   2b740:	48 83 c4 20          	add    $0x20,%rsp
   2b744:	48 89 c1             	mov    %rax,%rcx
   2b747:	48 89 d0             	mov    %rdx,%rax
   2b74a:	83 fa 06             	cmp    $0x6,%edx
   2b74d:	0f 84 2d a5 ff ff    	je     25c80 <JS_CallInternal+0x830>
   2b753:	4c 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%r10
   2b75a:	49 8b 72 08          	mov    0x8(%r10),%rsi
   2b75e:	83 fe f6             	cmp    $0xfffffff6,%esi
   2b761:	76 15                	jbe    2b778 <JS_CallInternal+0x6328>
   2b763:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   2b767:	8b 57 fc             	mov    -0x4(%rdi),%edx
   2b76a:	83 ea 01             	sub    $0x1,%edx
   2b76d:	89 57 fc             	mov    %edx,-0x4(%rdi)
   2b770:	85 d2                	test   %edx,%edx
   2b772:	0f 8e 78 23 00 00    	jle    2daf0 <JS_CallInternal+0x86a0>
   2b778:	48 89 4b f0          	mov    %rcx,-0x10(%rbx)
   2b77c:	49 83 c4 01          	add    $0x1,%r12
   2b780:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2b784:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2b78a:	49 89 c2             	mov    %rax,%r10
   2b78d:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b791:	ff e0                	jmp    *%rax
   2b793:	f3 0f 1e fa          	endbr64
   2b797:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2b79b:	48 8d 4b f0          	lea    -0x10(%rbx),%rcx
   2b79f:	48 8b 5b f8          	mov    -0x8(%rbx),%rbx
   2b7a3:	48 39 8d 08 fe ff ff 	cmp    %rcx,-0x1f8(%rbp)
   2b7aa:	0f 83 bc 05 00 00    	jae    2bd6c <JS_CallInternal+0x691c>
   2b7b0:	4c 89 a5 e8 fd ff ff 	mov    %r12,-0x218(%rbp)
   2b7b7:	4c 8b a5 08 fe ff ff 	mov    -0x1f8(%rbp),%r12
   2b7be:	4c 89 85 d0 fd ff ff 	mov    %r8,-0x230(%rbp)
   2b7c5:	4d 89 e8             	mov    %r13,%r8
   2b7c8:	49 89 dd             	mov    %rbx,%r13
   2b7cb:	48 89 cb             	mov    %rcx,%rbx
   2b7ce:	eb 09                	jmp    2b7d9 <JS_CallInternal+0x6389>
   2b7d0:	49 39 dc             	cmp    %rbx,%r12
   2b7d3:	0f 83 7c 05 00 00    	jae    2bd55 <JS_CallInternal+0x6905>
   2b7d9:	83 7b f8 05          	cmpl   $0x5,-0x8(%rbx)
   2b7dd:	0f 84 72 05 00 00    	je     2bd55 <JS_CallInternal+0x6905>
   2b7e3:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2b7e7:	48 83 eb 10          	sub    $0x10,%rbx
   2b7eb:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2b7ee:	76 e0                	jbe    2b7d0 <JS_CallInternal+0x6380>
   2b7f0:	48 8b 33             	mov    (%rbx),%rsi
   2b7f3:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   2b7f6:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2b7f9:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2b7fc:	85 d2                	test   %edx,%edx
   2b7fe:	7f d0                	jg     2b7d0 <JS_CallInternal+0x6380>
   2b800:	49 8b 78 10          	mov    0x10(%r8),%rdi
   2b804:	48 89 c2             	mov    %rax,%rdx
   2b807:	4c 89 85 f0 fd ff ff 	mov    %r8,-0x210(%rbp)
   2b80e:	e8 8d 31 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2b813:	4c 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8
   2b81a:	eb b4                	jmp    2b7d0 <JS_CallInternal+0x6380>
   2b81c:	f3 0f 1e fa          	endbr64
   2b820:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2b827:	ba 01 00 00 00       	mov    $0x1,%edx
   2b82c:	48 89 de             	mov    %rbx,%rsi
   2b82f:	4c 89 ef             	mov    %r13,%rdi
   2b832:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2b836:	e8 75 48 07 00       	call   a00b0 <js_for_of_start>
   2b83b:	85 c0                	test   %eax,%eax
   2b83d:	0f 85 3d a4 ff ff    	jne    25c80 <JS_CallInternal+0x830>
   2b843:	48 c7 43 10 00 00 00 	movq   $0x0,0x10(%rbx)
   2b84a:	00 
   2b84b:	49 83 c4 01          	add    $0x1,%r12
   2b84f:	48 83 c3 20          	add    $0x20,%rbx
   2b853:	48 c7 43 f8 05 00 00 	movq   $0x5,-0x8(%rbx)
   2b85a:	00 
   2b85b:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2b861:	49 89 c2             	mov    %rax,%r10
   2b864:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b868:	ff e0                	jmp    *%rax
   2b86a:	f3 0f 1e fa          	endbr64
   2b86e:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2b875:	31 d2                	xor    %edx,%edx
   2b877:	48 89 de             	mov    %rbx,%rsi
   2b87a:	4c 89 ef             	mov    %r13,%rdi
   2b87d:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2b881:	e8 2a 48 07 00       	call   a00b0 <js_for_of_start>
   2b886:	85 c0                	test   %eax,%eax
   2b888:	0f 85 f2 a3 ff ff    	jne    25c80 <JS_CallInternal+0x830>
   2b88e:	48 c7 43 10 00 00 00 	movq   $0x0,0x10(%rbx)
   2b895:	00 
   2b896:	49 83 c4 01          	add    $0x1,%r12
   2b89a:	48 83 c3 20          	add    $0x20,%rbx
   2b89e:	48 c7 43 f8 05 00 00 	movq   $0x5,-0x8(%rbx)
   2b8a5:	00 
   2b8a6:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2b8ac:	49 89 c2             	mov    %rax,%r10
   2b8af:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b8b3:	ff e0                	jmp    *%rax
   2b8b5:	f3 0f 1e fa          	endbr64
   2b8b9:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2b8c0:	48 89 de             	mov    %rbx,%rsi
   2b8c3:	4c 89 ef             	mov    %r13,%rdi
   2b8c6:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2b8ca:	e8 51 a5 05 00       	call   85e20 <js_for_in_next>
   2b8cf:	85 c0                	test   %eax,%eax
   2b8d1:	0f 85 a9 a3 ff ff    	jne    25c80 <JS_CallInternal+0x830>
   2b8d7:	41 0f b6 04 24       	movzbl (%r12),%eax
   2b8dc:	48 83 c3 20          	add    $0x20,%rbx
   2b8e0:	49 83 c4 01          	add    $0x1,%r12
   2b8e4:	49 89 c2             	mov    %rax,%r10
   2b8e7:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b8eb:	ff e0                	jmp    *%rax
   2b8ed:	f3 0f 1e fa          	endbr64
   2b8f1:	41 0f b6 0c 24       	movzbl (%r12),%ecx
   2b8f6:	41 ba fd ff ff ff    	mov    $0xfffffffd,%r10d
   2b8fc:	4d 8d 5c 24 01       	lea    0x1(%r12),%r11
   2b901:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2b908:	c7 85 9c fe ff ff 01 	movl   $0x1,-0x164(%rbp)
   2b90f:	00 00 00 
   2b912:	41 29 ca             	sub    %ecx,%r10d
   2b915:	4c 89 58 30          	mov    %r11,0x30(%rax)
   2b919:	4d 63 d2             	movslq %r10d,%r10
   2b91c:	49 c1 e2 04          	shl    $0x4,%r10
   2b920:	49 01 da             	add    %rbx,%r10
   2b923:	49 8b 52 08          	mov    0x8(%r10),%rdx
   2b927:	83 fa 03             	cmp    $0x3,%edx
   2b92a:	0f 84 f0 2b 00 00    	je     2e520 <JS_CallInternal+0x90d0>
   2b930:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
   2b935:	49 8b 32             	mov    (%r10),%rsi
   2b938:	4c 89 ef             	mov    %r13,%rdi
   2b93b:	4c 8d 8d 9c fe ff ff 	lea    -0x164(%rbp),%r9
   2b942:	29 c8                	sub    %ecx,%eax
   2b944:	4c 89 95 f0 fd ff ff 	mov    %r10,-0x210(%rbp)
   2b94b:	48 98                	cltq
   2b94d:	4c 89 9d e8 fd ff ff 	mov    %r11,-0x218(%rbp)
   2b954:	48 c1 e0 04          	shl    $0x4,%rax
   2b958:	48 01 d8             	add    %rbx,%rax
   2b95b:	48 8b 08             	mov    (%rax),%rcx
   2b95e:	4c 8b 40 08          	mov    0x8(%rax),%r8
   2b962:	e8 b9 5e 07 00       	call   a1820 <JS_IteratorNext.constprop.0>
   2b967:	4c 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%r10
   2b96e:	4c 8b 9d e8 fd ff ff 	mov    -0x218(%rbp),%r11
   2b975:	48 89 c1             	mov    %rax,%rcx
   2b978:	83 fa 06             	cmp    $0x6,%edx
   2b97b:	48 89 d0             	mov    %rdx,%rax
   2b97e:	48 89 d6             	mov    %rdx,%rsi
   2b981:	48 89 cf             	mov    %rcx,%rdi
   2b984:	0f 84 66 2b 00 00    	je     2e4f0 <JS_CallInternal+0x90a0>
   2b98a:	44 8b 85 9c fe ff ff 	mov    -0x164(%rbp),%r8d
   2b991:	31 d2                	xor    %edx,%edx
   2b993:	45 85 c0             	test   %r8d,%r8d
   2b996:	0f 85 e4 19 00 00    	jne    2d380 <JS_CallInternal+0x7f30>
   2b99c:	48 89 3b             	mov    %rdi,(%rbx)
   2b99f:	49 83 c4 02          	add    $0x2,%r12
   2b9a3:	48 83 c3 20          	add    $0x20,%rbx
   2b9a7:	48 89 73 e8          	mov    %rsi,-0x18(%rbx)
   2b9ab:	48 89 53 f0          	mov    %rdx,-0x10(%rbx)
   2b9af:	48 c7 43 f8 01 00 00 	movq   $0x1,-0x8(%rbx)
   2b9b6:	00 
   2b9b7:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2b9bd:	49 89 c2             	mov    %rax,%r10
   2b9c0:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2b9c4:	ff e0                	jmp    *%rax
   2b9c6:	f3 0f 1e fa          	endbr64
   2b9ca:	49 63 04 24          	movslq (%r12),%rax
   2b9ce:	48 8b 8d 70 fe ff ff 	mov    -0x190(%rbp),%rcx
   2b9d5:	49 8d 54 24 04       	lea    0x4(%r12),%rdx
   2b9da:	48 83 c3 10          	add    $0x10,%rbx
   2b9de:	2b 51 18             	sub    0x18(%rcx),%edx
   2b9e1:	4c 01 e0             	add    %r12,%rax
   2b9e4:	48 c7 43 f8 00 00 00 	movq   $0x0,-0x8(%rbx)
   2b9eb:	00 
   2b9ec:	48 89 53 f0          	mov    %rdx,-0x10(%rbx)
   2b9f0:	4c 8d 60 01          	lea    0x1(%rax),%r12
   2b9f4:	0f b6 00             	movzbl (%rax),%eax
   2b9f7:	49 89 c2             	mov    %rax,%r10
   2b9fa:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2b9fe:	f3 0f 1e fa          	endbr64
   2ba02:	8b 73 f8             	mov    -0x8(%rbx),%esi
   2ba05:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2ba09:	85 f6                	test   %esi,%esi
   2ba0b:	0f 85 d3 19 00 00    	jne    2d3e4 <JS_CallInternal+0x7f94>
   2ba11:	48 8b 8d 70 fe ff ff 	mov    -0x190(%rbp),%rcx
   2ba18:	3b 41 20             	cmp    0x20(%rcx),%eax
   2ba1b:	0f 83 c3 19 00 00    	jae    2d3e4 <JS_CallInternal+0x7f94>
   2ba21:	48 8b 8d 70 fe ff ff 	mov    -0x190(%rbp),%rcx
   2ba28:	89 c0                	mov    %eax,%eax
   2ba2a:	48 83 eb 10          	sub    $0x10,%rbx
   2ba2e:	48 03 41 18          	add    0x18(%rcx),%rax
   2ba32:	4c 8d 60 01          	lea    0x1(%rax),%r12
   2ba36:	0f b6 00             	movzbl (%rax),%eax
   2ba39:	49 89 c2             	mov    %rax,%r10
   2ba3c:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2ba40:	f3 0f 1e fa          	endbr64
   2ba44:	49 63 04 24          	movslq (%r12),%rax
   2ba48:	48 8b 8d 70 fe ff ff 	mov    -0x190(%rbp),%rcx
   2ba4f:	48 83 c3 10          	add    $0x10,%rbx
   2ba53:	4c 01 e0             	add    %r12,%rax
   2ba56:	2b 41 18             	sub    0x18(%rcx),%eax
   2ba59:	48 c7 43 f8 05 00 00 	movq   $0x5,-0x8(%rbx)
   2ba60:	00 
   2ba61:	49 83 c4 05          	add    $0x5,%r12
   2ba65:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2ba69:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2ba6f:	49 89 c2             	mov    %rax,%r10
   2ba72:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2ba76:	ff e0                	jmp    *%rax
   2ba78:	8b 16                	mov    (%rsi),%edx
   2ba7a:	81 e2 ff ff ff 03    	and    $0x3ffffff,%edx
   2ba80:	0f 85 cc f2 ff ff    	jne    2ad52 <JS_CallInternal+0x5902>
   2ba86:	f6 47 10 08          	testb  $0x8,0x10(%rdi)
   2ba8a:	0f 85 86 05 00 00    	jne    2c016 <JS_CallInternal+0x6bc6>
   2ba90:	49 8b 78 30          	mov    0x30(%r8),%rdi
   2ba94:	48 85 ff             	test   %rdi,%rdi
   2ba97:	0f 85 93 f2 ff ff    	jne    2ad30 <JS_CallInternal+0x58e0>
   2ba9d:	b9 03 00 00 00       	mov    $0x3,%ecx
   2baa2:	31 c0                	xor    %eax,%eax
   2baa4:	e9 e2 f2 ff ff       	jmp    2ad8b <JS_CallInternal+0x593b>
   2baa9:	8b 02                	mov    (%rdx),%eax
   2baab:	25 ff ff ff 03       	and    $0x3ffffff,%eax
   2bab0:	0f 85 9d cb ff ff    	jne    28653 <JS_CallInternal+0x3203>
   2bab6:	f6 41 10 08          	testb  $0x8,0x10(%rcx)
   2baba:	0f 85 ac 05 00 00    	jne    2c06c <JS_CallInternal+0x6c1c>
   2bac0:	49 8b 48 30          	mov    0x30(%r8),%rcx
   2bac4:	48 85 c9             	test   %rcx,%rcx
   2bac7:	0f 85 63 cb ff ff    	jne    28630 <JS_CallInternal+0x31e0>
   2bacd:	b9 03 00 00 00       	mov    $0x3,%ecx
   2bad2:	31 c0                	xor    %eax,%eax
   2bad4:	e9 b4 cb ff ff       	jmp    2868d <JS_CallInternal+0x323d>
   2bad9:	8b 16                	mov    (%rsi),%edx
   2badb:	81 e2 ff ff ff 03    	and    $0x3ffffff,%edx
   2bae1:	0f 85 0b f6 ff ff    	jne    2b0f2 <JS_CallInternal+0x5ca2>
   2bae7:	f6 47 10 08          	testb  $0x8,0x10(%rdi)
   2baeb:	0f 85 34 06 00 00    	jne    2c125 <JS_CallInternal+0x6cd5>
   2baf1:	49 8b 78 30          	mov    0x30(%r8),%rdi
   2baf5:	48 85 ff             	test   %rdi,%rdi
   2baf8:	0f 85 d2 f5 ff ff    	jne    2b0d0 <JS_CallInternal+0x5c80>
   2bafe:	ba 03 00 00 00       	mov    $0x3,%edx
   2bb03:	31 c0                	xor    %eax,%eax
   2bb05:	e9 21 f6 ff ff       	jmp    2b12b <JS_CallInternal+0x5cdb>
   2bb0a:	8b 06                	mov    (%rsi),%eax
   2bb0c:	25 ff ff ff 03       	and    $0x3ffffff,%eax
   2bb11:	0f 85 45 f4 ff ff    	jne    2af5c <JS_CallInternal+0x5b0c>
   2bb17:	f6 47 10 08          	testb  $0x8,0x10(%rdi)
   2bb1b:	0f 85 56 06 00 00    	jne    2c177 <JS_CallInternal+0x6d27>
   2bb21:	48 8b 7a 30          	mov    0x30(%rdx),%rdi
   2bb25:	48 85 ff             	test   %rdi,%rdi
   2bb28:	0f 84 cc 18 00 00    	je     2d3fa <JS_CallInternal+0x7faa>
   2bb2e:	48 8b 57 18          	mov    0x18(%rdi),%rdx
   2bb32:	e9 09 f4 ff ff       	jmp    2af40 <JS_CallInternal+0x5af0>
   2bb37:	8b 16                	mov    (%rsi),%edx
   2bb39:	81 e2 ff ff ff 03    	and    $0x3ffffff,%edx
   2bb3f:	0f 85 e7 f4 ff ff    	jne    2b02c <JS_CallInternal+0x5bdc>
   2bb45:	41 f6 40 10 08       	testb  $0x8,0x10(%r8)
   2bb4a:	0f 85 89 06 00 00    	jne    2c1d9 <JS_CallInternal+0x6d89>
   2bb50:	4c 8b 47 30          	mov    0x30(%rdi),%r8
   2bb54:	4d 85 c0             	test   %r8,%r8
   2bb57:	0f 84 1b 1a 00 00    	je     2d578 <JS_CallInternal+0x8128>
   2bb5d:	49 8b 78 18          	mov    0x18(%r8),%rdi
   2bb61:	e9 aa f4 ff ff       	jmp    2b010 <JS_CallInternal+0x5bc0>
   2bb66:	8b b5 60 fe ff ff    	mov    -0x1a0(%rbp),%esi
   2bb6c:	41 39 f0             	cmp    %esi,%r8d
   2bb6f:	41 89 f4             	mov    %esi,%r12d
   2bb72:	45 0f 4e e0          	cmovle %r8d,%r12d
   2bb76:	45 85 e4             	test   %r12d,%r12d
   2bb79:	0f 8e 1f 16 00 00    	jle    2d19e <JS_CallInternal+0x7d4e>
   2bb7f:	89 85 80 fe ff ff    	mov    %eax,-0x180(%rbp)
   2bb85:	4d 63 ec             	movslq %r12d,%r13
   2bb88:	4c 8b b5 50 fe ff ff 	mov    -0x1b0(%rbp),%r14
   2bb8f:	31 f6                	xor    %esi,%esi
   2bb91:	49 c1 e5 04          	shl    $0x4,%r13
   2bb95:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   2bb9c:	00 00 00 
   2bb9f:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2bba6:	00 00 00 00 
   2bbaa:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2bbb1:	00 00 00 00 
   2bbb5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2bbbc:	00 00 00 00 
   2bbc0:	49 8b 44 36 08       	mov    0x8(%r14,%rsi,1),%rax
   2bbc5:	4d 8b 1c 36          	mov    (%r14,%rsi,1),%r11
   2bbc9:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2bbcc:	76 05                	jbe    2bbd3 <JS_CallInternal+0x6783>
   2bbce:	41 83 43 fc 01       	addl   $0x1,-0x4(%r11)
   2bbd3:	4c 89 1c 37          	mov    %r11,(%rdi,%rsi,1)
   2bbd7:	48 89 44 37 08       	mov    %rax,0x8(%rdi,%rsi,1)
   2bbdc:	48 83 c6 10          	add    $0x10,%rsi
   2bbe0:	49 39 f5             	cmp    %rsi,%r13
   2bbe3:	75 db                	jne    2bbc0 <JS_CallInternal+0x6770>
   2bbe5:	8b 85 80 fe ff ff    	mov    -0x180(%rbp),%eax
   2bbeb:	45 39 e0             	cmp    %r12d,%r8d
   2bbee:	7e 48                	jle    2bc38 <JS_CallInternal+0x67e8>
   2bbf0:	45 8d 58 ff          	lea    -0x1(%r8),%r11d
   2bbf4:	4d 63 ec             	movslq %r12d,%r13
   2bbf7:	45 29 e3             	sub    %r12d,%r11d
   2bbfa:	4c 89 ee             	mov    %r13,%rsi
   2bbfd:	4d 01 eb             	add    %r13,%r11
   2bc00:	48 c1 e6 04          	shl    $0x4,%rsi
   2bc04:	49 c1 e3 04          	shl    $0x4,%r11
   2bc08:	48 01 fe             	add    %rdi,%rsi
   2bc0b:	4e 8d 5c 1f 10       	lea    0x10(%rdi,%r11,1),%r11
   2bc10:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2bc15:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   2bc1c:	00 00 00 00 
   2bc20:	48 c7 06 00 00 00 00 	movq   $0x0,(%rsi)
   2bc27:	48 83 c6 10          	add    $0x10,%rsi
   2bc2b:	48 c7 46 f8 03 00 00 	movq   $0x3,-0x8(%rsi)
   2bc32:	00 
   2bc33:	4c 39 de             	cmp    %r11,%rsi
   2bc36:	75 e8                	jne    2bc20 <JS_CallInternal+0x67d0>
   2bc38:	44 89 85 38 ff ff ff 	mov    %r8d,-0xc8(%rbp)
   2bc3f:	48 89 bd 40 fe ff ff 	mov    %rdi,-0x1c0(%rbp)
   2bc46:	e9 db 99 ff ff       	jmp    25626 <JS_CallInternal+0x1d6>
   2bc4b:	48 83 ec 08          	sub    $0x8,%rsp
   2bc4f:	8b 8d b0 fd ff ff    	mov    -0x250(%rbp),%ecx
   2bc55:	49 89 d1             	mov    %rdx,%r9
   2bc58:	48 89 c6             	mov    %rax,%rsi
   2bc5b:	44 89 95 c0 fd ff ff 	mov    %r10d,-0x240(%rbp)
   2bc62:	4c 89 ef             	mov    %r13,%rdi
   2bc65:	4c 89 9d d0 fd ff ff 	mov    %r11,-0x230(%rbp)
   2bc6c:	6a 00                	push   $0x0
   2bc6e:	48 89 85 e8 fd ff ff 	mov    %rax,-0x218(%rbp)
   2bc75:	e8 a6 49 00 00       	call   30620 <JS_GetPropertyInternal>
   2bc7a:	4c 89 ef             	mov    %r13,%rdi
   2bc7d:	48 89 c6             	mov    %rax,%rsi
   2bc80:	e8 5b 52 ff ff       	call   20ee0 <JS_ToBoolFree>
   2bc85:	4c 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%r8
   2bc8c:	44 8b 95 c0 fd ff ff 	mov    -0x240(%rbp),%r10d
   2bc93:	41 8b 48 fc          	mov    -0x4(%r8),%ecx
   2bc97:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2bc9a:	85 d2                	test   %edx,%edx
   2bc9c:	41 89 50 fc          	mov    %edx,-0x4(%r8)
   2bca0:	41 5b                	pop    %r11
   2bca2:	4c 8b 9d d0 fd ff ff 	mov    -0x230(%rbp),%r11
   2bca9:	59                   	pop    %rcx
   2bcaa:	0f 8e b2 3b 00 00    	jle    2f862 <JS_CallInternal+0xa412>
   2bcb0:	85 c0                	test   %eax,%eax
   2bcb2:	0f 88 7f a3 ff ff    	js     26037 <JS_CallInternal+0xbe7>
   2bcb8:	0f 84 5d 9b ff ff    	je     2581b <JS_CallInternal+0x3cb>
   2bcbe:	48 8b 43 f8          	mov    -0x8(%rbx),%rax
   2bcc2:	48 83 eb 10          	sub    $0x10,%rbx
   2bcc6:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2bcc9:	0f 86 e7 a0 ff ff    	jbe    25db6 <JS_CallInternal+0x966>
   2bccf:	48 8b 0b             	mov    (%rbx),%rcx
   2bcd2:	8b 79 fc             	mov    -0x4(%rcx),%edi
   2bcd5:	8d 57 ff             	lea    -0x1(%rdi),%edx
   2bcd8:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2bcdb:	85 d2                	test   %edx,%edx
   2bcdd:	0f 8f d3 a0 ff ff    	jg     25db6 <JS_CallInternal+0x966>
   2bce3:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2bce7:	48 89 c2             	mov    %rax,%rdx
   2bcea:	48 89 ce             	mov    %rcx,%rsi
   2bced:	4c 89 9d f0 fd ff ff 	mov    %r11,-0x210(%rbp)
   2bcf4:	e8 a7 2c ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2bcf9:	4c 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%r11
   2bd00:	e9 b1 a0 ff ff       	jmp    25db6 <JS_CallInternal+0x966>
   2bd05:	8b 95 c0 fd ff ff    	mov    -0x240(%rbp),%edx
   2bd0b:	48 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%rcx
   2bd12:	4c 89 f8             	mov    %r15,%rax
   2bd15:	4c 8b a5 e8 fd ff ff 	mov    -0x218(%rbp),%r12
   2bd1c:	48 8b b5 b0 fd ff ff 	mov    -0x250(%rbp),%rsi
   2bd23:	83 c2 02             	add    $0x2,%edx
   2bd26:	4c 8b bd d0 fd ff ff 	mov    -0x230(%rbp),%r15
   2bd2d:	48 63 d2             	movslq %edx,%rdx
   2bd30:	49 83 c4 03          	add    $0x3,%r12
   2bd34:	48 c1 e2 04          	shl    $0x4,%rdx
   2bd38:	48 29 d1             	sub    %rdx,%rcx
   2bd3b:	48 89 31             	mov    %rsi,(%rcx)
   2bd3e:	48 8d 59 10          	lea    0x10(%rcx),%rbx
   2bd42:	48 89 41 08          	mov    %rax,0x8(%rcx)
   2bd46:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2bd4c:	49 89 c2             	mov    %rax,%r10
   2bd4f:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2bd53:	ff e0                	jmp    *%rax
   2bd55:	48 89 d9             	mov    %rbx,%rcx
   2bd58:	4c 8b a5 e8 fd ff ff 	mov    -0x218(%rbp),%r12
   2bd5f:	4c 89 eb             	mov    %r13,%rbx
   2bd62:	4d 89 c5             	mov    %r8,%r13
   2bd65:	4c 8b 85 d0 fd ff ff 	mov    -0x230(%rbp),%r8
   2bd6c:	48 39 8d 08 fe ff ff 	cmp    %rcx,-0x1f8(%rbp)
   2bd73:	0f 84 ab 24 00 00    	je     2e224 <JS_CallInternal+0x8dd4>
   2bd79:	48 89 59 f8          	mov    %rbx,-0x8(%rcx)
   2bd7d:	49 83 c4 01          	add    $0x1,%r12
   2bd81:	48 89 cb             	mov    %rcx,%rbx
   2bd84:	4c 89 41 f0          	mov    %r8,-0x10(%rcx)
   2bd88:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2bd8e:	49 89 c2             	mov    %rax,%r10
   2bd91:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2bd95:	ff e0                	jmp    *%rax
   2bd97:	80 fa 01             	cmp    $0x1,%dl
   2bd9a:	0f 84 20 03 00 00    	je     2c0c0 <JS_CallInternal+0x6c70>
   2bda0:	80 cc 10             	or     $0x10,%ah
   2bda3:	4c 8d 63 f0          	lea    -0x10(%rbx),%r12
   2bda7:	f3 0f 6f 7b f0       	movdqu -0x10(%rbx),%xmm7
   2bdac:	4c 89 ef             	mov    %r13,%rdi
   2bdaf:	89 85 48 fd ff ff    	mov    %eax,-0x2b8(%rbp)
   2bdb5:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2bdb9:	8b b5 f0 fd ff ff    	mov    -0x210(%rbp),%esi
   2bdbf:	0f 29 bd 50 fd ff ff 	movaps %xmm7,-0x2b0(%rbp)
   2bdc6:	48 89 85 c0 fd ff ff 	mov    %rax,-0x240(%rbp)
   2bdcd:	49 8b 44 24 08       	mov    0x8(%r12),%rax
   2bdd2:	48 89 85 b0 fd ff ff 	mov    %rax,-0x250(%rbp)
   2bdd9:	e8 a2 88 01 00       	call   44680 <js_get_function_name>
   2bdde:	4c 8d 05 5f d3 0a 00 	lea    0xad35f(%rip),%r8        # d9144 <_IO_stdin_used+0x144>
   2bde5:	48 8d 35 da d7 0a 00 	lea    0xad7da(%rip),%rsi        # d95c6 <_IO_stdin_used+0x5c6>
   2bdec:	4c 89 ef             	mov    %r13,%rdi
   2bdef:	48 89 d1             	mov    %rdx,%rcx
   2bdf2:	48 89 c2             	mov    %rax,%rdx
   2bdf5:	e8 e6 86 01 00       	call   444e0 <JS_ConcatString3>
   2bdfa:	49 89 c0             	mov    %rax,%r8
   2bdfd:	49 89 d1             	mov    %rdx,%r9
   2be00:	e9 f5 a6 ff ff       	jmp    264fa <JS_CallInternal+0x10aa>
   2be05:	4d 89 ec             	mov    %r13,%r12
   2be08:	48 8b 9d b0 fd ff ff 	mov    -0x250(%rbp),%rbx
   2be0f:	4d 89 d5             	mov    %r10,%r13
   2be12:	4c 8b 95 a8 fd ff ff 	mov    -0x258(%rbp),%r10
   2be19:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2be1d:	4c 89 d6             	mov    %r10,%rsi
   2be20:	e8 cb a1 fe ff       	call   15ff0 <__js_free>
   2be25:	83 bd e8 fd ff ff 06 	cmpl   $0x6,-0x218(%rbp)
   2be2c:	0f 84 51 19 00 00    	je     2d783 <JS_CallInternal+0x8333>
   2be32:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   2be36:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2be39:	76 15                	jbe    2be50 <JS_CallInternal+0x6a00>
   2be3b:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   2be3f:	8b 79 fc             	mov    -0x4(%rcx),%edi
   2be42:	8d 57 ff             	lea    -0x1(%rdi),%edx
   2be45:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2be48:	85 d2                	test   %edx,%edx
   2be4a:	0f 8e 7c 29 00 00    	jle    2e7cc <JS_CallInternal+0x937c>
   2be50:	48 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%rcx
   2be57:	48 8b 41 08          	mov    0x8(%rcx),%rax
   2be5b:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2be5e:	76 14                	jbe    2be74 <JS_CallInternal+0x6a24>
   2be60:	48 8b 09             	mov    (%rcx),%rcx
   2be63:	8b 79 fc             	mov    -0x4(%rcx),%edi
   2be66:	8d 57 ff             	lea    -0x1(%rdi),%edx
   2be69:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2be6c:	85 d2                	test   %edx,%edx
   2be6e:	0f 8e 44 29 00 00    	jle    2e7b8 <JS_CallInternal+0x9368>
   2be74:	48 8b 85 c0 fd ff ff 	mov    -0x240(%rbp),%rax
   2be7b:	49 83 c4 03          	add    $0x3,%r12
   2be7f:	48 89 43 e0          	mov    %rax,-0x20(%rbx)
   2be83:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
   2be8a:	48 89 43 e8          	mov    %rax,-0x18(%rbx)
   2be8e:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2be94:	48 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%rbx
   2be9b:	49 89 c2             	mov    %rax,%r10
   2be9e:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2bea2:	ff e0                	jmp    *%rax
   2bea4:	8b 85 f0 fd ff ff    	mov    -0x210(%rbp),%eax
   2beaa:	4c 89 f9             	mov    %r15,%rcx
   2bead:	4c 8b a5 d0 fd ff ff 	mov    -0x230(%rbp),%r12
   2beb4:	48 8b 95 b0 fd ff ff 	mov    -0x250(%rbp),%rdx
   2bebb:	4c 8b bd c0 fd ff ff 	mov    -0x240(%rbp),%r15
   2bec2:	83 c0 02             	add    $0x2,%eax
   2bec5:	49 83 c4 03          	add    $0x3,%r12
   2bec9:	48 98                	cltq
   2becb:	48 c1 e0 04          	shl    $0x4,%rax
   2becf:	48 29 c1             	sub    %rax,%rcx
   2bed2:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
   2bed9:	48 89 51 08          	mov    %rdx,0x8(%rcx)
   2bedd:	48 8d 59 10          	lea    0x10(%rcx),%rbx
   2bee1:	48 89 01             	mov    %rax,(%rcx)
   2bee4:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2beea:	49 89 c2             	mov    %rax,%r10
   2beed:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2bef1:	ff e0                	jmp    *%rax
   2bef3:	8b 85 f0 fd ff ff    	mov    -0x210(%rbp),%eax
   2bef9:	4c 8b a5 e8 fd ff ff 	mov    -0x218(%rbp),%r12
   2bf00:	4c 89 f9             	mov    %r15,%rcx
   2bf03:	48 8b b5 d0 fd ff ff 	mov    -0x230(%rbp),%rsi
   2bf0a:	48 8b 95 c0 fd ff ff 	mov    -0x240(%rbp),%rdx
   2bf11:	83 c0 01             	add    $0x1,%eax
   2bf14:	4c 8b bd b0 fd ff ff 	mov    -0x250(%rbp),%r15
   2bf1b:	49 83 c4 05          	add    $0x5,%r12
   2bf1f:	48 98                	cltq
   2bf21:	48 c1 e0 04          	shl    $0x4,%rax
   2bf25:	48 29 c1             	sub    %rax,%rcx
   2bf28:	48 89 31             	mov    %rsi,(%rcx)
   2bf2b:	48 8d 59 10          	lea    0x10(%rcx),%rbx
   2bf2f:	48 89 51 08          	mov    %rdx,0x8(%rcx)
   2bf33:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2bf39:	49 89 c2             	mov    %rax,%r10
   2bf3c:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2bf40:	ff e0                	jmp    *%rax
   2bf42:	8b 10                	mov    (%rax),%edx
   2bf44:	81 e2 ff ff ff 03    	and    $0x3ffffff,%edx
   2bf4a:	0f 85 84 b3 ff ff    	jne    272d4 <JS_CallInternal+0x1e84>
   2bf50:	89 f2                	mov    %esi,%edx
   2bf52:	b9 07 00 00 00       	mov    $0x7,%ecx
   2bf57:	4c 89 c6             	mov    %r8,%rsi
   2bf5a:	4c 89 ef             	mov    %r13,%rdi
   2bf5d:	e8 7e e7 01 00       	call   4a6e0 <add_property>
   2bf62:	48 85 c0             	test   %rax,%rax
   2bf65:	0f 84 92 b3 ff ff    	je     272fd <JS_CallInternal+0x1ead>
   2bf6b:	48 8b 9d e8 fd ff ff 	mov    -0x218(%rbp),%rbx
   2bf72:	48 89 18             	mov    %rbx,(%rax)
   2bf75:	48 8b 9d d0 fd ff ff 	mov    -0x230(%rbp),%rbx
   2bf7c:	48 89 58 08          	mov    %rbx,0x8(%rax)
   2bf80:	48 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%rbx
   2bf87:	48 8b 43 08          	mov    0x8(%rbx),%rax
   2bf8b:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2bf8e:	76 14                	jbe    2bfa4 <JS_CallInternal+0x6b54>
   2bf90:	48 8b 0b             	mov    (%rbx),%rcx
   2bf93:	8b 59 fc             	mov    -0x4(%rcx),%ebx
   2bf96:	8d 53 ff             	lea    -0x1(%rbx),%edx
   2bf99:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2bf9c:	85 d2                	test   %edx,%edx
   2bf9e:	0f 8e 3c 28 00 00    	jle    2e7e0 <JS_CallInternal+0x9390>
   2bfa4:	41 0f b6 04 24       	movzbl (%r12),%eax
   2bfa9:	48 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%rbx
   2bfb0:	49 83 c4 01          	add    $0x1,%r12
   2bfb4:	49 89 c2             	mov    %rax,%r10
   2bfb7:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2bfbb:	ff e0                	jmp    *%rax
   2bfbd:	81 bd f0 fd ff ff f2 	cmpl   $0xf2,-0x210(%rbp)
   2bfc4:	00 00 00 
   2bfc7:	0f 8f 15 12 00 00    	jg     2d1e2 <JS_CallInternal+0x7d92>
   2bfcd:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   2bfd1:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2bfd4:	0f 86 f8 a5 ff ff    	jbe    265d2 <JS_CallInternal+0x1182>
   2bfda:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   2bfde:	8b 56 fc             	mov    -0x4(%rsi),%edx
   2bfe1:	83 ea 01             	sub    $0x1,%edx
   2bfe4:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2bfe7:	85 d2                	test   %edx,%edx
   2bfe9:	0f 8f e3 a5 ff ff    	jg     265d2 <JS_CallInternal+0x1182>
   2bfef:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2bff3:	48 89 c2             	mov    %rax,%rdx
   2bff6:	89 8d f0 fd ff ff    	mov    %ecx,-0x210(%rbp)
   2bffc:	e8 9f 29 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2c001:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   2c007:	e9 c6 a5 ff ff       	jmp    265d2 <JS_CallInternal+0x1182>
   2c00c:	ba 08 00 00 00       	mov    $0x8,%edx
   2c011:	e9 d1 ec ff ff       	jmp    2ace7 <JS_CallInternal+0x5897>
   2c016:	49 89 f9             	mov    %rdi,%r9
   2c019:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   2c020:	48 8b bd 80 fe ff ff 	mov    -0x180(%rbp),%rdi
   2c027:	48 83 ec 08          	sub    $0x8,%rsp
   2c02b:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2c02f:	48 89 c2             	mov    %rax,%rdx
   2c032:	4c 89 95 f0 fd ff ff 	mov    %r10,-0x210(%rbp)
   2c039:	4c 89 c8             	mov    %r9,%rax
   2c03c:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2c040:	4c 89 57 30          	mov    %r10,0x30(%rdi)
   2c044:	48 89 c6             	mov    %rax,%rsi
   2c047:	4c 89 ef             	mov    %r13,%rdi
   2c04a:	6a 00                	push   $0x0
   2c04c:	e8 cf 45 00 00       	call   30620 <JS_GetPropertyInternal>
   2c051:	5f                   	pop    %rdi
   2c052:	41 58                	pop    %r8
   2c054:	48 89 d1             	mov    %rdx,%rcx
   2c057:	83 fa 06             	cmp    $0x6,%edx
   2c05a:	0f 85 2b ed ff ff    	jne    2ad8b <JS_CallInternal+0x593b>
   2c060:	4c 8b a5 f0 fd ff ff 	mov    -0x210(%rbp),%r12
   2c067:	e9 14 9c ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2c06c:	48 89 cf             	mov    %rcx,%rdi
   2c06f:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
   2c076:	48 83 ec 08          	sub    $0x8,%rsp
   2c07a:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2c07e:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2c082:	48 89 f2             	mov    %rsi,%rdx
   2c085:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2c08c:	48 89 fe             	mov    %rdi,%rsi
   2c08f:	b9 32 00 00 00       	mov    $0x32,%ecx
   2c094:	4c 89 ef             	mov    %r13,%rdi
   2c097:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2c09b:	6a 00                	push   $0x0
   2c09d:	e8 7e 45 00 00       	call   30620 <JS_GetPropertyInternal>
   2c0a2:	41 5b                	pop    %r11
   2c0a4:	48 89 d1             	mov    %rdx,%rcx
   2c0a7:	5a                   	pop    %rdx
   2c0a8:	83 f9 06             	cmp    $0x6,%ecx
   2c0ab:	0f 85 dc c5 ff ff    	jne    2868d <JS_CallInternal+0x323d>
   2c0b1:	e9 ca 9b ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2c0b6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   2c0bd:	00 00 00 
   2c0c0:	80 cc 08             	or     $0x8,%ah
   2c0c3:	4c 8d 63 f0          	lea    -0x10(%rbx),%r12
   2c0c7:	f3 0f 6f 73 f0       	movdqu -0x10(%rbx),%xmm6
   2c0cc:	4c 89 ef             	mov    %r13,%rdi
   2c0cf:	89 85 48 fd ff ff    	mov    %eax,-0x2b8(%rbp)
   2c0d5:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2c0d9:	8b b5 f0 fd ff ff    	mov    -0x210(%rbp),%esi
   2c0df:	0f 29 b5 60 fd ff ff 	movaps %xmm6,-0x2a0(%rbp)
   2c0e6:	48 89 85 c0 fd ff ff 	mov    %rax,-0x240(%rbp)
   2c0ed:	49 8b 44 24 08       	mov    0x8(%r12),%rax
   2c0f2:	48 89 85 b0 fd ff ff 	mov    %rax,-0x250(%rbp)
   2c0f9:	e8 82 85 01 00       	call   44680 <js_get_function_name>
   2c0fe:	4c 8d 05 3f d0 0a 00 	lea    0xad03f(%rip),%r8        # d9144 <_IO_stdin_used+0x144>
   2c105:	48 8d 35 b5 d4 0a 00 	lea    0xad4b5(%rip),%rsi        # d95c1 <_IO_stdin_used+0x5c1>
   2c10c:	4c 89 ef             	mov    %r13,%rdi
   2c10f:	48 89 d1             	mov    %rdx,%rcx
   2c112:	48 89 c2             	mov    %rax,%rdx
   2c115:	e8 c6 83 01 00       	call   444e0 <JS_ConcatString3>
   2c11a:	49 89 c0             	mov    %rax,%r8
   2c11d:	49 89 d1             	mov    %rdx,%r9
   2c120:	e9 d5 a3 ff ff       	jmp    264fa <JS_CallInternal+0x10aa>
   2c125:	49 89 f9             	mov    %rdi,%r9
   2c128:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   2c12f:	48 8b bd 80 fe ff ff 	mov    -0x180(%rbp),%rdi
   2c136:	48 83 ec 08          	sub    $0x8,%rsp
   2c13a:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2c13e:	48 89 c2             	mov    %rax,%rdx
   2c141:	4c 89 95 f0 fd ff ff 	mov    %r10,-0x210(%rbp)
   2c148:	4c 89 c8             	mov    %r9,%rax
   2c14b:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2c14f:	4c 89 57 30          	mov    %r10,0x30(%rdi)
   2c153:	48 89 c6             	mov    %rax,%rsi
   2c156:	4c 89 ef             	mov    %r13,%rdi
   2c159:	6a 00                	push   $0x0
   2c15b:	e8 c0 44 00 00       	call   30620 <JS_GetPropertyInternal>
   2c160:	59                   	pop    %rcx
   2c161:	5e                   	pop    %rsi
   2c162:	83 fa 06             	cmp    $0x6,%edx
   2c165:	0f 85 c0 ef ff ff    	jne    2b12b <JS_CallInternal+0x5cdb>
   2c16b:	4c 8b a5 f0 fd ff ff 	mov    -0x210(%rbp),%r12
   2c172:	e9 09 9b ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2c177:	48 c7 85 f0 fd ff ff 	movq   $0xffffffffffffffff,-0x210(%rbp)
   2c17e:	ff ff ff ff 
   2c182:	49 89 fa             	mov    %rdi,%r10
   2c185:	48 83 ec 08          	sub    $0x8,%rsp
   2c189:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2c18d:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2c191:	4c 89 d6             	mov    %r10,%rsi
   2c194:	48 8b bd e8 fd ff ff 	mov    -0x218(%rbp),%rdi
   2c19b:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2c1a2:	4c 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%r11
   2c1a9:	48 89 78 30          	mov    %rdi,0x30(%rax)
   2c1ad:	4c 89 ef             	mov    %r13,%rdi
   2c1b0:	6a 00                	push   $0x0
   2c1b2:	4c 89 da             	mov    %r11,%rdx
   2c1b5:	e8 66 44 00 00       	call   30620 <JS_GetPropertyInternal>
   2c1ba:	41 58                	pop    %r8
   2c1bc:	41 59                	pop    %r9
   2c1be:	48 89 c1             	mov    %rax,%rcx
   2c1c1:	48 89 d0             	mov    %rdx,%rax
   2c1c4:	83 fa 06             	cmp    $0x6,%edx
   2c1c7:	0f 85 de ed ff ff    	jne    2afab <JS_CallInternal+0x5b5b>
   2c1cd:	4c 8b a5 e8 fd ff ff 	mov    -0x218(%rbp),%r12
   2c1d4:	e9 a7 9a ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2c1d9:	4c 89 c0             	mov    %r8,%rax
   2c1dc:	49 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%r11
   2c1e3:	48 83 ec 08          	sub    $0x8,%rsp
   2c1e7:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2c1eb:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2c1ef:	48 89 c6             	mov    %rax,%rsi
   2c1f2:	48 8b bd 80 fe ff ff 	mov    -0x180(%rbp),%rdi
   2c1f9:	48 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%rdx
   2c200:	48 89 57 30          	mov    %rdx,0x30(%rdi)
   2c204:	4c 89 da             	mov    %r11,%rdx
   2c207:	4c 89 ef             	mov    %r13,%rdi
   2c20a:	6a 00                	push   $0x0
   2c20c:	e8 0f 44 00 00       	call   30620 <JS_GetPropertyInternal>
   2c211:	41 5b                	pop    %r11
   2c213:	48 89 d1             	mov    %rdx,%rcx
   2c216:	5a                   	pop    %rdx
   2c217:	83 f9 06             	cmp    $0x6,%ecx
   2c21a:	0f 84 31 2d 00 00    	je     2ef51 <JS_CallInternal+0x9b01>
   2c220:	49 89 c1             	mov    %rax,%r9
   2c223:	e9 49 ee ff ff       	jmp    2b071 <JS_CallInternal+0x5c21>
   2c228:	4c 8b a5 f0 fd ff ff 	mov    -0x210(%rbp),%r12
   2c22f:	e9 4c 9a ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2c234:	48 8b bd 80 fe ff ff 	mov    -0x180(%rbp),%rdi
   2c23b:	48 89 4f 30          	mov    %rcx,0x30(%rdi)
   2c23f:	83 fa f6             	cmp    $0xfffffff6,%edx
   2c242:	76 04                	jbe    2c248 <JS_CallInternal+0x6df8>
   2c244:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2c248:	48 89 95 a8 fe ff ff 	mov    %rdx,-0x158(%rbp)
   2c24f:	4c 89 ef             	mov    %r13,%rdi
   2c252:	48 8d b5 b0 fe ff ff 	lea    -0x150(%rbp),%rsi
   2c259:	ba 8d 00 00 00       	mov    $0x8d,%edx
   2c25e:	4c 89 85 f0 fd ff ff 	mov    %r8,-0x210(%rbp)
   2c265:	48 89 8d e8 fd ff ff 	mov    %rcx,-0x218(%rbp)
   2c26c:	48 89 85 a0 fe ff ff 	mov    %rax,-0x160(%rbp)
   2c273:	e8 a8 64 02 00       	call   52720 <js_unary_arith_slow>
   2c278:	4c 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8
   2c27f:	85 c0                	test   %eax,%eax
   2c281:	0f 85 af 40 00 00    	jne    30336 <JS_CallInternal+0xaee6>
   2c287:	48 8b 8d a0 fe ff ff 	mov    -0x160(%rbp),%rcx
   2c28e:	49 8b 10             	mov    (%r8),%rdx
   2c291:	49 8b 40 08          	mov    0x8(%r8),%rax
   2c295:	49 89 08             	mov    %rcx,(%r8)
   2c298:	48 8b 8d a8 fe ff ff 	mov    -0x158(%rbp),%rcx
   2c29f:	49 89 48 08          	mov    %rcx,0x8(%r8)
   2c2a3:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2c2a6:	0f 86 e9 e8 ff ff    	jbe    2ab95 <JS_CallInternal+0x5745>
   2c2ac:	8b 4a fc             	mov    -0x4(%rdx),%ecx
   2c2af:	83 e9 01             	sub    $0x1,%ecx
   2c2b2:	89 4a fc             	mov    %ecx,-0x4(%rdx)
   2c2b5:	85 c9                	test   %ecx,%ecx
   2c2b7:	0f 8f d8 e8 ff ff    	jg     2ab95 <JS_CallInternal+0x5745>
   2c2bd:	48 92                	xchg   %rax,%rdx
   2c2bf:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2c2c3:	48 89 c6             	mov    %rax,%rsi
   2c2c6:	e8 d5 26 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2c2cb:	e9 c5 e8 ff ff       	jmp    2ab95 <JS_CallInternal+0x5745>
   2c2d0:	48 8b bd 80 fe ff ff 	mov    -0x180(%rbp),%rdi
   2c2d7:	48 89 4f 30          	mov    %rcx,0x30(%rdi)
   2c2db:	83 fa f6             	cmp    $0xfffffff6,%edx
   2c2de:	76 04                	jbe    2c2e4 <JS_CallInternal+0x6e94>
   2c2e0:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2c2e4:	48 89 95 b8 fe ff ff 	mov    %rdx,-0x148(%rbp)
   2c2eb:	4c 89 ef             	mov    %r13,%rdi
   2c2ee:	48 8d b5 c0 fe ff ff 	lea    -0x140(%rbp),%rsi
   2c2f5:	ba 8c 00 00 00       	mov    $0x8c,%edx
   2c2fa:	4c 89 85 f0 fd ff ff 	mov    %r8,-0x210(%rbp)
   2c301:	48 89 8d e8 fd ff ff 	mov    %rcx,-0x218(%rbp)
   2c308:	48 89 85 b0 fe ff ff 	mov    %rax,-0x150(%rbp)
   2c30f:	e8 0c 64 02 00       	call   52720 <js_unary_arith_slow>
   2c314:	4c 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8
   2c31b:	85 c0                	test   %eax,%eax
   2c31d:	0f 85 db 41 00 00    	jne    304fe <JS_CallInternal+0xb0ae>
   2c323:	48 8b 8d b0 fe ff ff 	mov    -0x150(%rbp),%rcx
   2c32a:	49 8b 10             	mov    (%r8),%rdx
   2c32d:	49 8b 40 08          	mov    0x8(%r8),%rax
   2c331:	49 89 08             	mov    %rcx,(%r8)
   2c334:	48 8b 8d b8 fe ff ff 	mov    -0x148(%rbp),%rcx
   2c33b:	49 89 48 08          	mov    %rcx,0x8(%r8)
   2c33f:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2c342:	0f 86 fc b2 ff ff    	jbe    27644 <JS_CallInternal+0x21f4>
   2c348:	8b 4a fc             	mov    -0x4(%rdx),%ecx
   2c34b:	83 e9 01             	sub    $0x1,%ecx
   2c34e:	89 4a fc             	mov    %ecx,-0x4(%rdx)
   2c351:	85 c9                	test   %ecx,%ecx
   2c353:	0f 8f eb b2 ff ff    	jg     27644 <JS_CallInternal+0x21f4>
   2c359:	48 92                	xchg   %rax,%rdx
   2c35b:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2c35f:	48 89 c6             	mov    %rax,%rsi
   2c362:	e8 39 26 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2c367:	e9 d8 b2 ff ff       	jmp    27644 <JS_CallInternal+0x21f4>
   2c36c:	83 fa 08             	cmp    $0x8,%edx
   2c36f:	0f 85 a8 0d 00 00    	jne    2d11d <JS_CallInternal+0x7ccd>
   2c375:	66 48 0f 6e c0       	movq   %rax,%xmm0
   2c37a:	66 0f 57 05 5e a7 0b 	xorpd  0xba75e(%rip),%xmm0        # e6ae0 <typed_array_size_log2+0x28>
   2c381:	00 
   2c382:	48 c7 43 f8 08 00 00 	movq   $0x8,-0x8(%rbx)
   2c389:	00 
   2c38a:	f2 0f 11 43 f0       	movsd  %xmm0,-0x10(%rbx)
   2c38f:	e9 9a ef ff ff       	jmp    2b32e <JS_CallInternal+0x5ede>
   2c394:	48 03 85 58 fe ff ff 	add    -0x1a8(%rbp),%rax
   2c39b:	48 8b 08             	mov    (%rax),%rcx
   2c39e:	48 8b 78 08          	mov    0x8(%rax),%rdi
   2c3a2:	e9 d7 ea ff ff       	jmp    2ae7e <JS_CallInternal+0x5a2e>
   2c3a7:	85 c0                	test   %eax,%eax
   2c3a9:	0f 84 62 a4 ff ff    	je     26811 <JS_CallInternal+0x13c1>
   2c3af:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2c3b3:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2c3b7:	b9 01 00 00 00       	mov    $0x1,%ecx
   2c3bc:	4c 89 ef             	mov    %r13,%rdi
   2c3bf:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2c3c6:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2c3ca:	e8 a1 79 01 00       	call   43d70 <JS_ToStringInternal>
   2c3cf:	48 89 d1             	mov    %rdx,%rcx
   2c3d2:	83 fa 06             	cmp    $0x6,%edx
   2c3d5:	0f 84 a5 98 ff ff    	je     25c80 <JS_CallInternal+0x830>
   2c3db:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   2c3df:	83 fe f6             	cmp    $0xfffffff6,%esi
   2c3e2:	76 15                	jbe    2c3f9 <JS_CallInternal+0x6fa9>
   2c3e4:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   2c3e8:	8b 57 fc             	mov    -0x4(%rdi),%edx
   2c3eb:	83 ea 01             	sub    $0x1,%edx
   2c3ee:	89 57 fc             	mov    %edx,-0x4(%rdi)
   2c3f1:	85 d2                	test   %edx,%edx
   2c3f3:	0f 8e dc 30 00 00    	jle    2f4d5 <JS_CallInternal+0xa085>
   2c3f9:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2c3fd:	48 89 4b f8          	mov    %rcx,-0x8(%rbx)
   2c401:	e9 0b a4 ff ff       	jmp    26811 <JS_CallInternal+0x13c1>
   2c406:	4c 89 95 f8 fd ff ff 	mov    %r10,-0x208(%rbp)
   2c40d:	48 8b 95 f8 fd ff ff 	mov    -0x208(%rbp),%rdx
   2c414:	4c 89 ef             	mov    %r13,%rdi
   2c417:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   2c41d:	48 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%rax
   2c424:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   2c428:	4c 89 95 e8 fd ff ff 	mov    %r10,-0x218(%rbp)
   2c42f:	49 89 d0             	mov    %rdx,%r8
   2c432:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   2c436:	48 89 c1             	mov    %rax,%rcx
   2c439:	e8 f2 1d 01 00       	call   3e230 <JS_SetPrototypeInternal>
   2c43e:	4c 8b 95 e8 fd ff ff 	mov    -0x218(%rbp),%r10
   2c445:	85 c0                	test   %eax,%eax
   2c447:	0f 89 1f ad ff ff    	jns    2716c <JS_CallInternal+0x1d1c>
   2c44d:	e9 2e 98 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2c452:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   2c458:	85 c9                	test   %ecx,%ecx
   2c45a:	0f 85 95 3a 00 00    	jne    2fef5 <JS_CallInternal+0xaaa5>
   2c460:	48 8b 43 e8          	mov    -0x18(%rbx),%rax
   2c464:	4c 8d 73 e0          	lea    -0x20(%rbx),%r14
   2c468:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2c46b:	76 15                	jbe    2c482 <JS_CallInternal+0x7032>
   2c46d:	48 8b 4b e0          	mov    -0x20(%rbx),%rcx
   2c471:	8b 79 fc             	mov    -0x4(%rcx),%edi
   2c474:	8d 57 ff             	lea    -0x1(%rdi),%edx
   2c477:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2c47a:	85 d2                	test   %edx,%edx
   2c47c:	0f 8e ab 2e 00 00    	jle    2f32d <JS_CallInternal+0x9edd>
   2c482:	48 8b 73 d0          	mov    -0x30(%rbx),%rsi
   2c486:	48 8b 53 d8          	mov    -0x28(%rbx),%rdx
   2c48a:	b9 01 00 00 00       	mov    $0x1,%ecx
   2c48f:	4c 89 ef             	mov    %r13,%rdi
   2c492:	4c 89 f3             	mov    %r14,%rbx
   2c495:	e8 b6 8b 06 00       	call   95050 <JS_IteratorClose>
   2c49a:	e9 8e 99 ff ff       	jmp    25e2d <JS_CallInternal+0x9dd>
   2c49f:	83 f9 08             	cmp    $0x8,%ecx
   2c4a2:	0f 85 03 0c 00 00    	jne    2d0ab <JS_CallInternal+0x7c5b>
   2c4a8:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2c4ac:	66 49 0f 6e f9       	movq   %r9,%xmm7
   2c4b1:	45 31 c0             	xor    %r8d,%r8d
   2c4b4:	f2 0f 2a c7          	cvtsi2sd %edi,%xmm0
   2c4b8:	66 0f 2e c7          	ucomisd %xmm7,%xmm0
   2c4bc:	41 0f 9b c0          	setnp  %r8b
   2c4c0:	44 0f 45 c2          	cmovne %edx,%r8d
   2c4c4:	e9 9a ab ff ff       	jmp    27063 <JS_CallInternal+0x1c13>
   2c4c9:	41 83 f8 08          	cmp    $0x8,%r8d
   2c4cd:	0f 85 fd 0b 00 00    	jne    2d0d0 <JS_CallInternal+0x7c80>
   2c4d3:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2c4d7:	66 49 0f 6e e1       	movq   %r9,%xmm4
   2c4dc:	31 c9                	xor    %ecx,%ecx
   2c4de:	f2 0f 2a c7          	cvtsi2sd %edi,%xmm0
   2c4e2:	66 0f 2e c4          	ucomisd %xmm4,%xmm0
   2c4e6:	0f 9b c1             	setnp  %cl
   2c4e9:	0f 45 ca             	cmovne %edx,%ecx
   2c4ec:	e9 1c ab ff ff       	jmp    2700d <JS_CallInternal+0x1bbd>
   2c4f1:	83 f9 08             	cmp    $0x8,%ecx
   2c4f4:	0f 85 24 0d 00 00    	jne    2d21e <JS_CallInternal+0x7dce>
   2c4fa:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2c4fe:	66 49 0f 6e e2       	movq   %r10,%xmm4
   2c503:	31 c0                	xor    %eax,%eax
   2c505:	f2 0f 2a c2          	cvtsi2sd %edx,%xmm0
   2c509:	66 0f 2e c4          	ucomisd %xmm4,%xmm0
   2c50d:	ba 01 00 00 00       	mov    $0x1,%edx
   2c512:	0f 9a c0             	setp   %al
   2c515:	48 0f 45 c2          	cmovne %rdx,%rax
   2c519:	e9 4f aa ff ff       	jmp    26f6d <JS_CallInternal+0x1b1d>
   2c51e:	41 83 f8 08          	cmp    $0x8,%r8d
   2c522:	0f 85 7e 0c 00 00    	jne    2d1a6 <JS_CallInternal+0x7d56>
   2c528:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2c52c:	66 49 0f 6e e2       	movq   %r10,%xmm4
   2c531:	31 c0                	xor    %eax,%eax
   2c533:	ba 00 00 00 00       	mov    $0x0,%edx
   2c538:	f2 0f 2a c7          	cvtsi2sd %edi,%xmm0
   2c53c:	66 0f 2e c4          	ucomisd %xmm4,%xmm0
   2c540:	0f 9b c0             	setnp  %al
   2c543:	48 0f 45 c2          	cmovne %rdx,%rax
   2c547:	e9 71 aa ff ff       	jmp    26fbd <JS_CallInternal+0x1b6d>
   2c54c:	48 8b 4b c0          	mov    -0x40(%rbx),%rcx
   2c550:	4c 8b 43 c8          	mov    -0x38(%rbx),%r8
   2c554:	f6 85 e8 fd ff ff 02 	testb  $0x2,-0x218(%rbp)
   2c55b:	0f 84 ff 0d 00 00    	je     2d360 <JS_CallInternal+0x7f10>
   2c561:	48 83 ec 08          	sub    $0x8,%rsp
   2c565:	45 31 c9             	xor    %r9d,%r9d
   2c568:	6a 00                	push   $0x0
   2c56a:	4c 89 ef             	mov    %r13,%rdi
   2c56d:	e8 1e 40 00 00       	call   30590 <JS_CallFree>
   2c572:	41 58                	pop    %r8
   2c574:	41 59                	pop    %r9
   2c576:	48 89 c1             	mov    %rax,%rcx
   2c579:	48 89 d0             	mov    %rdx,%rax
   2c57c:	83 fa 06             	cmp    $0x6,%edx
   2c57f:	0f 84 19 10 00 00    	je     2d59e <JS_CallInternal+0x814e>
   2c585:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   2c589:	83 fe f6             	cmp    $0xfffffff6,%esi
   2c58c:	76 15                	jbe    2c5a3 <JS_CallInternal+0x7153>
   2c58e:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   2c592:	8b 57 fc             	mov    -0x4(%rdi),%edx
   2c595:	83 ea 01             	sub    $0x1,%edx
   2c598:	89 57 fc             	mov    %edx,-0x4(%rdi)
   2c59b:	85 d2                	test   %edx,%edx
   2c59d:	0f 8e c0 2c 00 00    	jle    2f263 <JS_CallInternal+0x9e13>
   2c5a3:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
   2c5a7:	31 c0                	xor    %eax,%eax
   2c5a9:	48 89 4b f0          	mov    %rcx,-0x10(%rbx)
   2c5ad:	e9 27 a7 ff ff       	jmp    26cd9 <JS_CallInternal+0x1889>
   2c5b2:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2c5b9:	44 89 d2             	mov    %r10d,%edx
   2c5bc:	48 89 de             	mov    %rbx,%rsi
   2c5bf:	4c 89 ef             	mov    %r13,%rdi
   2c5c2:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2c5c6:	e8 65 66 02 00       	call   52c30 <js_post_inc_slow>
   2c5cb:	85 c0                	test   %eax,%eax
   2c5cd:	0f 84 60 cf ff ff    	je     29533 <JS_CallInternal+0x40e3>
   2c5d3:	e9 a8 96 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2c5d8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   2c5df:	00 
   2c5e0:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2c5e4:	48 89 ce             	mov    %rcx,%rsi
   2c5e7:	e8 b4 23 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2c5ec:	e9 9c a0 ff ff       	jmp    2668d <JS_CallInternal+0x123d>
   2c5f1:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   2c5f5:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   2c5f9:	4c 89 ef             	mov    %r13,%rdi
   2c5fc:	e8 af ad 01 00       	call   473b0 <JS_ValueToAtom>
   2c601:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   2c607:	85 c0                	test   %eax,%eax
   2c609:	0f 84 71 96 ff ff    	je     25c80 <JS_CallInternal+0x830>
   2c60f:	4c 89 a5 e8 fd ff ff 	mov    %r12,-0x218(%rbp)
   2c616:	e9 00 9e ff ff       	jmp    2641b <JS_CallInternal+0xfcb>
   2c61b:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2c622:	44 89 d2             	mov    %r10d,%edx
   2c625:	48 89 de             	mov    %rbx,%rsi
   2c628:	4c 89 ef             	mov    %r13,%rdi
   2c62b:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2c62f:	e8 fc 65 02 00       	call   52c30 <js_post_inc_slow>
   2c634:	85 c0                	test   %eax,%eax
   2c636:	0f 84 9a e5 ff ff    	je     2abd6 <JS_CallInternal+0x5786>
   2c63c:	e9 3f 96 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2c641:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2c648:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2c64f:	44 89 d2             	mov    %r10d,%edx
   2c652:	48 89 de             	mov    %rbx,%rsi
   2c655:	4c 89 ef             	mov    %r13,%rdi
   2c658:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2c65c:	e8 bf 60 02 00       	call   52720 <js_unary_arith_slow>
   2c661:	85 c0                	test   %eax,%eax
   2c663:	0f 84 0d cf ff ff    	je     29576 <JS_CallInternal+0x4126>
   2c669:	e9 12 96 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2c66e:	66 90                	xchg   %ax,%ax
   2c670:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2c677:	44 89 d2             	mov    %r10d,%edx
   2c67a:	48 89 de             	mov    %rbx,%rsi
   2c67d:	4c 89 ef             	mov    %r13,%rdi
   2c680:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2c684:	e8 97 60 02 00       	call   52720 <js_unary_arith_slow>
   2c689:	85 c0                	test   %eax,%eax
   2c68b:	0f 84 55 ec ff ff    	je     2b2e6 <JS_CallInternal+0x5e96>
   2c691:	e9 ea 95 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2c696:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   2c69d:	00 00 00 
   2c6a0:	31 c9                	xor    %ecx,%ecx
   2c6a2:	48 8b 33             	mov    (%rbx),%rsi
   2c6a5:	8b 7e fc             	mov    -0x4(%rsi),%edi
   2c6a8:	8d 57 ff             	lea    -0x1(%rdi),%edx
   2c6ab:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2c6ae:	85 d2                	test   %edx,%edx
   2c6b0:	0f 8e 02 15 00 00    	jle    2dbb8 <JS_CallInternal+0x8768>
   2c6b6:	49 8b 40 08          	mov    0x8(%r8),%rax
   2c6ba:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2c6bd:	76 14                	jbe    2c6d3 <JS_CallInternal+0x7283>
   2c6bf:	49 8b 10             	mov    (%r8),%rdx
   2c6c2:	8b 7a fc             	mov    -0x4(%rdx),%edi
   2c6c5:	8d 77 ff             	lea    -0x1(%rdi),%esi
   2c6c8:	89 72 fc             	mov    %esi,-0x4(%rdx)
   2c6cb:	85 f6                	test   %esi,%esi
   2c6cd:	0f 8e 12 15 00 00    	jle    2dbe5 <JS_CallInternal+0x8795>
   2c6d3:	83 f9 ff             	cmp    $0xffffffff,%ecx
   2c6d6:	0f 85 23 e4 ff ff    	jne    2aaff <JS_CallInternal+0x56af>
   2c6dc:	e9 9f 95 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2c6e1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2c6e8:	48 89 ce             	mov    %rcx,%rsi
   2c6eb:	4c 89 ef             	mov    %r13,%rdi
   2c6ee:	4c 89 95 a8 fd ff ff 	mov    %r10,-0x258(%rbp)
   2c6f5:	4c 89 85 d0 fd ff ff 	mov    %r8,-0x230(%rbp)
   2c6fc:	48 89 8d e8 fd ff ff 	mov    %rcx,-0x218(%rbp)
   2c703:	4c 89 8d a0 fd ff ff 	mov    %r9,-0x260(%rbp)
   2c70a:	e8 41 12 01 00       	call   3d950 <expand_fast_array>
   2c70f:	48 8b 8d e8 fd ff ff 	mov    -0x218(%rbp),%rcx
   2c716:	4c 8b 85 d0 fd ff ff 	mov    -0x230(%rbp),%r8
   2c71d:	83 f8 ff             	cmp    $0xffffffff,%eax
   2c720:	4c 8b 95 a8 fd ff ff 	mov    -0x258(%rbp),%r10
   2c727:	4c 8b 8d a0 fd ff ff 	mov    -0x260(%rbp),%r9
   2c72e:	0f 84 24 2c 00 00    	je     2f358 <JS_CallInternal+0x9f08>
   2c734:	8b 85 f0 fd ff ff    	mov    -0x210(%rbp),%eax
   2c73a:	89 41 38             	mov    %eax,0x38(%rcx)
   2c73d:	31 c0                	xor    %eax,%eax
   2c73f:	90                   	nop
   2c740:	f3 41 0f 6f 04 00    	movdqu (%r8,%rax,1),%xmm0
   2c746:	48 8b 51 30          	mov    0x30(%rcx),%rdx
   2c74a:	0f 11 04 02          	movups %xmm0,(%rdx,%rax,1)
   2c74e:	48 83 c0 10          	add    $0x10,%rax
   2c752:	4c 39 c8             	cmp    %r9,%rax
   2c755:	75 e9                	jne    2c740 <JS_CallInternal+0x72f0>
   2c757:	48 8b 51 20          	mov    0x20(%rcx),%rdx
   2c75b:	48 8b 9d c0 fd ff ff 	mov    -0x240(%rbp),%rbx
   2c762:	48 8b 42 08          	mov    0x8(%rdx),%rax
   2c766:	48 8b 32             	mov    (%rdx),%rsi
   2c769:	48 c7 42 08 00 00 00 	movq   $0x0,0x8(%rdx)
   2c770:	00 
   2c771:	48 89 1a             	mov    %rbx,(%rdx)
   2c774:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2c777:	0f 86 d1 a3 ff ff    	jbe    26b4e <JS_CallInternal+0x16fe>
   2c77d:	8b 5e fc             	mov    -0x4(%rsi),%ebx
   2c780:	8d 53 ff             	lea    -0x1(%rbx),%edx
   2c783:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2c786:	85 d2                	test   %edx,%edx
   2c788:	0f 8f c0 a3 ff ff    	jg     26b4e <JS_CallInternal+0x16fe>
   2c78e:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2c792:	48 89 c2             	mov    %rax,%rdx
   2c795:	4c 89 95 d0 fd ff ff 	mov    %r10,-0x230(%rbp)
   2c79c:	48 89 8d e8 fd ff ff 	mov    %rcx,-0x218(%rbp)
   2c7a3:	4c 89 85 f0 fd ff ff 	mov    %r8,-0x210(%rbp)
   2c7aa:	e8 f1 21 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2c7af:	4c 8b 95 d0 fd ff ff 	mov    -0x230(%rbp),%r10
   2c7b6:	48 8b 8d e8 fd ff ff 	mov    -0x218(%rbp),%rcx
   2c7bd:	4c 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8
   2c7c4:	e9 85 a3 ff ff       	jmp    26b4e <JS_CallInternal+0x16fe>
   2c7c9:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2c7cd:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
   2c7d2:	b8 08 00 00 00       	mov    $0x8,%eax
   2c7d7:	e9 d1 b1 ff ff       	jmp    279ad <JS_CallInternal+0x255d>
   2c7dc:	48 8b bd 70 fe ff ff 	mov    -0x190(%rbp),%rdi
   2c7e3:	4c 03 4f 30          	add    0x30(%rdi),%r9
   2c7e7:	80 79 11 00          	cmpb   $0x0,0x11(%rcx)
   2c7eb:	0f 84 c6 14 00 00    	je     2dcb7 <JS_CallInternal+0x8867>
   2c7f1:	41 83 fa 3a          	cmp    $0x3a,%r10d
   2c7f5:	0f 84 c4 99 ff ff    	je     261bf <JS_CallInternal+0xd6f>
   2c7fb:	4c 89 9d f0 fd ff ff 	mov    %r11,-0x210(%rbp)
   2c802:	41 8b 71 04          	mov    0x4(%r9),%esi
   2c806:	4c 89 ef             	mov    %r13,%rdi
   2c809:	83 fa 04             	cmp    $0x4,%edx
   2c80c:	0f 84 30 3b 00 00    	je     30342 <JS_CallInternal+0xaef2>
   2c812:	e8 f9 90 00 00       	call   35910 <JS_ThrowTypeErrorReadOnly.part.0>
   2c817:	4c 8b a5 f0 fd ff ff 	mov    -0x210(%rbp),%r12
   2c81e:	e9 5d 94 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2c823:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2c828:	41 8b 4c 24 01       	mov    0x1(%r12),%ecx
   2c82d:	49 8d 4c 0c 01       	lea    0x1(%r12,%rcx,1),%rcx
   2c832:	66 83 78 12 01       	cmpw   $0x1,0x12(%rax)
   2c837:	0f 85 c7 c1 ff ff    	jne    28a04 <JS_CallInternal+0x35b4>
   2c83d:	f6 40 10 08          	testb  $0x8,0x10(%rax)
   2c841:	0f 85 bd c1 ff ff    	jne    28a04 <JS_CallInternal+0x35b4>
   2c847:	48 8b 78 18          	mov    0x18(%rax),%rdi
   2c84b:	48 39 39             	cmp    %rdi,(%rcx)
   2c84e:	0f 85 b0 c1 ff ff    	jne    28a04 <JS_CallInternal+0x35b4>
   2c854:	8b 51 10             	mov    0x10(%rcx),%edx
   2c857:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   2c85b:	48 c1 e2 04          	shl    $0x4,%rdx
   2c85f:	48 03 50 20          	add    0x20(%rax),%rdx
   2c863:	48 89 d0             	mov    %rdx,%rax
   2c866:	48 8b 12             	mov    (%rdx),%rdx
   2c869:	48 8b 40 08          	mov    0x8(%rax),%rax
   2c86d:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2c870:	76 04                	jbe    2c876 <JS_CallInternal+0x7426>
   2c872:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2c876:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2c87a:	49 8d 44 24 05       	lea    0x5(%r12),%rax
   2c87f:	48 89 13             	mov    %rdx,(%rbx)
   2c882:	4c 8d 60 01          	lea    0x1(%rax),%r12
   2c886:	0f b6 00             	movzbl (%rax),%eax
   2c889:	48 89 cb             	mov    %rcx,%rbx
   2c88c:	49 89 c2             	mov    %rax,%r10
   2c88f:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2c893:	8b 00                	mov    (%rax),%eax
   2c895:	25 ff ff ff 03       	and    $0x3ffffff,%eax
   2c89a:	0f 85 1f 94 ff ff    	jne    25cbf <JS_CallInternal+0x86f>
   2c8a0:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2c8a7:	48 83 ec 08          	sub    $0x8,%rsp
   2c8ab:	31 c9                	xor    %ecx,%ecx
   2c8ad:	45 31 c9             	xor    %r9d,%r9d
   2c8b0:	45 31 c0             	xor    %r8d,%r8d
   2c8b3:	4c 89 ef             	mov    %r13,%rdi
   2c8b6:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2c8ba:	48 8b 85 68 fe ff ff 	mov    -0x198(%rbp),%rax
   2c8c1:	48 8b b0 d8 04 00 00 	mov    0x4d8(%rax),%rsi
   2c8c8:	48 8b 90 e0 04 00 00 	mov    0x4e0(%rax),%rdx
   2c8cf:	6a 00                	push   $0x0
   2c8d1:	e8 9a 6f 00 00       	call   33870 <build_backtrace>
   2c8d6:	59                   	pop    %rcx
   2c8d7:	5e                   	pop    %rsi
   2c8d8:	e9 f4 93 ff ff       	jmp    25cd1 <JS_CallInternal+0x881>
   2c8dd:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   2c8e4:	48 c7 43 08 01 00 00 	movq   $0x1,0x8(%rbx)
   2c8eb:	00 
   2c8ec:	e9 49 e2 ff ff       	jmp    2ab3a <JS_CallInternal+0x56ea>
   2c8f1:	48 8b bd 80 fe ff ff 	mov    -0x180(%rbp),%rdi
   2c8f8:	49 89 d1             	mov    %rdx,%r9
   2c8fb:	49 89 f2             	mov    %rsi,%r10
   2c8fe:	48 89 ca             	mov    %rcx,%rdx
   2c901:	49 89 d0             	mov    %rdx,%r8
   2c904:	48 89 c1             	mov    %rax,%rcx
   2c907:	4c 89 ce             	mov    %r9,%rsi
   2c90a:	4c 89 d2             	mov    %r10,%rdx
   2c90d:	4c 89 67 30          	mov    %r12,0x30(%rdi)
   2c911:	4c 89 ef             	mov    %r13,%rdi
   2c914:	e8 47 43 00 00       	call   30c60 <JS_GetPropertyValue>
   2c919:	48 89 c1             	mov    %rax,%rcx
   2c91c:	48 89 d0             	mov    %rdx,%rax
   2c91f:	83 fa 06             	cmp    $0x6,%edx
   2c922:	0f 84 e1 34 00 00    	je     2fe09 <JS_CallInternal+0xa9b9>
   2c928:	48 89 ca             	mov    %rcx,%rdx
   2c92b:	e9 ff ba ff ff       	jmp    2842f <JS_CallInternal+0x2fdf>
   2c930:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2c937:	49 89 f0             	mov    %rsi,%r8
   2c93a:	4c 89 d2             	mov    %r10,%rdx
   2c93d:	4c 89 ce             	mov    %r9,%rsi
   2c940:	4c 89 ef             	mov    %r13,%rdi
   2c943:	4c 89 8d e8 fd ff ff 	mov    %r9,-0x218(%rbp)
   2c94a:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2c94e:	4c 89 95 f0 fd ff ff 	mov    %r10,-0x210(%rbp)
   2c955:	e8 06 43 00 00       	call   30c60 <JS_GetPropertyValue>
   2c95a:	48 89 c1             	mov    %rax,%rcx
   2c95d:	48 89 d0             	mov    %rdx,%rax
   2c960:	83 fa 06             	cmp    $0x6,%edx
   2c963:	0f 84 10 36 00 00    	je     2ff79 <JS_CallInternal+0xab29>
   2c969:	4c 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%r10
   2c970:	4c 8b 8d e8 fd ff ff 	mov    -0x218(%rbp),%r9
   2c977:	e9 28 ba ff ff       	jmp    283a4 <JS_CallInternal+0x2f54>
   2c97c:	41 8b 4c 24 01       	mov    0x1(%r12),%ecx
   2c981:	49 8d 4c 0c 01       	lea    0x1(%r12,%rcx,1),%rcx
   2c986:	66 83 78 12 01       	cmpw   $0x1,0x12(%rax)
   2c98b:	0f 85 77 cd ff ff    	jne    29708 <JS_CallInternal+0x42b8>
   2c991:	f6 40 10 08          	testb  $0x8,0x10(%rax)
   2c995:	0f 85 6d cd ff ff    	jne    29708 <JS_CallInternal+0x42b8>
   2c99b:	48 8b 78 18          	mov    0x18(%rax),%rdi
   2c99f:	48 39 39             	cmp    %rdi,(%rcx)
   2c9a2:	0f 85 60 cd ff ff    	jne    29708 <JS_CallInternal+0x42b8>
   2c9a8:	8b 51 10             	mov    0x10(%rcx),%edx
   2c9ab:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   2c9af:	48 c1 e2 04          	shl    $0x4,%rdx
   2c9b3:	48 03 50 20          	add    0x20(%rax),%rdx
   2c9b7:	48 89 d0             	mov    %rdx,%rax
   2c9ba:	48 8b 12             	mov    (%rdx),%rdx
   2c9bd:	48 8b 40 08          	mov    0x8(%rax),%rax
   2c9c1:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2c9c4:	76 04                	jbe    2c9ca <JS_CallInternal+0x757a>
   2c9c6:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2c9ca:	48 89 43 08          	mov    %rax,0x8(%rbx)
   2c9ce:	49 8d 44 24 05       	lea    0x5(%r12),%rax
   2c9d3:	48 89 13             	mov    %rdx,(%rbx)
   2c9d6:	4c 8d 60 01          	lea    0x1(%rax),%r12
   2c9da:	0f b6 00             	movzbl (%rax),%eax
   2c9dd:	48 89 cb             	mov    %rcx,%rbx
   2c9e0:	49 89 c2             	mov    %rax,%r10
   2c9e3:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2c9e7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   2c9ee:	00 00 
   2c9f0:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2c9f7:	48 8d 7b f0          	lea    -0x10(%rbx),%rdi
   2c9fb:	41 b9 00 80 00 00    	mov    $0x8000,%r9d
   2ca01:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2ca05:	48 8d 43 e0          	lea    -0x20(%rbx),%rax
   2ca09:	48 8b 08             	mov    (%rax),%rcx
   2ca0c:	48 83 eb 30          	sub    $0x30,%rbx
   2ca10:	48 8b 33             	mov    (%rbx),%rsi
   2ca13:	4c 8b 40 08          	mov    0x8(%rax),%r8
   2ca17:	48 8b 53 08          	mov    0x8(%rbx),%rdx
   2ca1b:	ff 77 08             	push   0x8(%rdi)
   2ca1e:	ff 37                	push   (%rdi)
   2ca20:	4c 89 ef             	mov    %r13,%rdi
   2ca23:	e8 f8 55 00 00       	call   32020 <JS_SetPropertyValue>
   2ca28:	48 8b 73 08          	mov    0x8(%rbx),%rsi
   2ca2c:	41 5a                	pop    %r10
   2ca2e:	41 5b                	pop    %r11
   2ca30:	83 fe f6             	cmp    $0xfffffff6,%esi
   2ca33:	76 14                	jbe    2ca49 <JS_CallInternal+0x75f9>
   2ca35:	48 8b 0b             	mov    (%rbx),%rcx
   2ca38:	8b 79 fc             	mov    -0x4(%rcx),%edi
   2ca3b:	8d 57 ff             	lea    -0x1(%rdi),%edx
   2ca3e:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2ca41:	85 d2                	test   %edx,%edx
   2ca43:	0f 8e 39 2c 00 00    	jle    2f682 <JS_CallInternal+0xa232>
   2ca49:	85 c0                	test   %eax,%eax
   2ca4b:	0f 89 f1 b4 ff ff    	jns    27f42 <JS_CallInternal+0x2af2>
   2ca51:	e9 2a 92 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2ca56:	8b 10                	mov    (%rax),%edx
   2ca58:	81 e2 ff ff ff 03    	and    $0x3ffffff,%edx
   2ca5e:	0f 85 5b ba ff ff    	jne    284bf <JS_CallInternal+0x306f>
   2ca64:	48 8b bd f0 fd ff ff 	mov    -0x210(%rbp),%rdi
   2ca6b:	48 83 ec 08          	sub    $0x8,%rsp
   2ca6f:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2ca76:	4c 89 9d e8 fd ff ff 	mov    %r11,-0x218(%rbp)
   2ca7d:	4c 8b 43 f0          	mov    -0x10(%rbx),%r8
   2ca81:	4c 8b 4b f8          	mov    -0x8(%rbx),%r9
   2ca85:	4c 89 da             	mov    %r11,%rdx
   2ca88:	4c 89 d6             	mov    %r10,%rsi
   2ca8b:	48 89 78 30          	mov    %rdi,0x30(%rax)
   2ca8f:	4c 89 ef             	mov    %r13,%rdi
   2ca92:	4c 89 95 d0 fd ff ff 	mov    %r10,-0x230(%rbp)
   2ca99:	68 00 80 00 00       	push   $0x8000
   2ca9e:	41 53                	push   %r11
   2caa0:	41 52                	push   %r10
   2caa2:	e8 c9 48 00 00       	call   31370 <JS_SetPropertyInternal>
   2caa7:	4c 8b 9d e8 fd ff ff 	mov    -0x218(%rbp),%r11
   2caae:	48 83 c4 20          	add    $0x20,%rsp
   2cab2:	41 83 fb f6          	cmp    $0xfffffff6,%r11d
   2cab6:	76 1a                	jbe    2cad2 <JS_CallInternal+0x7682>
   2cab8:	4c 8b 95 d0 fd ff ff 	mov    -0x230(%rbp),%r10
   2cabf:	41 8b 4a fc          	mov    -0x4(%r10),%ecx
   2cac3:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2cac6:	41 89 52 fc          	mov    %edx,-0x4(%r10)
   2caca:	85 d2                	test   %edx,%edx
   2cacc:	0f 8e 0c 2c 00 00    	jle    2f6de <JS_CallInternal+0xa28e>
   2cad2:	48 83 eb 20          	sub    $0x20,%rbx
   2cad6:	85 c0                	test   %eax,%eax
   2cad8:	0f 89 55 ba ff ff    	jns    28533 <JS_CallInternal+0x30e3>
   2cade:	4c 8b a5 f0 fd ff ff 	mov    -0x210(%rbp),%r12
   2cae5:	e9 96 91 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2caea:	48 c7 85 10 fd ff ff 	movq   $0x0,-0x2f0(%rbp)
   2caf1:	00 00 00 00 
   2caf5:	48 8b b5 a8 fd ff ff 	mov    -0x258(%rbp),%rsi
   2cafc:	31 c9                	xor    %ecx,%ecx
   2cafe:	4c 89 ef             	mov    %r13,%rdi
   2cb01:	44 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%r9d
   2cb08:	48 8b 95 a0 fd ff ff 	mov    -0x260(%rbp),%rdx
   2cb0f:	48 c7 85 18 fd ff ff 	movq   $0x3,-0x2e8(%rbp)
   2cb16:	03 00 00 00 
   2cb1a:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   2cb20:	6a 00                	push   $0x0
   2cb22:	41 52                	push   %r10
   2cb24:	4c 89 95 e8 fd ff ff 	mov    %r10,-0x218(%rbp)
   2cb2b:	ff b5 18 fd ff ff    	push   -0x2e8(%rbp)
   2cb31:	ff b5 10 fd ff ff    	push   -0x2f0(%rbp)
   2cb37:	e8 14 89 ff ff       	call   25450 <JS_CallInternal>
   2cb3c:	4c 8b 95 e8 fd ff ff 	mov    -0x218(%rbp),%r10
   2cb43:	48 83 c4 20          	add    $0x20,%rsp
   2cb47:	48 89 c6             	mov    %rax,%rsi
   2cb4a:	e9 8e c8 ff ff       	jmp    293dd <JS_CallInternal+0x3f8d>
   2cb4f:	31 c9                	xor    %ecx,%ecx
   2cb51:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   2cb57:	e9 54 c8 ff ff       	jmp    293b0 <JS_CallInternal+0x3f60>
   2cb5c:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2cb63:	48 89 de             	mov    %rbx,%rsi
   2cb66:	4c 89 ef             	mov    %r13,%rdi
   2cb69:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2cb6d:	e8 3e 61 02 00       	call   52cb0 <js_not_slow>
   2cb72:	85 c0                	test   %eax,%eax
   2cb74:	0f 84 73 aa ff ff    	je     275ed <JS_CallInternal+0x219d>
   2cb7a:	e9 01 91 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2cb7f:	90                   	nop
   2cb80:	48 89 c6             	mov    %rax,%rsi
   2cb83:	4c 89 ef             	mov    %r13,%rdi
   2cb86:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   2cb8d:	e8 4e 43 ff ff       	call   20ee0 <JS_ToBoolFree>
   2cb92:	48 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%rcx
   2cb99:	e9 dc aa ff ff       	jmp    2767a <JS_CallInternal+0x222a>
   2cb9e:	48 89 c6             	mov    %rax,%rsi
   2cba1:	4c 89 ef             	mov    %r13,%rdi
   2cba4:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   2cbab:	e8 30 43 ff ff       	call   20ee0 <JS_ToBoolFree>
   2cbb0:	48 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%rcx
   2cbb7:	e9 6a ab ff ff       	jmp    27726 <JS_CallInternal+0x22d6>
   2cbbc:	48 89 c6             	mov    %rax,%rsi
   2cbbf:	4c 89 ef             	mov    %r13,%rdi
   2cbc2:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   2cbc9:	e8 12 43 ff ff       	call   20ee0 <JS_ToBoolFree>
   2cbce:	48 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%rcx
   2cbd5:	e9 f6 aa ff ff       	jmp    276d0 <JS_CallInternal+0x2280>
   2cbda:	48 89 c6             	mov    %rax,%rsi
   2cbdd:	4c 89 ef             	mov    %r13,%rdi
   2cbe0:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   2cbe7:	e8 f4 42 ff ff       	call   20ee0 <JS_ToBoolFree>
   2cbec:	48 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%rcx
   2cbf3:	e9 83 ab ff ff       	jmp    2777b <JS_CallInternal+0x232b>
   2cbf8:	48 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%rax
   2cbff:	4c 89 d1             	mov    %r10,%rcx
   2cc02:	4d 89 c8             	mov    %r9,%r8
   2cc05:	4c 89 ef             	mov    %r13,%rdi
   2cc08:	48 8b 95 e8 fd ff ff 	mov    -0x218(%rbp),%rdx
   2cc0f:	4c 89 8d c0 fd ff ff 	mov    %r9,-0x240(%rbp)
   2cc16:	48 89 c6             	mov    %rax,%rsi
   2cc19:	4c 89 95 d0 fd ff ff 	mov    %r10,-0x230(%rbp)
   2cc20:	4c 89 8d d8 fd ff ff 	mov    %r9,-0x228(%rbp)
   2cc27:	e8 44 7d 00 00       	call   34970 <JS_CheckBrand>
   2cc2c:	83 f8 ff             	cmp    $0xffffffff,%eax
   2cc2f:	0f 84 4b 90 ff ff    	je     25c80 <JS_CallInternal+0x830>
   2cc35:	4c 8b 95 d0 fd ff ff 	mov    -0x230(%rbp),%r10
   2cc3c:	4c 8b 9d d8 fd ff ff 	mov    -0x228(%rbp),%r11
   2cc43:	48 98                	cltq
   2cc45:	4c 8b 8d c0 fd ff ff 	mov    -0x240(%rbp),%r9
   2cc4c:	e9 75 a1 ff ff       	jmp    26dc6 <JS_CallInternal+0x1976>
   2cc51:	31 c9                	xor    %ecx,%ecx
   2cc53:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   2cc59:	e9 e2 c5 ff ff       	jmp    29240 <JS_CallInternal+0x3df0>
   2cc5e:	48 8b b5 c0 fd ff ff 	mov    -0x240(%rbp),%rsi
   2cc65:	45 89 d9             	mov    %r11d,%r9d
   2cc68:	31 c9                	xor    %ecx,%ecx
   2cc6a:	4c 89 ef             	mov    %r13,%rdi
   2cc6d:	48 8b 95 b0 fd ff ff 	mov    -0x250(%rbp),%rdx
   2cc74:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   2cc7a:	48 c7 85 20 fd ff ff 	movq   $0x0,-0x2e0(%rbp)
   2cc81:	00 00 00 00 
   2cc85:	48 c7 85 28 fd ff ff 	movq   $0x3,-0x2d8(%rbp)
   2cc8c:	03 00 00 00 
   2cc90:	6a 02                	push   $0x2
   2cc92:	41 52                	push   %r10
   2cc94:	4c 89 95 a8 fd ff ff 	mov    %r10,-0x258(%rbp)
   2cc9b:	ff b5 28 fd ff ff    	push   -0x2d8(%rbp)
   2cca1:	ff b5 20 fd ff ff    	push   -0x2e0(%rbp)
   2cca7:	44 89 9d d0 fd ff ff 	mov    %r11d,-0x230(%rbp)
   2ccae:	e8 9d 87 ff ff       	call   25450 <JS_CallInternal>
   2ccb3:	4c 8b 95 a8 fd ff ff 	mov    -0x258(%rbp),%r10
   2ccba:	44 8b 9d d0 fd ff ff 	mov    -0x230(%rbp),%r11d
   2ccc1:	48 83 c4 20          	add    $0x20,%rsp
   2ccc5:	48 89 85 c0 fd ff ff 	mov    %rax,-0x240(%rbp)
   2cccc:	48 89 95 e8 fd ff ff 	mov    %rdx,-0x218(%rbp)
   2ccd3:	e9 b0 c5 ff ff       	jmp    29288 <JS_CallInternal+0x3e38>
   2ccd8:	48 92                	xchg   %rax,%rdx
   2ccda:	4c 89 ef             	mov    %r13,%rdi
   2ccdd:	48 89 c6             	mov    %rax,%rsi
   2cce0:	e8 fb 41 ff ff       	call   20ee0 <JS_ToBoolFree>
   2cce5:	e9 54 9f ff ff       	jmp    26c3e <JS_CallInternal+0x17ee>
   2ccea:	f6 40 10 08          	testb  $0x8,0x10(%rax)
   2ccee:	0f 85 0e e3 ff ff    	jne    2b002 <JS_CallInternal+0x5bb2>
   2ccf4:	49 39 3a             	cmp    %rdi,(%r10)
   2ccf7:	0f 85 05 e3 ff ff    	jne    2b002 <JS_CallInternal+0x5bb2>
   2ccfd:	41 8b 52 10          	mov    0x10(%r10),%edx
   2cd01:	83 fa ff             	cmp    $0xffffffff,%edx
   2cd04:	0f 84 f8 e2 ff ff    	je     2b002 <JS_CallInternal+0x5bb2>
   2cd0a:	48 c1 e2 04          	shl    $0x4,%rdx
   2cd0e:	48 03 50 20          	add    0x20(%rax),%rdx
   2cd12:	48 89 d0             	mov    %rdx,%rax
   2cd15:	48 8b 12             	mov    (%rdx),%rdx
   2cd18:	48 8b 48 08          	mov    0x8(%rax),%rcx
   2cd1c:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2cd1f:	76 04                	jbe    2cd25 <JS_CallInternal+0x78d5>
   2cd21:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2cd25:	49 89 d1             	mov    %rdx,%r9
   2cd28:	e9 44 e3 ff ff       	jmp    2b071 <JS_CallInternal+0x5c21>
   2cd2d:	0f 1f 00             	nopl   (%rax)
   2cd30:	41 f6 42 10 08       	testb  $0x8,0x10(%r10)
   2cd35:	0f 85 fb e1 ff ff    	jne    2af36 <JS_CallInternal+0x5ae6>
   2cd3b:	49 8b 49 08          	mov    0x8(%r9),%rcx
   2cd3f:	49 8b 11             	mov    (%r9),%rdx
   2cd42:	48 85 c9             	test   %rcx,%rcx
   2cd45:	0f 84 58 26 00 00    	je     2f3a3 <JS_CallInternal+0x9f53>
   2cd4b:	49 8b 43 30          	mov    0x30(%r11),%rax
   2cd4f:	4c 39 da             	cmp    %r11,%rdx
   2cd52:	0f 85 de e1 ff ff    	jne    2af36 <JS_CallInternal+0x5ae6>
   2cd58:	48 85 c0             	test   %rax,%rax
   2cd5b:	0f 84 d5 e1 ff ff    	je     2af36 <JS_CallInternal+0x5ae6>
   2cd61:	66 83 78 12 01       	cmpw   $0x1,0x12(%rax)
   2cd66:	0f 85 ca e1 ff ff    	jne    2af36 <JS_CallInternal+0x5ae6>
   2cd6c:	f6 40 10 08          	testb  $0x8,0x10(%rax)
   2cd70:	0f 85 c0 e1 ff ff    	jne    2af36 <JS_CallInternal+0x5ae6>
   2cd76:	48 3b 48 18          	cmp    0x18(%rax),%rcx
   2cd7a:	0f 85 b6 e1 ff ff    	jne    2af36 <JS_CallInternal+0x5ae6>
   2cd80:	41 8b 51 10          	mov    0x10(%r9),%edx
   2cd84:	48 c1 e2 04          	shl    $0x4,%rdx
   2cd88:	48 03 50 20          	add    0x20(%rax),%rdx
   2cd8c:	48 89 d0             	mov    %rdx,%rax
   2cd8f:	48 8b 12             	mov    (%rdx),%rdx
   2cd92:	48 8b 40 08          	mov    0x8(%rax),%rax
   2cd96:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2cd99:	76 04                	jbe    2cd9f <JS_CallInternal+0x794f>
   2cd9b:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2cd9f:	48 89 d1             	mov    %rdx,%rcx
   2cda2:	e9 04 e2 ff ff       	jmp    2afab <JS_CallInternal+0x5b5b>
   2cda7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   2cdae:	00 00 
   2cdb0:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2cdb4:	48 8b 87 48 04 00 00 	mov    0x448(%rdi),%rax
   2cdbb:	48 8b 34 c8          	mov    (%rax,%rcx,8),%rsi
   2cdbf:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2cdc2:	83 e8 01             	sub    $0x1,%eax
   2cdc5:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2cdc8:	85 c0                	test   %eax,%eax
   2cdca:	0f 8f ee a0 ff ff    	jg     26ebe <JS_CallInternal+0x1a6e>
   2cdd0:	44 89 85 b0 fd ff ff 	mov    %r8d,-0x250(%rbp)
   2cdd7:	e8 c4 9b fe ff       	call   169a0 <JS_FreeAtomStruct>
   2cddc:	44 8b 85 b0 fd ff ff 	mov    -0x250(%rbp),%r8d
   2cde3:	e9 d6 a0 ff ff       	jmp    26ebe <JS_CallInternal+0x1a6e>
   2cde8:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2cdec:	44 89 c8             	mov    %r9d,%eax
   2cdef:	48 8b 97 48 04 00 00 	mov    0x448(%rdi),%rdx
   2cdf6:	48 8b 34 c2          	mov    (%rdx,%rax,8),%rsi
   2cdfa:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2cdfd:	83 e8 01             	sub    $0x1,%eax
   2ce00:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2ce03:	85 c0                	test   %eax,%eax
   2ce05:	0f 8f 7d 9b ff ff    	jg     26988 <JS_CallInternal+0x1538>
   2ce0b:	89 8d b0 fd ff ff    	mov    %ecx,-0x250(%rbp)
   2ce11:	e8 8a 9b fe ff       	call   169a0 <JS_FreeAtomStruct>
   2ce16:	8b 8d b0 fd ff ff    	mov    -0x250(%rbp),%ecx
   2ce1c:	e9 67 9b ff ff       	jmp    26988 <JS_CallInternal+0x1538>
   2ce21:	8b 30                	mov    (%rax),%esi
   2ce23:	81 e6 ff ff ff 03    	and    $0x3ffffff,%esi
   2ce29:	0f 85 9c 9a ff ff    	jne    268cb <JS_CallInternal+0x147b>
   2ce2f:	49 8b b5 80 01 00 00 	mov    0x180(%r13),%rsi
   2ce36:	4c 89 ef             	mov    %r13,%rdi
   2ce39:	49 8b 95 88 01 00 00 	mov    0x188(%r13),%rdx
   2ce40:	4c 89 8d e8 fd ff ff 	mov    %r9,-0x218(%rbp)
   2ce47:	89 8d f0 fd ff ff    	mov    %ecx,-0x210(%rbp)
   2ce4d:	e8 8e 38 04 00       	call   706e0 <JS_HasProperty>
   2ce52:	4c 8b 8d e8 fd ff ff 	mov    -0x218(%rbp),%r9
   2ce59:	85 c0                	test   %eax,%eax
   2ce5b:	0f 88 1a 35 00 00    	js     3037b <JS_CallInternal+0xaf2b>
   2ce61:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   2ce67:	b8 01 00 00 00       	mov    $0x1,%eax
   2ce6c:	0f 84 6c 9a ff ff    	je     268de <JS_CallInternal+0x148e>
   2ce72:	49 8b b5 80 01 00 00 	mov    0x180(%r13),%rsi
   2ce79:	49 8b 95 88 01 00 00 	mov    0x188(%r13),%rdx
   2ce80:	45 31 c0             	xor    %r8d,%r8d
   2ce83:	4c 89 ef             	mov    %r13,%rdi
   2ce86:	4c 89 8d f0 fd ff ff 	mov    %r9,-0x210(%rbp)
   2ce8d:	e8 5e 15 02 00       	call   4e3f0 <JS_DeleteProperty>
   2ce92:	85 c0                	test   %eax,%eax
   2ce94:	0f 88 4a 2c 00 00    	js     2fae4 <JS_CallInternal+0xa694>
   2ce9a:	0f 95 c0             	setne  %al
   2ce9d:	0f b6 c0             	movzbl %al,%eax
   2cea0:	e9 39 9a ff ff       	jmp    268de <JS_CallInternal+0x148e>
   2cea5:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2cea9:	89 c8                	mov    %ecx,%eax
   2ceab:	48 8b 97 48 04 00 00 	mov    0x448(%rdi),%rdx
   2ceb2:	48 8b 34 c2          	mov    (%rdx,%rax,8),%rsi
   2ceb6:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2ceb9:	83 e8 01             	sub    $0x1,%eax
   2cebc:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2cebf:	85 c0                	test   %eax,%eax
   2cec1:	0f 8f 90 b3 ff ff    	jg     28257 <JS_CallInternal+0x2e07>
   2cec7:	4c 89 95 d0 fd ff ff 	mov    %r10,-0x230(%rbp)
   2cece:	e8 cd 9a fe ff       	call   169a0 <JS_FreeAtomStruct>
   2ced3:	4c 8b 95 d0 fd ff ff 	mov    -0x230(%rbp),%r10
   2ceda:	e9 78 b3 ff ff       	jmp    28257 <JS_CallInternal+0x2e07>
   2cedf:	83 f9 fa             	cmp    $0xfffffffa,%ecx
   2cee2:	7d 05                	jge    2cee9 <JS_CallInternal+0x7a99>
   2cee4:	83 f9 f8             	cmp    $0xfffffff8,%ecx
   2cee7:	7d 55                	jge    2cf3e <JS_CallInternal+0x7aee>
   2cee9:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2ceed:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
   2cef1:	b9 01 00 00 00       	mov    $0x1,%ecx
   2cef6:	4c 89 ef             	mov    %r13,%rdi
   2cef9:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2cf00:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2cf04:	e8 67 6e 01 00       	call   43d70 <JS_ToStringInternal>
   2cf09:	49 89 d0             	mov    %rdx,%r8
   2cf0c:	48 89 d1             	mov    %rdx,%rcx
   2cf0f:	83 fa 06             	cmp    $0x6,%edx
   2cf12:	0f 84 68 8d ff ff    	je     25c80 <JS_CallInternal+0x830>
   2cf18:	48 8b 73 f8          	mov    -0x8(%rbx),%rsi
   2cf1c:	83 fe f6             	cmp    $0xfffffff6,%esi
   2cf1f:	76 15                	jbe    2cf36 <JS_CallInternal+0x7ae6>
   2cf21:	48 8b 7b f0          	mov    -0x10(%rbx),%rdi
   2cf25:	8b 57 fc             	mov    -0x4(%rdi),%edx
   2cf28:	83 ea 01             	sub    $0x1,%edx
   2cf2b:	89 57 fc             	mov    %edx,-0x4(%rdi)
   2cf2e:	85 d2                	test   %edx,%edx
   2cf30:	0f 8e 95 2e 00 00    	jle    2fdcb <JS_CallInternal+0xa97b>
   2cf36:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2cf3a:	4c 89 43 f8          	mov    %r8,-0x8(%rbx)
   2cf3e:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2cf45:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2cf49:	48 8b 43 f0          	mov    -0x10(%rbx),%rax
   2cf4d:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2cf50:	76 04                	jbe    2cf56 <JS_CallInternal+0x7b06>
   2cf52:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2cf56:	48 89 ca             	mov    %rcx,%rdx
   2cf59:	48 8b 73 e0          	mov    -0x20(%rbx),%rsi
   2cf5d:	48 89 c1             	mov    %rax,%rcx
   2cf60:	4c 89 ef             	mov    %r13,%rdi
   2cf63:	49 89 d0             	mov    %rdx,%r8
   2cf66:	48 8b 53 e8          	mov    -0x18(%rbx),%rdx
   2cf6a:	e8 f1 3c 00 00       	call   30c60 <JS_GetPropertyValue>
   2cf6f:	48 89 c1             	mov    %rax,%rcx
   2cf72:	48 89 d0             	mov    %rdx,%rax
   2cf75:	83 fa 06             	cmp    $0x6,%edx
   2cf78:	0f 84 02 8d ff ff    	je     25c80 <JS_CallInternal+0x830>
   2cf7e:	48 89 ca             	mov    %rcx,%rdx
   2cf81:	e9 aa b3 ff ff       	jmp    28330 <JS_CallInternal+0x2ee0>
   2cf86:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2cf8a:	89 c8                	mov    %ecx,%eax
   2cf8c:	48 8b 97 48 04 00 00 	mov    0x448(%rdi),%rdx
   2cf93:	48 8b 34 c2          	mov    (%rdx,%rax,8),%rsi
   2cf97:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2cf9a:	83 e8 01             	sub    $0x1,%eax
   2cf9d:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2cfa0:	85 c0                	test   %eax,%eax
   2cfa2:	0f 8f 4c b0 ff ff    	jg     27ff4 <JS_CallInternal+0x2ba4>
   2cfa8:	4c 89 9d b0 fd ff ff 	mov    %r11,-0x250(%rbp)
   2cfaf:	e8 ec 99 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2cfb4:	4c 8b 9d b0 fd ff ff 	mov    -0x250(%rbp),%r11
   2cfbb:	4c 8b 95 d0 fd ff ff 	mov    -0x230(%rbp),%r10
   2cfc2:	e9 2d b0 ff ff       	jmp    27ff4 <JS_CallInternal+0x2ba4>
   2cfc7:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2cfcb:	48 8b 87 48 04 00 00 	mov    0x448(%rdi),%rax
   2cfd2:	48 8b 34 c8          	mov    (%rax,%rcx,8),%rsi
   2cfd6:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2cfd9:	83 e8 01             	sub    $0x1,%eax
   2cfdc:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2cfdf:	85 c0                	test   %eax,%eax
   2cfe1:	0f 8f 74 ae ff ff    	jg     27e5b <JS_CallInternal+0x2a0b>
   2cfe7:	4c 89 9d e8 fd ff ff 	mov    %r11,-0x218(%rbp)
   2cfee:	e8 ad 99 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2cff3:	4c 8b 9d e8 fd ff ff 	mov    -0x218(%rbp),%r11
   2cffa:	e9 5c ae ff ff       	jmp    27e5b <JS_CallInternal+0x2a0b>
   2cfff:	48 89 fe             	mov    %rdi,%rsi
   2d002:	48 8b 95 80 fe ff ff 	mov    -0x180(%rbp),%rdx
   2d009:	48 8b bd 68 fe ff ff 	mov    -0x198(%rbp),%rdi
   2d010:	48 89 8d 60 fe ff ff 	mov    %rcx,-0x1a0(%rbp)
   2d017:	48 89 85 88 fe ff ff 	mov    %rax,-0x178(%rbp)
   2d01e:	e8 1d 58 ff ff       	call   22840 <close_var_refs>
   2d023:	48 8b 8d 60 fe ff ff 	mov    -0x1a0(%rbp),%rcx
   2d02a:	48 8b 85 88 fe ff ff 	mov    -0x178(%rbp),%rax
   2d031:	e9 b0 8b ff ff       	jmp    25be6 <JS_CallInternal+0x796>
   2d036:	48 8d 35 0c c5 0a 00 	lea    0xac50c(%rip),%rsi        # d9549 <_IO_stdin_used+0x549>
   2d03d:	4c 89 ef             	mov    %r13,%rdi
   2d040:	31 c0                	xor    %eax,%eax
   2d042:	e8 79 75 00 00       	call   345c0 <JS_ThrowTypeError>
   2d047:	4c 8b 85 c0 fd ff ff 	mov    -0x240(%rbp),%r8
   2d04e:	4c 8b 8d b0 fd ff ff 	mov    -0x250(%rbp),%r9
   2d055:	83 fb f6             	cmp    $0xfffffff6,%ebx
   2d058:	76 1e                	jbe    2d078 <JS_CallInternal+0x7c28>
   2d05a:	48 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%rcx
   2d061:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2d064:	89 85 c0 fd ff ff    	mov    %eax,-0x240(%rbp)
   2d06a:	83 e8 01             	sub    $0x1,%eax
   2d06d:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2d070:	85 c0                	test   %eax,%eax
   2d072:	0f 8e 8c 2a 00 00    	jle    2fb04 <JS_CallInternal+0xa6b4>
   2d078:	83 bd d0 fd ff ff f6 	cmpl   $0xfffffff6,-0x230(%rbp)
   2d07f:	76 1e                	jbe    2d09f <JS_CallInternal+0x7c4f>
   2d081:	48 8b 9d e8 fd ff ff 	mov    -0x218(%rbp),%rbx
   2d088:	8b 43 fc             	mov    -0x4(%rbx),%eax
   2d08b:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   2d091:	83 e8 01             	sub    $0x1,%eax
   2d094:	89 43 fc             	mov    %eax,-0x4(%rbx)
   2d097:	85 c0                	test   %eax,%eax
   2d099:	0f 8e 95 2a 00 00    	jle    2fb34 <JS_CallInternal+0xa6e4>
   2d09f:	ba 06 00 00 00       	mov    $0x6,%edx
   2d0a4:	31 c0                	xor    %eax,%eax
   2d0a6:	e9 b0 c0 ff ff       	jmp    2915b <JS_CallInternal+0x3d0b>
   2d0ab:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2d0b2:	31 d2                	xor    %edx,%edx
   2d0b4:	48 89 de             	mov    %rbx,%rsi
   2d0b7:	4c 89 ef             	mov    %r13,%rdi
   2d0ba:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2d0be:	e8 cd 01 03 00       	call   5d290 <js_eq_slow>
   2d0c3:	85 c0                	test   %eax,%eax
   2d0c5:	0f 84 a7 9f ff ff    	je     27072 <JS_CallInternal+0x1c22>
   2d0cb:	e9 b0 8b ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2d0d0:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2d0d7:	ba 01 00 00 00       	mov    $0x1,%edx
   2d0dc:	48 89 de             	mov    %rbx,%rsi
   2d0df:	4c 89 ef             	mov    %r13,%rdi
   2d0e2:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2d0e6:	e8 a5 01 03 00       	call   5d290 <js_eq_slow>
   2d0eb:	85 c0                	test   %eax,%eax
   2d0ed:	0f 84 2c 9f ff ff    	je     2701f <JS_CallInternal+0x1bcf>
   2d0f3:	e9 88 8b ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2d0f8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   2d0ff:	00 
   2d100:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d104:	48 89 c2             	mov    %rax,%rdx
   2d107:	89 8d c0 fd ff ff    	mov    %ecx,-0x240(%rbp)
   2d10d:	e8 8e 18 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2d112:	8b 8d c0 fd ff ff    	mov    -0x240(%rbp),%ecx
   2d118:	e9 a8 94 ff ff       	jmp    265c5 <JS_CallInternal+0x1175>
   2d11d:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2d124:	44 89 d2             	mov    %r10d,%edx
   2d127:	48 89 de             	mov    %rbx,%rsi
   2d12a:	4c 89 ef             	mov    %r13,%rdi
   2d12d:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2d131:	e8 ea 55 02 00       	call   52720 <js_unary_arith_slow>
   2d136:	85 c0                	test   %eax,%eax
   2d138:	0f 84 f0 e1 ff ff    	je     2b32e <JS_CallInternal+0x5ede>
   2d13e:	e9 3d 8b ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2d143:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2d148:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d14c:	89 c8                	mov    %ecx,%eax
   2d14e:	48 8b b7 48 04 00 00 	mov    0x448(%rdi),%rsi
   2d155:	48 8b 34 c6          	mov    (%rsi,%rax,8),%rsi
   2d159:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2d15c:	83 e8 01             	sub    $0x1,%eax
   2d15f:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2d162:	85 c0                	test   %eax,%eax
   2d164:	0f 8f bb af ff ff    	jg     28125 <JS_CallInternal+0x2cd5>
   2d16a:	4c 89 8d d0 fd ff ff 	mov    %r9,-0x230(%rbp)
   2d171:	4c 89 8d e8 fd ff ff 	mov    %r9,-0x218(%rbp)
   2d178:	48 89 95 f0 fd ff ff 	mov    %rdx,-0x210(%rbp)
   2d17f:	e8 1c 98 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2d184:	4c 8b 8d d0 fd ff ff 	mov    -0x230(%rbp),%r9
   2d18b:	4c 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%r8
   2d192:	48 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%rdx
   2d199:	e9 87 af ff ff       	jmp    28125 <JS_CallInternal+0x2cd5>
   2d19e:	45 31 e4             	xor    %r12d,%r12d
   2d1a1:	e9 45 ea ff ff       	jmp    2bbeb <JS_CallInternal+0x679b>
   2d1a6:	41 83 f8 f6          	cmp    $0xfffffff6,%r8d
   2d1aa:	76 0f                	jbe    2d1bb <JS_CallInternal+0x7d6b>
   2d1ac:	41 8b 42 fc          	mov    -0x4(%r10),%eax
   2d1b0:	83 e8 01             	sub    $0x1,%eax
   2d1b3:	41 89 42 fc          	mov    %eax,-0x4(%r10)
   2d1b7:	85 c0                	test   %eax,%eax
   2d1b9:	7e 07                	jle    2d1c2 <JS_CallInternal+0x7d72>
   2d1bb:	31 c0                	xor    %eax,%eax
   2d1bd:	e9 fb 9d ff ff       	jmp    26fbd <JS_CallInternal+0x1b6d>
   2d1c2:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d1c6:	4c 89 d6             	mov    %r10,%rsi
   2d1c9:	4c 89 c2             	mov    %r8,%rdx
   2d1cc:	e8 cf 17 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2d1d1:	31 c0                	xor    %eax,%eax
   2d1d3:	e9 e5 9d ff ff       	jmp    26fbd <JS_CallInternal+0x1b6d>
   2d1d8:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
   2d1dd:	e9 c4 93 ff ff       	jmp    265a6 <JS_CallInternal+0x1156>
   2d1e2:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d1e6:	8b 85 f0 fd ff ff    	mov    -0x210(%rbp),%eax
   2d1ec:	48 8b 97 48 04 00 00 	mov    0x448(%rdi),%rdx
   2d1f3:	48 8b 34 c2          	mov    (%rdx,%rax,8),%rsi
   2d1f7:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2d1fa:	83 e8 01             	sub    $0x1,%eax
   2d1fd:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2d200:	85 c0                	test   %eax,%eax
   2d202:	0f 8f c5 ed ff ff    	jg     2bfcd <JS_CallInternal+0x6b7d>
   2d208:	89 8d f0 fd ff ff    	mov    %ecx,-0x210(%rbp)
   2d20e:	e8 8d 97 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2d213:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   2d219:	e9 af ed ff ff       	jmp    2bfcd <JS_CallInternal+0x6b7d>
   2d21e:	83 f9 f6             	cmp    $0xfffffff6,%ecx
   2d221:	76 13                	jbe    2d236 <JS_CallInternal+0x7de6>
   2d223:	41 8b 42 fc          	mov    -0x4(%r10),%eax
   2d227:	83 e8 01             	sub    $0x1,%eax
   2d22a:	41 89 42 fc          	mov    %eax,-0x4(%r10)
   2d22e:	85 c0                	test   %eax,%eax
   2d230:	0f 8e ba 28 00 00    	jle    2faf0 <JS_CallInternal+0xa6a0>
   2d236:	b8 01 00 00 00       	mov    $0x1,%eax
   2d23b:	e9 2d 9d ff ff       	jmp    26f6d <JS_CallInternal+0x1b1d>
   2d240:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d244:	48 89 ce             	mov    %rcx,%rsi
   2d247:	e8 54 17 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2d24c:	e9 8f 8f ff ff       	jmp    261e0 <JS_CallInternal+0xd90>
   2d251:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2d258:	44 89 d2             	mov    %r10d,%edx
   2d25b:	48 89 de             	mov    %rbx,%rsi
   2d25e:	4c 89 ef             	mov    %r13,%rdi
   2d261:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2d265:	e8 b6 54 02 00       	call   52720 <js_unary_arith_slow>
   2d26a:	85 c0                	test   %eax,%eax
   2d26c:	0f 84 92 a8 ff ff    	je     27b04 <JS_CallInternal+0x26b4>
   2d272:	e9 09 8a ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2d277:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   2d27e:	00 00 
   2d280:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d284:	48 8b 8f 48 04 00 00 	mov    0x448(%rdi),%rcx
   2d28b:	48 8b 34 d1          	mov    (%rcx,%rdx,8),%rsi
   2d28f:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   2d292:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2d295:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2d298:	85 d2                	test   %edx,%edx
   2d29a:	0f 8f 26 9b ff ff    	jg     26dc6 <JS_CallInternal+0x1976>
   2d2a0:	4c 89 95 b0 fd ff ff 	mov    %r10,-0x250(%rbp)
   2d2a7:	4c 89 9d b8 fd ff ff 	mov    %r11,-0x248(%rbp)
   2d2ae:	48 89 85 c0 fd ff ff 	mov    %rax,-0x240(%rbp)
   2d2b5:	4c 89 8d d0 fd ff ff 	mov    %r9,-0x230(%rbp)
   2d2bc:	e8 df 96 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2d2c1:	4c 8b 95 b0 fd ff ff 	mov    -0x250(%rbp),%r10
   2d2c8:	4c 8b 9d b8 fd ff ff 	mov    -0x248(%rbp),%r11
   2d2cf:	48 8b 85 c0 fd ff ff 	mov    -0x240(%rbp),%rax
   2d2d6:	4c 8b 8d d0 fd ff ff 	mov    -0x230(%rbp),%r9
   2d2dd:	e9 e4 9a ff ff       	jmp    26dc6 <JS_CallInternal+0x1976>
   2d2e2:	48 8b bd 70 fe ff ff 	mov    -0x190(%rbp),%rdi
   2d2e9:	48 8b 47 30          	mov    0x30(%rdi),%rax
   2d2ed:	48 01 c8             	add    %rcx,%rax
   2d2f0:	8b 48 04             	mov    0x4(%rax),%ecx
   2d2f3:	f6 00 08             	testb  $0x8,(%rax)
   2d2f6:	0f 85 6f 32 00 00    	jne    3056b <JS_CallInternal+0xb11b>
   2d2fc:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2d303:	48 83 ec 08          	sub    $0x8,%rsp
   2d307:	41 83 ea 37          	sub    $0x37,%r10d
   2d30b:	4c 89 9d f0 fd ff ff 	mov    %r11,-0x210(%rbp)
   2d312:	4d 8b 85 80 01 00 00 	mov    0x180(%r13),%r8
   2d319:	4d 8b 8d 88 01 00 00 	mov    0x188(%r13),%r9
   2d320:	4c 89 ef             	mov    %r13,%rdi
   2d323:	4c 89 58 30          	mov    %r11,0x30(%rax)
   2d327:	49 8b b5 80 01 00 00 	mov    0x180(%r13),%rsi
   2d32e:	49 8b 95 88 01 00 00 	mov    0x188(%r13),%rdx
   2d335:	41 52                	push   %r10
   2d337:	e8 e4 32 00 00       	call   30620 <JS_GetPropertyInternal>
   2d33c:	4c 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%r11
   2d343:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2d347:	83 7b 08 06          	cmpl   $0x6,0x8(%rbx)
   2d34b:	48 89 03             	mov    %rax,(%rbx)
   2d34e:	41 58                	pop    %r8
   2d350:	41 59                	pop    %r9
   2d352:	0f 85 e8 8e ff ff    	jne    26240 <JS_CallInternal+0xdf0>
   2d358:	4d 89 dc             	mov    %r11,%r12
   2d35b:	e9 20 89 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2d360:	48 83 ec 08          	sub    $0x8,%rsp
   2d364:	48 8d 43 f0          	lea    -0x10(%rbx),%rax
   2d368:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   2d36e:	50                   	push   %rax
   2d36f:	e9 f6 f1 ff ff       	jmp    2c56a <JS_CallInternal+0x711a>
   2d374:	4c 8b a5 b0 fd ff ff 	mov    -0x250(%rbp),%r12
   2d37b:	e9 00 89 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2d380:	49 8b 72 08          	mov    0x8(%r10),%rsi
   2d384:	83 fe f6             	cmp    $0xfffffff6,%esi
   2d387:	76 14                	jbe    2d39d <JS_CallInternal+0x7f4d>
   2d389:	49 8b 3a             	mov    (%r10),%rdi
   2d38c:	8b 57 fc             	mov    -0x4(%rdi),%edx
   2d38f:	83 ea 01             	sub    $0x1,%edx
   2d392:	89 57 fc             	mov    %edx,-0x4(%rdi)
   2d395:	85 d2                	test   %edx,%edx
   2d397:	0f 8e d8 1d 00 00    	jle    2f175 <JS_CallInternal+0x9d25>
   2d39d:	49 c7 02 00 00 00 00 	movq   $0x0,(%r10)
   2d3a4:	49 c7 42 08 03 00 00 	movq   $0x3,0x8(%r10)
   2d3ab:	00 
   2d3ac:	45 85 c0             	test   %r8d,%r8d
   2d3af:	0f 88 61 11 00 00    	js     2e516 <JS_CallInternal+0x90c6>
   2d3b5:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2d3b8:	76 11                	jbe    2d3cb <JS_CallInternal+0x7f7b>
   2d3ba:	8b 79 fc             	mov    -0x4(%rcx),%edi
   2d3bd:	8d 57 ff             	lea    -0x1(%rdi),%edx
   2d3c0:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2d3c3:	85 d2                	test   %edx,%edx
   2d3c5:	0f 8e a4 29 00 00    	jle    2fd6f <JS_CallInternal+0xa91f>
   2d3cb:	8b 8d 9c fe ff ff    	mov    -0x164(%rbp),%ecx
   2d3d1:	31 d2                	xor    %edx,%edx
   2d3d3:	be 03 00 00 00       	mov    $0x3,%esi
   2d3d8:	85 c9                	test   %ecx,%ecx
   2d3da:	0f 95 c2             	setne  %dl
   2d3dd:	31 ff                	xor    %edi,%edi
   2d3df:	e9 b8 e5 ff ff       	jmp    2b99c <JS_CallInternal+0x654c>
   2d3e4:	48 8d 35 80 c1 0a 00 	lea    0xac180(%rip),%rsi        # d956b <_IO_stdin_used+0x56b>
   2d3eb:	4c 89 ef             	mov    %r13,%rdi
   2d3ee:	31 c0                	xor    %eax,%eax
   2d3f0:	e8 ab 93 00 00       	call   367a0 <JS_ThrowInternalError>
   2d3f5:	e9 86 88 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2d3fa:	b8 03 00 00 00       	mov    $0x3,%eax
   2d3ff:	31 c9                	xor    %ecx,%ecx
   2d401:	e9 a5 db ff ff       	jmp    2afab <JS_CallInternal+0x5b5b>
   2d406:	49 89 f3             	mov    %rsi,%r11
   2d409:	8b 76 ac             	mov    -0x54(%rsi),%esi
   2d40c:	89 b5 f0 fd ff ff    	mov    %esi,-0x210(%rbp)
   2d412:	83 ee 01             	sub    $0x1,%esi
   2d415:	41 89 73 ac          	mov    %esi,-0x54(%r11)
   2d419:	0f 85 95 e1 ff ff    	jne    2b5b4 <JS_CallInternal+0x6164>
   2d41f:	80 bf a0 04 00 00 02 	cmpb   $0x2,0x4a0(%rdi)
   2d426:	0f 84 88 e1 ff ff    	je     2b5b4 <JS_CallInternal+0x6164>
   2d42c:	49 8d 73 b0          	lea    -0x50(%r11),%rsi
   2d430:	48 89 95 f0 fd ff ff 	mov    %rdx,-0x210(%rbp)
   2d437:	48 89 85 e8 fd ff ff 	mov    %rax,-0x218(%rbp)
   2d43e:	e8 5d 53 ff ff       	call   227a0 <async_func_free.part.0>
   2d443:	4c 8b 9d 80 fe ff ff 	mov    -0x180(%rbp),%r11
   2d44a:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
   2d451:	48 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%rdx
   2d458:	49 03 43 28          	add    0x28(%r11),%rax
   2d45c:	48 89 c1             	mov    %rax,%rcx
   2d45f:	e9 50 e1 ff ff       	jmp    2b5b4 <JS_CallInternal+0x6164>
   2d464:	8b 02                	mov    (%rdx),%eax
   2d466:	25 ff ff ff 03       	and    $0x3ffffff,%eax
   2d46b:	0f 85 7a e0 ff ff    	jne    2b4eb <JS_CallInternal+0x609b>
   2d471:	49 8b b5 80 01 00 00 	mov    0x180(%r13),%rsi
   2d478:	4c 89 ef             	mov    %r13,%rdi
   2d47b:	49 8b 95 88 01 00 00 	mov    0x188(%r13),%rdx
   2d482:	4c 89 85 e8 fd ff ff 	mov    %r8,-0x218(%rbp)
   2d489:	89 8d f0 fd ff ff    	mov    %ecx,-0x210(%rbp)
   2d48f:	e8 4c 32 04 00       	call   706e0 <JS_HasProperty>
   2d494:	85 c0                	test   %eax,%eax
   2d496:	0f 88 4c 2e 00 00    	js     302e8 <JS_CallInternal+0xae98>
   2d49c:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   2d4a2:	0f 84 82 1b 00 00    	je     2f02a <JS_CallInternal+0x9bda>
   2d4a8:	49 8b 95 88 01 00 00 	mov    0x188(%r13),%rdx
   2d4af:	49 8b 85 80 01 00 00 	mov    0x180(%r13),%rax
   2d4b6:	83 fa f6             	cmp    $0xfffffff6,%edx
   2d4b9:	76 04                	jbe    2d4bf <JS_CallInternal+0x806f>
   2d4bb:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2d4bf:	48 89 03             	mov    %rax,(%rbx)
   2d4c2:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2d4c6:	e9 6e e0 ff ff       	jmp    2b539 <JS_CallInternal+0x60e9>
   2d4cb:	41 f6 42 10 08       	testb  $0x8,0x10(%r10)
   2d4d0:	0f 85 a1 b0 ff ff    	jne    28577 <JS_CallInternal+0x3127>
   2d4d6:	49 8b 4a 18          	mov    0x18(%r10),%rcx
   2d4da:	48 39 08             	cmp    %rcx,(%rax)
   2d4dd:	0f 85 94 b0 ff ff    	jne    28577 <JS_CallInternal+0x3127>
   2d4e3:	48 83 78 08 00       	cmpq   $0x0,0x8(%rax)
   2d4e8:	0f 85 89 b0 ff ff    	jne    28577 <JS_CallInternal+0x3127>
   2d4ee:	8b 50 10             	mov    0x10(%rax),%edx
   2d4f1:	8b 79 18             	mov    0x18(%rcx),%edi
   2d4f4:	48 8d 34 d5 00 00 00 	lea    0x0(,%rdx,8),%rsi
   2d4fb:	00 
   2d4fc:	48 8d 74 be 3c       	lea    0x3c(%rsi,%rdi,4),%rsi
   2d501:	0f b6 4c 31 03       	movzbl 0x3(%rcx,%rsi,1),%ecx
   2d506:	c0 e9 02             	shr    $0x2,%cl
   2d509:	83 e1 3a             	and    $0x3a,%ecx
   2d50c:	80 f9 02             	cmp    $0x2,%cl
   2d50f:	0f 85 62 b0 ff ff    	jne    28577 <JS_CallInternal+0x3127>
   2d515:	48 89 d0             	mov    %rdx,%rax
   2d518:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2d51d:	4c 89 ef             	mov    %r13,%rdi
   2d520:	48 83 eb 20          	sub    $0x20,%rbx
   2d524:	48 c1 e0 04          	shl    $0x4,%rax
   2d528:	49 03 42 20          	add    0x20(%r10),%rax
   2d52c:	4c 89 95 f0 fd ff ff 	mov    %r10,-0x210(%rbp)
   2d533:	49 83 c4 05          	add    $0x5,%r12
   2d537:	48 8b 30             	mov    (%rax),%rsi
   2d53a:	48 8b 50 08          	mov    0x8(%rax),%rdx
   2d53e:	0f 11 00             	movups %xmm0,(%rax)
   2d541:	4c 89 9d e8 fd ff ff 	mov    %r11,-0x218(%rbp)
   2d548:	e8 d3 15 ff ff       	call   1eb20 <JS_FreeValue>
   2d54d:	48 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%rax
   2d554:	48 8b 95 e8 fd ff ff 	mov    -0x218(%rbp),%rdx
   2d55b:	4c 89 ef             	mov    %r13,%rdi
   2d55e:	48 89 c6             	mov    %rax,%rsi
   2d561:	e8 ba 15 ff ff       	call   1eb20 <JS_FreeValue>
   2d566:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2d56c:	49 89 c2             	mov    %rax,%r10
   2d56f:	49 8b 04 c6          	mov    (%r14,%rax,8),%rax
   2d573:	ff e0                	jmp    *%rax
   2d575:	0f 1f 00             	nopl   (%rax)
   2d578:	b9 03 00 00 00       	mov    $0x3,%ecx
   2d57d:	45 31 c9             	xor    %r9d,%r9d
   2d580:	e9 ec da ff ff       	jmp    2b071 <JS_CallInternal+0x5c21>
   2d585:	0f b6 d0             	movzbl %al,%edx
   2d588:	48 8d 35 a0 bf 0a 00 	lea    0xabfa0(%rip),%rsi        # d952f <_IO_stdin_used+0x52f>
   2d58f:	4c 89 ef             	mov    %r13,%rdi
   2d592:	31 c0                	xor    %eax,%eax
   2d594:	e8 07 92 00 00       	call   367a0 <JS_ThrowInternalError>
   2d599:	e9 e2 86 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2d59e:	4c 8b a5 f0 fd ff ff 	mov    -0x210(%rbp),%r12
   2d5a5:	e9 d6 86 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2d5aa:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d5ae:	4c 89 ce             	mov    %r9,%rsi
   2d5b1:	4c 89 d2             	mov    %r10,%rdx
   2d5b4:	48 89 85 e8 fd ff ff 	mov    %rax,-0x218(%rbp)
   2d5bb:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   2d5c2:	e8 d9 13 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2d5c7:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
   2d5ce:	48 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%rcx
   2d5d5:	e9 e3 ad ff ff       	jmp    283bd <JS_CallInternal+0x2f6d>
   2d5da:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d5de:	48 89 c2             	mov    %rax,%rdx
   2d5e1:	48 89 ce             	mov    %rcx,%rsi
   2d5e4:	e8 b7 13 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2d5e9:	e9 bc a6 ff ff       	jmp    27caa <JS_CallInternal+0x285a>
   2d5ee:	48 89 f2             	mov    %rsi,%rdx
   2d5f1:	48 89 fe             	mov    %rdi,%rsi
   2d5f4:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d5f8:	48 89 8d e8 fd ff ff 	mov    %rcx,-0x218(%rbp)
   2d5ff:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   2d606:	e8 95 13 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2d60b:	48 8b 8d e8 fd ff ff 	mov    -0x218(%rbp),%rcx
   2d612:	48 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%rax
   2d619:	e9 8b d7 ff ff       	jmp    2ada9 <JS_CallInternal+0x5959>
   2d61e:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d622:	4c 89 d6             	mov    %r10,%rsi
   2d625:	4c 89 da             	mov    %r11,%rdx
   2d628:	89 8d e8 fd ff ff    	mov    %ecx,-0x218(%rbp)
   2d62e:	e8 6d 13 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2d633:	8b 8d e8 fd ff ff    	mov    -0x218(%rbp),%ecx
   2d639:	e9 ac af ff ff       	jmp    285ea <JS_CallInternal+0x319a>
   2d63e:	48 83 ec 08          	sub    $0x8,%rsp
   2d642:	8b 8d b0 fd ff ff    	mov    -0x250(%rbp),%ecx
   2d648:	4c 89 ef             	mov    %r13,%rdi
   2d64b:	49 89 d1             	mov    %rdx,%r9
   2d64e:	4c 89 9d e8 fd ff ff 	mov    %r11,-0x218(%rbp)
   2d655:	4c 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8
   2d65c:	4c 89 e6             	mov    %r12,%rsi
   2d65f:	6a 00                	push   $0x0
   2d661:	e8 ba 2f 00 00       	call   30620 <JS_GetPropertyInternal>
   2d666:	5f                   	pop    %rdi
   2d667:	4c 8b 9d e8 fd ff ff 	mov    -0x218(%rbp),%r11
   2d66e:	83 fa 06             	cmp    $0x6,%edx
   2d671:	48 89 c1             	mov    %rax,%rcx
   2d674:	41 58                	pop    %r8
   2d676:	48 89 d0             	mov    %rdx,%rax
   2d679:	0f 85 fd 88 ff ff    	jne    25f7c <JS_CallInternal+0xb2c>
   2d67f:	e9 b3 89 ff ff       	jmp    26037 <JS_CallInternal+0xbe7>
   2d684:	48 89 f2             	mov    %rsi,%rdx
   2d687:	48 89 fe             	mov    %rdi,%rsi
   2d68a:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d68e:	48 89 8d e8 fd ff ff 	mov    %rcx,-0x218(%rbp)
   2d695:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   2d69c:	e8 ff 12 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2d6a1:	48 8b 8d e8 fd ff ff 	mov    -0x218(%rbp),%rcx
   2d6a8:	48 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%rax
   2d6af:	e9 f7 af ff ff       	jmp    286ab <JS_CallInternal+0x325b>
   2d6b4:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d6b8:	48 89 c2             	mov    %rax,%rdx
   2d6bb:	e8 e0 12 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2d6c0:	e9 0e b1 ff ff       	jmp    287d3 <JS_CallInternal+0x3383>
   2d6c5:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d6c9:	48 89 ce             	mov    %rcx,%rsi
   2d6cc:	e8 cf 12 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2d6d1:	e9 da 9c ff ff       	jmp    273b0 <JS_CallInternal+0x1f60>
   2d6d6:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d6da:	48 89 c2             	mov    %rax,%rdx
   2d6dd:	48 89 ce             	mov    %rcx,%rsi
   2d6e0:	e8 bb 12 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2d6e5:	e9 6a 9d ff ff       	jmp    27454 <JS_CallInternal+0x2004>
   2d6ea:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d6ee:	48 89 c2             	mov    %rax,%rdx
   2d6f1:	48 89 ce             	mov    %rcx,%rsi
   2d6f4:	e8 a7 12 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2d6f9:	4c 8b 9d e8 fd ff ff 	mov    -0x218(%rbp),%r11
   2d700:	4c 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%r9
   2d707:	e9 e4 94 ff ff       	jmp    26bf0 <JS_CallInternal+0x17a0>
   2d70c:	48 8b 95 e8 fd ff ff 	mov    -0x218(%rbp),%rdx
   2d713:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d717:	48 89 ce             	mov    %rcx,%rsi
   2d71a:	4c 89 95 b0 fd ff ff 	mov    %r10,-0x250(%rbp)
   2d721:	48 89 85 c0 fd ff ff 	mov    %rax,-0x240(%rbp)
   2d728:	4c 89 8d d0 fd ff ff 	mov    %r9,-0x230(%rbp)
   2d72f:	4c 89 9d b8 fd ff ff 	mov    %r11,-0x248(%rbp)
   2d736:	e8 65 12 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2d73b:	4c 8b 95 b0 fd ff ff 	mov    -0x250(%rbp),%r10
   2d742:	48 8b 85 c0 fd ff ff 	mov    -0x240(%rbp),%rax
   2d749:	4c 8b 8d d0 fd ff ff 	mov    -0x230(%rbp),%r9
   2d750:	e9 98 96 ff ff       	jmp    26ded <JS_CallInternal+0x199d>
   2d755:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d759:	48 89 ce             	mov    %rcx,%rsi
   2d75c:	e8 3f 12 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2d761:	e9 2f dd ff ff       	jmp    2b495 <JS_CallInternal+0x6045>
   2d766:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d76a:	4c 89 c2             	mov    %r8,%rdx
   2d76d:	89 8d f0 fd ff ff    	mov    %ecx,-0x210(%rbp)
   2d773:	e8 28 12 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2d778:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   2d77e:	e9 5e 9d ff ff       	jmp    274e1 <JS_CallInternal+0x2091>
   2d783:	4c 8b a5 a0 fd ff ff 	mov    -0x260(%rbp),%r12
   2d78a:	e9 f1 84 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2d78f:	48 89 fe             	mov    %rdi,%rsi
   2d792:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d796:	e8 05 12 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2d79b:	e9 16 c0 ff ff       	jmp    297b6 <JS_CallInternal+0x4366>
   2d7a0:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d7a4:	48 89 c2             	mov    %rax,%rdx
   2d7a7:	48 89 ce             	mov    %rcx,%rsi
   2d7aa:	e8 f1 11 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2d7af:	e9 8e ca ff ff       	jmp    2a242 <JS_CallInternal+0x4df2>
   2d7b4:	48 89 fe             	mov    %rdi,%rsi
   2d7b7:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d7bb:	e8 e0 11 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2d7c0:	e9 d6 b8 ff ff       	jmp    2909b <JS_CallInternal+0x3c4b>
   2d7c5:	48 89 f2             	mov    %rsi,%rdx
   2d7c8:	48 89 fe             	mov    %rdi,%rsi
   2d7cb:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d7cf:	48 89 85 d0 fd ff ff 	mov    %rax,-0x230(%rbp)
   2d7d6:	48 89 8d e8 fd ff ff 	mov    %rcx,-0x218(%rbp)
   2d7dd:	e8 be 11 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2d7e2:	48 8b 85 d0 fd ff ff 	mov    -0x230(%rbp),%rax
   2d7e9:	48 8b 8d e8 fd ff ff 	mov    -0x218(%rbp),%rcx
   2d7f0:	4c 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%r9
   2d7f7:	e9 e0 c2 ff ff       	jmp    29adc <JS_CallInternal+0x468c>
   2d7fc:	48 89 f2             	mov    %rsi,%rdx
   2d7ff:	48 89 fe             	mov    %rdi,%rsi
   2d802:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d806:	48 89 85 d0 fd ff ff 	mov    %rax,-0x230(%rbp)
   2d80d:	48 89 8d e8 fd ff ff 	mov    %rcx,-0x218(%rbp)
   2d814:	4c 89 8d f0 fd ff ff 	mov    %r9,-0x210(%rbp)
   2d81b:	e8 80 11 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2d820:	48 8b 85 d0 fd ff ff 	mov    -0x230(%rbp),%rax
   2d827:	48 8b 8d e8 fd ff ff 	mov    -0x218(%rbp),%rcx
   2d82e:	4c 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%r9
   2d835:	e9 bf c2 ff ff       	jmp    29af9 <JS_CallInternal+0x46a9>
   2d83a:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d83e:	48 89 c2             	mov    %rax,%rdx
   2d841:	e8 5a 11 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2d846:	e9 dc af ff ff       	jmp    28827 <JS_CallInternal+0x33d7>
   2d84b:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d84f:	48 89 c2             	mov    %rax,%rdx
   2d852:	e8 49 11 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2d857:	e9 71 b0 ff ff       	jmp    288cd <JS_CallInternal+0x347d>
   2d85c:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d860:	48 89 c2             	mov    %rax,%rdx
   2d863:	e8 38 11 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2d868:	e9 0c b0 ff ff       	jmp    28879 <JS_CallInternal+0x3429>
   2d86d:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d871:	48 89 c2             	mov    %rax,%rdx
   2d874:	48 89 ce             	mov    %rcx,%rsi
   2d877:	e8 24 11 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2d87c:	e9 94 b0 ff ff       	jmp    28915 <JS_CallInternal+0x34c5>
   2d881:	48 89 fe             	mov    %rdi,%rsi
   2d884:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d888:	e8 13 11 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2d88d:	e9 1b b7 ff ff       	jmp    28fad <JS_CallInternal+0x3b5d>
   2d892:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d896:	48 89 ce             	mov    %rcx,%rsi
   2d899:	e8 02 11 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2d89e:	e9 56 b7 ff ff       	jmp    28ff9 <JS_CallInternal+0x3ba9>
   2d8a3:	48 89 f2             	mov    %rsi,%rdx
   2d8a6:	48 89 fe             	mov    %rdi,%rsi
   2d8a9:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d8ad:	48 89 8d d0 fd ff ff 	mov    %rcx,-0x230(%rbp)
   2d8b4:	48 89 85 e8 fd ff ff 	mov    %rax,-0x218(%rbp)
   2d8bb:	4c 89 85 f0 fd ff ff 	mov    %r8,-0x210(%rbp)
   2d8c2:	e8 d9 10 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2d8c7:	48 8b 8d d0 fd ff ff 	mov    -0x230(%rbp),%rcx
   2d8ce:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
   2d8d5:	4c 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8
   2d8dc:	e9 b5 91 ff ff       	jmp    26a96 <JS_CallInternal+0x1646>
   2d8e1:	48 89 f2             	mov    %rsi,%rdx
   2d8e4:	48 89 fe             	mov    %rdi,%rsi
   2d8e7:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d8eb:	48 89 8d d0 fd ff ff 	mov    %rcx,-0x230(%rbp)
   2d8f2:	48 89 85 e8 fd ff ff 	mov    %rax,-0x218(%rbp)
   2d8f9:	4c 89 85 f0 fd ff ff 	mov    %r8,-0x210(%rbp)
   2d900:	e8 9b 10 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2d905:	48 8b 8d d0 fd ff ff 	mov    -0x230(%rbp),%rcx
   2d90c:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
   2d913:	4c 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8
   2d91a:	e9 95 91 ff ff       	jmp    26ab4 <JS_CallInternal+0x1664>
   2d91f:	48 89 f2             	mov    %rsi,%rdx
   2d922:	48 89 fe             	mov    %rdi,%rsi
   2d925:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d929:	48 89 8d d0 fd ff ff 	mov    %rcx,-0x230(%rbp)
   2d930:	48 89 85 e8 fd ff ff 	mov    %rax,-0x218(%rbp)
   2d937:	4c 89 85 f0 fd ff ff 	mov    %r8,-0x210(%rbp)
   2d93e:	e8 5d 10 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2d943:	48 8b 8d d0 fd ff ff 	mov    -0x230(%rbp),%rcx
   2d94a:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
   2d951:	4c 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8
   2d958:	e9 1c 91 ff ff       	jmp    26a79 <JS_CallInternal+0x1629>
   2d95d:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d961:	48 89 c2             	mov    %rax,%rdx
   2d964:	e8 37 10 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2d969:	e9 f6 c0 ff ff       	jmp    29a64 <JS_CallInternal+0x4614>
   2d96e:	48 89 f2             	mov    %rsi,%rdx
   2d971:	48 89 fe             	mov    %rdi,%rsi
   2d974:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d978:	48 89 85 e8 fd ff ff 	mov    %rax,-0x218(%rbp)
   2d97f:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   2d986:	e8 15 10 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2d98b:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
   2d992:	48 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%rcx
   2d999:	e9 c5 c1 ff ff       	jmp    29b63 <JS_CallInternal+0x4713>
   2d99e:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d9a2:	48 89 c2             	mov    %rax,%rdx
   2d9a5:	e8 f6 0f ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2d9aa:	e9 61 c0 ff ff       	jmp    29a10 <JS_CallInternal+0x45c0>
   2d9af:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d9b3:	48 89 c2             	mov    %rax,%rdx
   2d9b6:	e8 e5 0f ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2d9bb:	e9 fe bf ff ff       	jmp    299be <JS_CallInternal+0x456e>
   2d9c0:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d9c4:	48 89 c2             	mov    %rax,%rdx
   2d9c7:	48 89 ce             	mov    %rcx,%rsi
   2d9ca:	e8 d1 0f ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2d9cf:	e9 96 bf ff ff       	jmp    2996a <JS_CallInternal+0x451a>
   2d9d4:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d9d8:	48 89 c2             	mov    %rax,%rdx
   2d9db:	48 89 ce             	mov    %rcx,%rsi
   2d9de:	e8 bd 0f ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2d9e3:	e9 3c bf ff ff       	jmp    29924 <JS_CallInternal+0x44d4>
   2d9e8:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2d9ec:	48 89 c2             	mov    %rax,%rdx
   2d9ef:	48 89 ce             	mov    %rcx,%rsi
   2d9f2:	e8 a9 0f ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2d9f7:	e9 e0 be ff ff       	jmp    298dc <JS_CallInternal+0x448c>
   2d9fc:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2da00:	48 89 c2             	mov    %rax,%rdx
   2da03:	48 89 ce             	mov    %rcx,%rsi
   2da06:	e8 95 0f ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2da0b:	e9 84 be ff ff       	jmp    29894 <JS_CallInternal+0x4444>
   2da10:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2da14:	48 89 ce             	mov    %rcx,%rsi
   2da17:	e8 84 0f ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2da1c:	e9 e5 bd ff ff       	jmp    29806 <JS_CallInternal+0x43b6>
   2da21:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2da25:	48 89 c2             	mov    %rax,%rdx
   2da28:	48 89 ce             	mov    %rcx,%rsi
   2da2b:	e8 70 0f ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2da30:	e9 1b c3 ff ff       	jmp    29d50 <JS_CallInternal+0x4900>
   2da35:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2da39:	48 89 c2             	mov    %rax,%rdx
   2da3c:	4c 89 8d e8 fd ff ff 	mov    %r9,-0x218(%rbp)
   2da43:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   2da4a:	e8 51 0f ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2da4f:	4c 8b 8d e8 fd ff ff 	mov    -0x218(%rbp),%r9
   2da56:	48 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%rcx
   2da5d:	e9 2d d6 ff ff       	jmp    2b08f <JS_CallInternal+0x5c3f>
   2da62:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2da66:	48 89 c2             	mov    %rax,%rdx
   2da69:	e8 32 0f ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2da6e:	e9 b8 9d ff ff       	jmp    2782b <JS_CallInternal+0x23db>
   2da73:	48 89 fe             	mov    %rdi,%rsi
   2da76:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2da7a:	e8 21 0f ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2da7f:	e9 b9 d9 ff ff       	jmp    2b43d <JS_CallInternal+0x5fed>
   2da84:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2da88:	48 89 c6             	mov    %rax,%rsi
   2da8b:	4c 89 d2             	mov    %r10,%rdx
   2da8e:	e8 0d 0f ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2da93:	e9 f2 96 ff ff       	jmp    2718a <JS_CallInternal+0x1d3a>
   2da98:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2da9c:	48 89 c2             	mov    %rax,%rdx
   2da9f:	48 89 ce             	mov    %rcx,%rsi
   2daa2:	4c 89 85 f0 fd ff ff 	mov    %r8,-0x210(%rbp)
   2daa9:	e8 f2 0e ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2daae:	4c 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8
   2dab5:	e9 b5 d6 ff ff       	jmp    2b16f <JS_CallInternal+0x5d1f>
   2daba:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dabe:	48 89 c2             	mov    %rax,%rdx
   2dac1:	48 89 ce             	mov    %rcx,%rsi
   2dac4:	e8 d7 0e ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2dac9:	e9 2c c4 ff ff       	jmp    29efa <JS_CallInternal+0x4aaa>
   2dace:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dad2:	48 89 c2             	mov    %rax,%rdx
   2dad5:	48 89 ce             	mov    %rcx,%rsi
   2dad8:	4c 89 9d f0 fd ff ff 	mov    %r11,-0x210(%rbp)
   2dadf:	e8 bc 0e ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2dae4:	4c 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%r11
   2daeb:	e9 1d 91 ff ff       	jmp    26c0d <JS_CallInternal+0x17bd>
   2daf0:	48 89 f2             	mov    %rsi,%rdx
   2daf3:	48 89 fe             	mov    %rdi,%rsi
   2daf6:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dafa:	48 89 85 e8 fd ff ff 	mov    %rax,-0x218(%rbp)
   2db01:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   2db08:	e8 93 0e ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2db0d:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
   2db14:	48 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%rcx
   2db1b:	e9 58 dc ff ff       	jmp    2b778 <JS_CallInternal+0x6328>
   2db20:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2db24:	48 89 d6             	mov    %rdx,%rsi
   2db27:	4c 89 d2             	mov    %r10,%rdx
   2db2a:	48 89 85 b0 fd ff ff 	mov    %rax,-0x250(%rbp)
   2db31:	4c 89 85 c0 fd ff ff 	mov    %r8,-0x240(%rbp)
   2db38:	44 89 8d d0 fd ff ff 	mov    %r9d,-0x230(%rbp)
   2db3f:	48 89 8d e8 fd ff ff 	mov    %rcx,-0x218(%rbp)
   2db46:	e8 55 0e ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2db4b:	48 8b 85 b0 fd ff ff 	mov    -0x250(%rbp),%rax
   2db52:	4c 8b 85 c0 fd ff ff 	mov    -0x240(%rbp),%r8
   2db59:	44 8b 8d d0 fd ff ff 	mov    -0x230(%rbp),%r9d
   2db60:	48 8b 8d e8 fd ff ff 	mov    -0x218(%rbp),%rcx
   2db67:	e9 01 ce ff ff       	jmp    2a96d <JS_CallInternal+0x551d>
   2db6c:	48 89 f2             	mov    %rsi,%rdx
   2db6f:	48 89 fe             	mov    %rdi,%rsi
   2db72:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2db76:	48 89 85 c0 fd ff ff 	mov    %rax,-0x240(%rbp)
   2db7d:	4c 89 85 d0 fd ff ff 	mov    %r8,-0x230(%rbp)
   2db84:	44 89 8d e8 fd ff ff 	mov    %r9d,-0x218(%rbp)
   2db8b:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   2db92:	e8 09 0e ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2db97:	48 8b 85 c0 fd ff ff 	mov    -0x240(%rbp),%rax
   2db9e:	4c 8b 85 d0 fd ff ff 	mov    -0x230(%rbp),%r8
   2dba5:	44 8b 8d e8 fd ff ff 	mov    -0x218(%rbp),%r9d
   2dbac:	48 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%rcx
   2dbb3:	e9 e0 cd ff ff       	jmp    2a998 <JS_CallInternal+0x5548>
   2dbb8:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dbbc:	48 89 c2             	mov    %rax,%rdx
   2dbbf:	89 8d e8 fd ff ff    	mov    %ecx,-0x218(%rbp)
   2dbc5:	4c 89 85 f0 fd ff ff 	mov    %r8,-0x210(%rbp)
   2dbcc:	e8 cf 0d ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2dbd1:	8b 8d e8 fd ff ff    	mov    -0x218(%rbp),%ecx
   2dbd7:	4c 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8
   2dbde:	e9 d3 ea ff ff       	jmp    2c6b6 <JS_CallInternal+0x7266>
   2dbe3:	31 c9                	xor    %ecx,%ecx
   2dbe5:	48 92                	xchg   %rax,%rdx
   2dbe7:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dbeb:	89 8d f0 fd ff ff    	mov    %ecx,-0x210(%rbp)
   2dbf1:	48 89 c6             	mov    %rax,%rsi
   2dbf4:	e8 a7 0d ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2dbf9:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   2dbff:	e9 cf ea ff ff       	jmp    2c6d3 <JS_CallInternal+0x7283>
   2dc04:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dc08:	48 89 ce             	mov    %rcx,%rsi
   2dc0b:	e8 90 0d ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2dc10:	e9 77 8b ff ff       	jmp    2678c <JS_CallInternal+0x133c>
   2dc15:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dc19:	4c 89 d6             	mov    %r10,%rsi
   2dc1c:	4c 89 ca             	mov    %r9,%rdx
   2dc1f:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   2dc26:	e8 75 0d ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2dc2b:	48 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%rax
   2dc32:	e9 cf 91 ff ff       	jmp    26e06 <JS_CallInternal+0x19b6>
   2dc37:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dc3b:	48 89 c2             	mov    %rax,%rdx
   2dc3e:	48 89 ce             	mov    %rcx,%rsi
   2dc41:	e8 5a 0d ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2dc46:	e9 52 ae ff ff       	jmp    28a9d <JS_CallInternal+0x364d>
   2dc4b:	48 89 fe             	mov    %rdi,%rsi
   2dc4e:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dc52:	e8 49 0d ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2dc57:	e9 20 af ff ff       	jmp    28b7c <JS_CallInternal+0x372c>
   2dc5c:	48 89 fe             	mov    %rdi,%rsi
   2dc5f:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dc63:	e8 38 0d ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2dc68:	e9 c2 af ff ff       	jmp    28c2f <JS_CallInternal+0x37df>
   2dc6d:	48 89 fe             	mov    %rdi,%rsi
   2dc70:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dc74:	e8 27 0d ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2dc79:	e9 57 af ff ff       	jmp    28bd5 <JS_CallInternal+0x3785>
   2dc7e:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dc82:	48 89 ce             	mov    %rcx,%rsi
   2dc85:	e8 16 0d ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2dc8a:	e9 ee af ff ff       	jmp    28c7d <JS_CallInternal+0x382d>
   2dc8f:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dc93:	48 89 c2             	mov    %rax,%rdx
   2dc96:	48 89 ce             	mov    %rcx,%rsi
   2dc99:	e8 02 0d ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2dc9e:	e9 ba ac ff ff       	jmp    2895d <JS_CallInternal+0x350d>
   2dca3:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dca7:	48 89 c2             	mov    %rax,%rdx
   2dcaa:	48 89 ce             	mov    %rcx,%rsi
   2dcad:	e8 ee 0c ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2dcb2:	e9 6b ae ff ff       	jmp    28b22 <JS_CallInternal+0x36d2>
   2dcb7:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2dcbe:	41 8b 49 04          	mov    0x4(%r9),%ecx
   2dcc2:	4c 89 ef             	mov    %r13,%rdi
   2dcc5:	4c 89 9d e8 fd ff ff 	mov    %r11,-0x218(%rbp)
   2dccc:	49 8b b5 80 01 00 00 	mov    0x180(%r13),%rsi
   2dcd3:	49 8b 95 88 01 00 00 	mov    0x188(%r13),%rdx
   2dcda:	4c 89 8d f0 fd ff ff 	mov    %r9,-0x210(%rbp)
   2dce1:	4c 89 58 30          	mov    %r11,0x30(%rax)
   2dce5:	e8 f6 29 04 00       	call   706e0 <JS_HasProperty>
   2dcea:	4c 8b 9d e8 fd ff ff 	mov    -0x218(%rbp),%r11
   2dcf1:	85 c0                	test   %eax,%eax
   2dcf3:	0f 88 7e 27 00 00    	js     30477 <JS_CallInternal+0xb027>
   2dcf9:	4c 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%r9
   2dd00:	0f 85 78 02 00 00    	jne    2df7e <JS_CallInternal+0x8b2e>
   2dd06:	49 8b 45 10          	mov    0x10(%r13),%rax
   2dd0a:	48 8b 80 f0 04 00 00 	mov    0x4f0(%rax),%rax
   2dd11:	48 85 c0             	test   %rax,%rax
   2dd14:	0f 84 64 02 00 00    	je     2df7e <JS_CallInternal+0x8b2e>
   2dd1a:	f6 40 3c 01          	testb  $0x1,0x3c(%rax)
   2dd1e:	0f 84 5a 02 00 00    	je     2df7e <JS_CallInternal+0x8b2e>
   2dd24:	41 8b 71 04          	mov    0x4(%r9),%esi
   2dd28:	4c 89 ef             	mov    %r13,%rdi
   2dd2b:	4c 89 9d f0 fd ff ff 	mov    %r11,-0x210(%rbp)
   2dd32:	e8 a9 88 00 00       	call   365e0 <JS_ThrowReferenceErrorNotDefined>
   2dd37:	4c 8b a5 f0 fd ff ff 	mov    -0x210(%rbp),%r12
   2dd3e:	e9 3d 7f ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2dd43:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dd47:	48 89 ce             	mov    %rcx,%rsi
   2dd4a:	e8 51 0c ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2dd4f:	e9 77 af ff ff       	jmp    28ccb <JS_CallInternal+0x387b>
   2dd54:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dd58:	48 89 ce             	mov    %rcx,%rsi
   2dd5b:	e8 40 0c ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2dd60:	e9 01 b0 ff ff       	jmp    28d66 <JS_CallInternal+0x3916>
   2dd65:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dd69:	48 89 ce             	mov    %rcx,%rsi
   2dd6c:	e8 2f 0c ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2dd71:	e9 e3 b0 ff ff       	jmp    28e59 <JS_CallInternal+0x3a09>
   2dd76:	48 89 fe             	mov    %rdi,%rsi
   2dd79:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dd7d:	e8 1e 0c ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2dd82:	e9 77 b1 ff ff       	jmp    28efe <JS_CallInternal+0x3aae>
   2dd87:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dd8b:	48 89 ce             	mov    %rcx,%rsi
   2dd8e:	e8 0d 0c ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2dd93:	e9 71 b0 ff ff       	jmp    28e09 <JS_CallInternal+0x39b9>
   2dd98:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2dd9c:	48 89 ce             	mov    %rcx,%rsi
   2dd9f:	e8 fc 0b ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2dda4:	e9 6f af ff ff       	jmp    28d18 <JS_CallInternal+0x38c8>
   2dda9:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2ddad:	48 c7 43 e8 08 00 00 	movq   $0x8,-0x18(%rbx)
   2ddb4:	00 
   2ddb5:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
   2ddba:	f2 0f 11 43 e0       	movsd  %xmm0,-0x20(%rbx)
   2ddbf:	e9 9a ca ff ff       	jmp    2a85e <JS_CallInternal+0x540e>
   2ddc4:	83 fa 08             	cmp    $0x8,%edx
   2ddc7:	0f 84 0c 21 00 00    	je     2fed9 <JS_CallInternal+0xaa89>
   2ddcd:	83 f8 08             	cmp    $0x8,%eax
   2ddd0:	0f 84 d4 20 00 00    	je     2feaa <JS_CallInternal+0xaa5a>
   2ddd6:	8d 72 07             	lea    0x7(%rdx),%esi
   2ddd9:	83 fe 01             	cmp    $0x1,%esi
   2dddc:	0f 86 86 1d 00 00    	jbe    2fb68 <JS_CallInternal+0xa718>
   2dde2:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2dde9:	48 89 de             	mov    %rbx,%rsi
   2ddec:	4c 89 ef             	mov    %r13,%rdi
   2ddef:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2ddf3:	e8 68 9a 02 00       	call   57860 <js_add_slow>
   2ddf8:	85 c0                	test   %eax,%eax
   2ddfa:	0f 84 5e ca ff ff    	je     2a85e <JS_CallInternal+0x540e>
   2de00:	e9 7b 7e ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2de05:	0f 1f 00             	nopl   (%rax)
   2de08:	83 fa 08             	cmp    $0x8,%edx
   2de0b:	0f 84 0b 1e 00 00    	je     2fc1c <JS_CallInternal+0xa7cc>
   2de11:	83 fa ff             	cmp    $0xffffffff,%edx
   2de14:	0f 84 b0 1d 00 00    	je     2fbca <JS_CallInternal+0xa77a>
   2de1a:	8d 42 fe             	lea    -0x2(%rdx),%eax
   2de1d:	83 f8 01             	cmp    $0x1,%eax
   2de20:	0f 86 77 1d 00 00    	jbe    2fb9d <JS_CallInternal+0xa74d>
   2de26:	83 fa f9             	cmp    $0xfffffff9,%edx
   2de29:	0f 85 a1 f2 ff ff    	jne    2d0d0 <JS_CallInternal+0x7c80>
   2de2f:	41 83 f8 f9          	cmp    $0xfffffff9,%r8d
   2de33:	0f 85 97 f2 ff ff    	jne    2d0d0 <JS_CallInternal+0x7c80>
   2de39:	4c 89 ce             	mov    %r9,%rsi
   2de3c:	4c 89 8d d0 fd ff ff 	mov    %r9,-0x230(%rbp)
   2de43:	4c 89 85 c0 fd ff ff 	mov    %r8,-0x240(%rbp)
   2de4a:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
   2de51:	48 89 95 b0 fd ff ff 	mov    %rdx,-0x250(%rbp)
   2de58:	e8 53 b9 fe ff       	call   197b0 <js_string_eq.isra.0>
   2de5d:	48 8b 95 b0 fd ff ff 	mov    -0x250(%rbp),%rdx
   2de64:	4c 89 ef             	mov    %r13,%rdi
   2de67:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   2de6d:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
   2de74:	48 89 c6             	mov    %rax,%rsi
   2de77:	e8 a4 0c ff ff       	call   1eb20 <JS_FreeValue>
   2de7c:	4c 8b 85 d0 fd ff ff 	mov    -0x230(%rbp),%r8
   2de83:	4c 8b 8d c0 fd ff ff 	mov    -0x240(%rbp),%r9
   2de8a:	4c 89 c6             	mov    %r8,%rsi
   2de8d:	4c 89 ca             	mov    %r9,%rdx
   2de90:	4c 89 ef             	mov    %r13,%rdi
   2de93:	e8 88 0c ff ff       	call   1eb20 <JS_FreeValue>
   2de98:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   2de9e:	e9 6a 91 ff ff       	jmp    2700d <JS_CallInternal+0x1bbd>
   2dea3:	41 83 f8 08          	cmp    $0x8,%r8d
   2dea7:	0f 84 45 1e 00 00    	je     2fcf2 <JS_CallInternal+0xa8a2>
   2dead:	41 83 f8 ff          	cmp    $0xffffffff,%r8d
   2deb1:	0f 84 f0 1d 00 00    	je     2fca7 <JS_CallInternal+0xa857>
   2deb7:	41 8d 40 fe          	lea    -0x2(%r8),%eax
   2debb:	83 f8 01             	cmp    $0x1,%eax
   2debe:	0f 86 3e 24 00 00    	jbe    30302 <JS_CallInternal+0xaeb2>
   2dec4:	41 83 f8 f9          	cmp    $0xfffffff9,%r8d
   2dec8:	0f 85 77 1d 00 00    	jne    2fc45 <JS_CallInternal+0xa7f5>
   2dece:	83 f9 f9             	cmp    $0xfffffff9,%ecx
   2ded1:	0f 85 6e 1d 00 00    	jne    2fc45 <JS_CallInternal+0xa7f5>
   2ded7:	4c 89 d6             	mov    %r10,%rsi
   2deda:	48 89 d7             	mov    %rdx,%rdi
   2dedd:	4c 89 95 d0 fd ff ff 	mov    %r10,-0x230(%rbp)
   2dee4:	48 89 8d b0 fd ff ff 	mov    %rcx,-0x250(%rbp)
   2deeb:	4c 89 85 c0 fd ff ff 	mov    %r8,-0x240(%rbp)
   2def2:	48 89 95 e8 fd ff ff 	mov    %rdx,-0x218(%rbp)
   2def9:	e8 b2 b8 fe ff       	call   197b0 <js_string_eq.isra.0>
   2defe:	48 8b 95 c0 fd ff ff 	mov    -0x240(%rbp),%rdx
   2df05:	4c 89 ef             	mov    %r13,%rdi
   2df08:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   2df0e:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
   2df15:	48 89 c6             	mov    %rax,%rsi
   2df18:	e8 03 0c ff ff       	call   1eb20 <JS_FreeValue>
   2df1d:	4c 8b 95 d0 fd ff ff 	mov    -0x230(%rbp),%r10
   2df24:	4c 8b 9d b0 fd ff ff 	mov    -0x250(%rbp),%r11
   2df2b:	4c 89 d6             	mov    %r10,%rsi
   2df2e:	4c 89 da             	mov    %r11,%rdx
   2df31:	4c 89 ef             	mov    %r13,%rdi
   2df34:	e8 e7 0b ff ff       	call   1eb20 <JS_FreeValue>
   2df39:	8b 85 f0 fd ff ff    	mov    -0x210(%rbp),%eax
   2df3f:	83 f0 01             	xor    $0x1,%eax
   2df42:	48 98                	cltq
   2df44:	e9 24 90 ff ff       	jmp    26f6d <JS_CallInternal+0x1b1d>
   2df49:	48 8d 35 64 b6 0a 00 	lea    0xab664(%rip),%rsi        # d95b4 <_IO_stdin_used+0x5b4>
   2df50:	4c 89 ef             	mov    %r13,%rdi
   2df53:	31 c0                	xor    %eax,%eax
   2df55:	e8 66 66 00 00       	call   345c0 <JS_ThrowTypeError>
   2df5a:	e9 9e 93 ff ff       	jmp    272fd <JS_CallInternal+0x1ead>
   2df5f:	48 8d 35 40 b6 0a 00 	lea    0xab640(%rip),%rsi        # d95a6 <_IO_stdin_used+0x5a6>
   2df66:	4c 89 ef             	mov    %r13,%rdi
   2df69:	31 c0                	xor    %eax,%eax
   2df6b:	e8 50 66 00 00       	call   345c0 <JS_ThrowTypeError>
   2df70:	e9 88 93 ff ff       	jmp    272fd <JS_CallInternal+0x1ead>
   2df75:	49 83 c4 04          	add    $0x4,%r12
   2df79:	e9 02 7d ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2df7e:	48 83 ec 08          	sub    $0x8,%rsp
   2df82:	48 8b 73 f0          	mov    -0x10(%rbx),%rsi
   2df86:	48 8b 7b f8          	mov    -0x8(%rbx),%rdi
   2df8a:	48 83 eb 10          	sub    $0x10,%rbx
   2df8e:	4c 89 9d f0 fd ff ff 	mov    %r11,-0x210(%rbp)
   2df95:	41 8b 49 04          	mov    0x4(%r9),%ecx
   2df99:	49 8b 85 80 01 00 00 	mov    0x180(%r13),%rax
   2dfa0:	49 8b 95 88 01 00 00 	mov    0x188(%r13),%rdx
   2dfa7:	49 89 f0             	mov    %rsi,%r8
   2dfaa:	49 89 f9             	mov    %rdi,%r9
   2dfad:	68 00 80 00 00       	push   $0x8000
   2dfb2:	4c 89 ef             	mov    %r13,%rdi
   2dfb5:	41 ff b5 88 01 00 00 	push   0x188(%r13)
   2dfbc:	48 89 c6             	mov    %rax,%rsi
   2dfbf:	41 ff b5 80 01 00 00 	push   0x180(%r13)
   2dfc6:	e8 a5 33 00 00       	call   31370 <JS_SetPropertyInternal>
   2dfcb:	48 83 c4 20          	add    $0x20,%rsp
   2dfcf:	4c 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%r11
   2dfd6:	85 c0                	test   %eax,%eax
   2dfd8:	0f 89 06 82 ff ff    	jns    261e4 <JS_CallInternal+0xd94>
   2dfde:	4d 89 dc             	mov    %r11,%r12
   2dfe1:	e9 9a 7c ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2dfe6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   2dfed:	00 00 00 
   2dff0:	48 8b bd b0 fd ff ff 	mov    -0x250(%rbp),%rdi
   2dff7:	48 89 ce             	mov    %rcx,%rsi
   2dffa:	4c 89 85 f0 fd ff ff 	mov    %r8,-0x210(%rbp)
   2e001:	e8 9a 09 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2e006:	4c 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8
   2e00d:	e9 c3 ca ff ff       	jmp    2aad5 <JS_CallInternal+0x5685>
   2e012:	44 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%r10d
   2e019:	45 85 d2             	test   %r10d,%r10d
   2e01c:	74 42                	je     2e060 <JS_CallInternal+0x8c10>
   2e01e:	4c 89 c3             	mov    %r8,%rbx
   2e021:	4f 8d 24 01          	lea    (%r9,%r8,1),%r12
   2e025:	4d 89 c6             	mov    %r8,%r14
   2e028:	eb 09                	jmp    2e033 <JS_CallInternal+0x8be3>
   2e02a:	48 83 c3 10          	add    $0x10,%rbx
   2e02e:	4c 39 e3             	cmp    %r12,%rbx
   2e031:	74 2a                	je     2e05d <JS_CallInternal+0x8c0d>
   2e033:	48 8b 43 08          	mov    0x8(%rbx),%rax
   2e037:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2e03a:	76 ee                	jbe    2e02a <JS_CallInternal+0x8bda>
   2e03c:	48 8b 0b             	mov    (%rbx),%rcx
   2e03f:	8b 79 fc             	mov    -0x4(%rcx),%edi
   2e042:	8d 57 ff             	lea    -0x1(%rdi),%edx
   2e045:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2e048:	85 d2                	test   %edx,%edx
   2e04a:	7f de                	jg     2e02a <JS_CallInternal+0x8bda>
   2e04c:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e050:	48 89 c2             	mov    %rax,%rdx
   2e053:	48 89 ce             	mov    %rcx,%rsi
   2e056:	e8 45 09 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2e05b:	eb cd                	jmp    2e02a <JS_CallInternal+0x8bda>
   2e05d:	4d 89 f0             	mov    %r14,%r8
   2e060:	4c 8b a5 b0 fd ff ff 	mov    -0x250(%rbp),%r12
   2e067:	4c 89 c3             	mov    %r8,%rbx
   2e06a:	e9 11 7c ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2e06f:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e073:	48 89 c2             	mov    %rax,%rdx
   2e076:	48 89 ce             	mov    %rcx,%rsi
   2e079:	4c 89 9d d0 fd ff ff 	mov    %r11,-0x230(%rbp)
   2e080:	e8 1b 09 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2e085:	4c 8b 9d d0 fd ff ff 	mov    -0x230(%rbp),%r11
   2e08c:	e9 b1 9f ff ff       	jmp    28042 <JS_CallInternal+0x2bf2>
   2e091:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e095:	48 89 c2             	mov    %rax,%rdx
   2e098:	48 89 ce             	mov    %rcx,%rsi
   2e09b:	4c 89 9d f0 fd ff ff 	mov    %r11,-0x210(%rbp)
   2e0a2:	e8 f9 08 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2e0a7:	4c 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%r11
   2e0ae:	e9 e9 9d ff ff       	jmp    27e9c <JS_CallInternal+0x2a4c>
   2e0b3:	49 8b 45 10          	mov    0x10(%r13),%rax
   2e0b7:	48 8b 80 f0 04 00 00 	mov    0x4f0(%rax),%rax
   2e0be:	48 85 c0             	test   %rax,%rax
   2e0c1:	0f 84 cc 11 00 00    	je     2f293 <JS_CallInternal+0x9e43>
   2e0c7:	f6 40 3c 01          	testb  $0x1,0x3c(%rax)
   2e0cb:	0f 84 c2 11 00 00    	je     2f293 <JS_CallInternal+0x9e43>
   2e0d1:	89 ce                	mov    %ecx,%esi
   2e0d3:	4c 89 ef             	mov    %r13,%rdi
   2e0d6:	89 8d f0 fd ff ff    	mov    %ecx,-0x210(%rbp)
   2e0dc:	e8 ff 84 00 00       	call   365e0 <JS_ThrowReferenceErrorNotDefined>
   2e0e1:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   2e0e7:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2e0ed:	0f 8e 8d 7b ff ff    	jle    25c80 <JS_CallInternal+0x830>
   2e0f3:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e0f7:	89 ce                	mov    %ecx,%esi
   2e0f9:	e8 b2 ce fe ff       	call   1afb0 <JS_FreeAtom.part.0.isra.0>
   2e0fe:	e9 7d 7b ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2e103:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2e108:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e10c:	48 89 c2             	mov    %rax,%rdx
   2e10f:	48 89 ce             	mov    %rcx,%rsi
   2e112:	4c 89 9d f0 fd ff ff 	mov    %r11,-0x210(%rbp)
   2e119:	e8 82 08 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2e11e:	4c 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%r11
   2e125:	e9 55 9d ff ff       	jmp    27e7f <JS_CallInternal+0x2a2f>
   2e12a:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e12e:	4c 89 d2             	mov    %r10,%rdx
   2e131:	48 89 85 e8 fd ff ff 	mov    %rax,-0x218(%rbp)
   2e138:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   2e13f:	e8 5c 08 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2e144:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
   2e14b:	48 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%rcx
   2e152:	e9 74 c5 ff ff       	jmp    2a6cb <JS_CallInternal+0x527b>
   2e157:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2e15b:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
   2e160:	48 c7 43 e8 08 00 00 	movq   $0x8,-0x18(%rbx)
   2e167:	00 
   2e168:	48 83 eb 10          	sub    $0x10,%rbx
   2e16c:	f2 0f 11 43 f0       	movsd  %xmm0,-0x10(%rbx)
   2e171:	e9 cc c5 ff ff       	jmp    2a742 <JS_CallInternal+0x52f2>
   2e176:	83 fe 08             	cmp    $0x8,%esi
   2e179:	0f 84 17 19 00 00    	je     2fa96 <JS_CallInternal+0xa646>
   2e17f:	83 f8 08             	cmp    $0x8,%eax
   2e182:	0f 85 b2 ca ff ff    	jne    2ac3a <JS_CallInternal+0x57ea>
   2e188:	85 f6                	test   %esi,%esi
   2e18a:	0f 85 aa ca ff ff    	jne    2ac3a <JS_CallInternal+0x57ea>
   2e190:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2e194:	f2 0f 2a c9          	cvtsi2sd %ecx,%xmm1
   2e198:	66 48 0f 6e c2       	movq   %rdx,%xmm0
   2e19d:	f2 0f 59 c1          	mulsd  %xmm1,%xmm0
   2e1a1:	eb bd                	jmp    2e160 <JS_CallInternal+0x8d10>
   2e1a3:	4c 8b a5 b0 fd ff ff 	mov    -0x250(%rbp),%r12
   2e1aa:	e9 d1 7a ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2e1af:	4c 8b 8d e8 fd ff ff 	mov    -0x218(%rbp),%r9
   2e1b6:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e1ba:	48 89 85 e8 fd ff ff 	mov    %rax,-0x218(%rbp)
   2e1c1:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   2e1c8:	4c 89 ca             	mov    %r9,%rdx
   2e1cb:	e8 d0 07 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2e1d0:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
   2e1d7:	48 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%rcx
   2e1de:	e9 8e d0 ff ff       	jmp    2b271 <JS_CallInternal+0x5e21>
   2e1e3:	48 8b b5 70 fe ff ff 	mov    -0x190(%rbp),%rsi
   2e1ea:	0f b7 d1             	movzwl %cx,%edx
   2e1ed:	4c 89 ff             	mov    %r15,%rdi
   2e1f0:	31 c9                	xor    %ecx,%ecx
   2e1f2:	49 83 c4 02          	add    $0x2,%r12
   2e1f6:	e8 45 84 00 00       	call   36640 <JS_ThrowReferenceErrorUninitialized2.isra.0>
   2e1fb:	e9 80 7a ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2e200:	48 89 fe             	mov    %rdi,%rsi
   2e203:	48 8b 95 d0 fd ff ff 	mov    -0x230(%rbp),%rdx
   2e20a:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e20e:	89 8d f0 fd ff ff    	mov    %ecx,-0x210(%rbp)
   2e214:	e8 87 07 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2e219:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   2e21f:	e9 ba 87 ff ff       	jmp    269de <JS_CallInternal+0x158e>
   2e224:	31 c0                	xor    %eax,%eax
   2e226:	48 8d 35 50 b3 0a 00 	lea    0xab350(%rip),%rsi        # d957d <_IO_stdin_used+0x57d>
   2e22d:	4c 89 ef             	mov    %r13,%rdi
   2e230:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   2e237:	4c 89 85 e8 fd ff ff 	mov    %r8,-0x218(%rbp)
   2e23e:	e8 5d 85 00 00       	call   367a0 <JS_ThrowInternalError>
   2e243:	83 fb f6             	cmp    $0xfffffff6,%ebx
   2e246:	48 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%rcx
   2e24d:	76 1a                	jbe    2e269 <JS_CallInternal+0x8e19>
   2e24f:	4c 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%r8
   2e256:	41 8b 40 fc          	mov    -0x4(%r8),%eax
   2e25a:	83 e8 01             	sub    $0x1,%eax
   2e25d:	41 89 40 fc          	mov    %eax,-0x4(%r8)
   2e261:	85 c0                	test   %eax,%eax
   2e263:	0f 8e b3 1b 00 00    	jle    2fe1c <JS_CallInternal+0xa9cc>
   2e269:	48 89 cb             	mov    %rcx,%rbx
   2e26c:	e9 0f 7a ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2e271:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e275:	48 89 c2             	mov    %rax,%rdx
   2e278:	48 89 ce             	mov    %rcx,%rsi
   2e27b:	e8 20 07 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2e280:	e9 13 a0 ff ff       	jmp    28298 <JS_CallInternal+0x2e48>
   2e285:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e289:	48 89 c2             	mov    %rax,%rdx
   2e28c:	48 89 ce             	mov    %rcx,%rsi
   2e28f:	e8 0c 07 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2e294:	e9 23 a0 ff ff       	jmp    282bc <JS_CallInternal+0x2e6c>
   2e299:	83 f9 fa             	cmp    $0xfffffffa,%ecx
   2e29c:	0f 8d aa 0e 00 00    	jge    2f14c <JS_CallInternal+0x9cfc>
   2e2a2:	83 f9 f8             	cmp    $0xfffffff8,%ecx
   2e2a5:	0f 8d 93 ec ff ff    	jge    2cf3e <JS_CallInternal+0x7aee>
   2e2ab:	83 e8 02             	sub    $0x2,%eax
   2e2ae:	83 f8 01             	cmp    $0x1,%eax
   2e2b1:	0f 87 32 ec ff ff    	ja     2cee9 <JS_CallInternal+0x7a99>
   2e2b7:	48 8d 35 0d b3 0a 00 	lea    0xab30d(%rip),%rsi        # d95cb <_IO_stdin_used+0x5cb>
   2e2be:	4c 89 ef             	mov    %r13,%rdi
   2e2c1:	31 c0                	xor    %eax,%eax
   2e2c3:	e8 f8 62 00 00       	call   345c0 <JS_ThrowTypeError>
   2e2c8:	e9 b3 79 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2e2cd:	48 89 fe             	mov    %rdi,%rsi
   2e2d0:	48 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%rdx
   2e2d7:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e2db:	89 8d b0 fd ff ff    	mov    %ecx,-0x250(%rbp)
   2e2e1:	e8 ba 06 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2e2e6:	8b 8d b0 fd ff ff    	mov    -0x250(%rbp),%ecx
   2e2ec:	e9 c6 86 ff ff       	jmp    269b7 <JS_CallInternal+0x1567>
   2e2f1:	48 8b b5 70 fe ff ff 	mov    -0x190(%rbp),%rsi
   2e2f8:	0f b7 d1             	movzwl %cx,%edx
   2e2fb:	4c 89 ef             	mov    %r13,%rdi
   2e2fe:	31 c9                	xor    %ecx,%ecx
   2e300:	49 83 c4 02          	add    $0x2,%r12
   2e304:	e8 37 83 00 00       	call   36640 <JS_ThrowReferenceErrorUninitialized2.isra.0>
   2e309:	e9 72 79 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2e30e:	48 8d 35 9f b2 0a 00 	lea    0xab29f(%rip),%rsi        # d95b4 <_IO_stdin_used+0x5b4>
   2e315:	4c 89 ef             	mov    %r13,%rdi
   2e318:	31 c0                	xor    %eax,%eax
   2e31a:	4c 89 85 d0 fd ff ff 	mov    %r8,-0x230(%rbp)
   2e321:	e8 9a 62 00 00       	call   345c0 <JS_ThrowTypeError>
   2e326:	4c 8b 85 d0 fd ff ff 	mov    -0x230(%rbp),%r8
   2e32d:	83 bd e8 fd ff ff f6 	cmpl   $0xfffffff6,-0x218(%rbp)
   2e334:	76 1e                	jbe    2e354 <JS_CallInternal+0x8f04>
   2e336:	48 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%rcx
   2e33d:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2e340:	89 85 d0 fd ff ff    	mov    %eax,-0x230(%rbp)
   2e346:	83 e8 01             	sub    $0x1,%eax
   2e349:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2e34c:	85 c0                	test   %eax,%eax
   2e34e:	0f 8e ac 1c 00 00    	jle    30000 <JS_CallInternal+0xabb0>
   2e354:	48 8b 43 08          	mov    0x8(%rbx),%rax
   2e358:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2e35b:	0f 86 ce 05 00 00    	jbe    2e92f <JS_CallInternal+0x94df>
   2e361:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
   2e366:	e9 37 e3 ff ff       	jmp    2c6a2 <JS_CallInternal+0x7252>
   2e36b:	48 8d 35 34 b2 0a 00 	lea    0xab234(%rip),%rsi        # d95a6 <_IO_stdin_used+0x5a6>
   2e372:	4c 89 ef             	mov    %r13,%rdi
   2e375:	31 c0                	xor    %eax,%eax
   2e377:	4c 89 85 d0 fd ff ff 	mov    %r8,-0x230(%rbp)
   2e37e:	e8 3d 62 00 00       	call   345c0 <JS_ThrowTypeError>
   2e383:	4c 8b 85 d0 fd ff ff 	mov    -0x230(%rbp),%r8
   2e38a:	eb a1                	jmp    2e32d <JS_CallInternal+0x8edd>
   2e38c:	48 8b b5 70 fe ff ff 	mov    -0x190(%rbp),%rsi
   2e393:	0f b7 d1             	movzwl %cx,%edx
   2e396:	4c 89 ef             	mov    %r13,%rdi
   2e399:	31 c9                	xor    %ecx,%ecx
   2e39b:	49 83 c4 02          	add    $0x2,%r12
   2e39f:	e8 9c 82 00 00       	call   36640 <JS_ThrowReferenceErrorUninitialized2.isra.0>
   2e3a4:	e9 d7 78 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2e3a9:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2e3ad:	48 c7 43 e8 08 00 00 	movq   $0x8,-0x18(%rbx)
   2e3b4:	00 
   2e3b5:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
   2e3ba:	f2 0f 11 43 e0       	movsd  %xmm0,-0x20(%rbx)
   2e3bf:	e9 d5 c3 ff ff       	jmp    2a799 <JS_CallInternal+0x5349>
   2e3c4:	83 fa 08             	cmp    $0x8,%edx
   2e3c7:	0f 84 b6 19 00 00    	je     2fd83 <JS_CallInternal+0xa933>
   2e3cd:	83 f8 08             	cmp    $0x8,%eax
   2e3d0:	0f 85 64 c8 ff ff    	jne    2ac3a <JS_CallInternal+0x57ea>
   2e3d6:	85 d2                	test   %edx,%edx
   2e3d8:	0f 85 5c c8 ff ff    	jne    2ac3a <JS_CallInternal+0x57ea>
   2e3de:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2e3e2:	f2 0f 2a c7          	cvtsi2sd %edi,%xmm0
   2e3e6:	66 48 0f 6e c9       	movq   %rcx,%xmm1
   2e3eb:	f2 0f 5c c1          	subsd  %xmm1,%xmm0
   2e3ef:	48 c7 43 e8 08 00 00 	movq   $0x8,-0x18(%rbx)
   2e3f6:	00 
   2e3f7:	f2 0f 11 43 e0       	movsd  %xmm0,-0x20(%rbx)
   2e3fc:	e9 98 c3 ff ff       	jmp    2a799 <JS_CallInternal+0x5349>
   2e401:	48 8d 35 ac b1 0a 00 	lea    0xab1ac(%rip),%rsi        # d95b4 <_IO_stdin_used+0x5b4>
   2e408:	4c 89 ef             	mov    %r13,%rdi
   2e40b:	31 c0                	xor    %eax,%eax
   2e40d:	48 89 8d e8 fd ff ff 	mov    %rcx,-0x218(%rbp)
   2e414:	e8 a7 61 00 00       	call   345c0 <JS_ThrowTypeError>
   2e419:	48 8b 8d e8 fd ff ff 	mov    -0x218(%rbp),%rcx
   2e420:	49 89 c0             	mov    %rax,%r8
   2e423:	48 89 d0             	mov    %rdx,%rax
   2e426:	4c 8b 51 08          	mov    0x8(%rcx),%r10
   2e42a:	48 8b 11             	mov    (%rcx),%rdx
   2e42d:	41 89 c1             	mov    %eax,%r9d
   2e430:	e9 21 c5 ff ff       	jmp    2a956 <JS_CallInternal+0x5506>
   2e435:	48 8b 85 70 fe ff ff 	mov    -0x190(%rbp),%rax
   2e43c:	48 8d 15 7a b0 0a 00 	lea    0xab07a(%rip),%rdx        # d94bd <_IO_stdin_used+0x4bd>
   2e443:	48 8b 40 30          	mov    0x30(%rax),%rax
   2e447:	8b 44 f0 04          	mov    0x4(%rax,%rsi,8),%eax
   2e44b:	85 c0                	test   %eax,%eax
   2e44d:	0f 85 dc 1a 00 00    	jne    2ff2f <JS_CallInternal+0xaadf>
   2e453:	48 8d 35 bf b0 0a 00 	lea    0xab0bf(%rip),%rsi        # d9519 <_IO_stdin_used+0x519>
   2e45a:	4c 89 ef             	mov    %r13,%rdi
   2e45d:	31 c0                	xor    %eax,%eax
   2e45f:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   2e466:	e8 35 80 00 00       	call   364a0 <JS_ThrowReferenceError>
   2e46b:	4c 8b a5 f0 fd ff ff 	mov    -0x210(%rbp),%r12
   2e472:	e9 09 78 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2e477:	48 8b 85 70 fe ff ff 	mov    -0x190(%rbp),%rax
   2e47e:	48 8b 40 30          	mov    0x30(%rax),%rax
   2e482:	8b 44 d0 04          	mov    0x4(%rax,%rdx,8),%eax
   2e486:	48 8d 15 30 b0 0a 00 	lea    0xab030(%rip),%rdx        # d94bd <_IO_stdin_used+0x4bd>
   2e48d:	85 c0                	test   %eax,%eax
   2e48f:	0f 85 bf 1a 00 00    	jne    2ff54 <JS_CallInternal+0xab04>
   2e495:	48 8d 35 7d b0 0a 00 	lea    0xab07d(%rip),%rsi        # d9519 <_IO_stdin_used+0x519>
   2e49c:	4c 89 ef             	mov    %r13,%rdi
   2e49f:	31 c0                	xor    %eax,%eax
   2e4a1:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   2e4a8:	e8 f3 7f 00 00       	call   364a0 <JS_ThrowReferenceError>
   2e4ad:	4c 8b a5 f0 fd ff ff 	mov    -0x210(%rbp),%r12
   2e4b4:	e9 c7 77 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2e4b9:	48 83 c3 10          	add    $0x10,%rbx
   2e4bd:	49 83 c4 04          	add    $0x4,%r12
   2e4c1:	e9 ba 77 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2e4c6:	4c 89 c3             	mov    %r8,%rbx
   2e4c9:	e9 b2 77 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2e4ce:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e4d2:	48 89 c2             	mov    %rax,%rdx
   2e4d5:	48 89 ce             	mov    %rcx,%rsi
   2e4d8:	4c 89 95 d0 fd ff ff 	mov    %r10,-0x230(%rbp)
   2e4df:	e8 bc 04 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2e4e4:	4c 8b 95 d0 fd ff ff 	mov    -0x230(%rbp),%r10
   2e4eb:	e9 8b 9d ff ff       	jmp    2827b <JS_CallInternal+0x2e2b>
   2e4f0:	c7 85 9c fe ff ff ff 	movl   $0xffffffff,-0x164(%rbp)
   2e4f7:	ff ff ff 
   2e4fa:	49 8b 72 08          	mov    0x8(%r10),%rsi
   2e4fe:	83 fe f6             	cmp    $0xfffffff6,%esi
   2e501:	0f 87 9b 11 00 00    	ja     2f6a2 <JS_CallInternal+0xa252>
   2e507:	49 c7 02 00 00 00 00 	movq   $0x0,(%r10)
   2e50e:	49 c7 42 08 03 00 00 	movq   $0x3,0x8(%r10)
   2e515:	00 
   2e516:	4d 89 dc             	mov    %r11,%r12
   2e519:	e9 62 77 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2e51e:	66 90                	xchg   %ax,%ax
   2e520:	ba 01 00 00 00       	mov    $0x1,%edx
   2e525:	be 03 00 00 00       	mov    $0x3,%esi
   2e52a:	31 ff                	xor    %edi,%edi
   2e52c:	e9 6b d4 ff ff       	jmp    2b99c <JS_CallInternal+0x654c>
   2e531:	41 8b 4a 14          	mov    0x14(%r10),%ecx
   2e535:	e9 a9 dc ff ff       	jmp    2c1e3 <JS_CallInternal+0x6d93>
   2e53a:	41 8b 49 14          	mov    0x14(%r9),%ecx
   2e53e:	e9 42 dc ff ff       	jmp    2c185 <JS_CallInternal+0x6d35>
   2e543:	48 8d 35 be e8 0a 00 	lea    0xae8be(%rip),%rsi        # dce08 <_IO_stdin_used+0x3e08>
   2e54a:	4c 89 ef             	mov    %r13,%rdi
   2e54d:	31 c0                	xor    %eax,%eax
   2e54f:	e8 6c 60 00 00       	call   345c0 <JS_ThrowTypeError>
   2e554:	e9 27 77 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2e559:	4c 89 ef             	mov    %r13,%rdi
   2e55c:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   2e563:	e8 f8 82 00 00       	call   36860 <__js_poll_interrupts>
   2e568:	48 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%rcx
   2e56f:	85 c0                	test   %eax,%eax
   2e571:	0f 84 21 1e 00 00    	je     30398 <JS_CallInternal+0xaf48>
   2e577:	49 89 cc             	mov    %rcx,%r12
   2e57a:	e9 01 77 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2e57f:	48 8b b5 70 fe ff ff 	mov    -0x190(%rbp),%rsi
   2e586:	0f b7 d1             	movzwl %cx,%edx
   2e589:	4c 89 ef             	mov    %r13,%rdi
   2e58c:	31 c9                	xor    %ecx,%ecx
   2e58e:	49 83 c4 02          	add    $0x2,%r12
   2e592:	e8 a9 80 00 00       	call   36640 <JS_ThrowReferenceErrorUninitialized2.isra.0>
   2e597:	e9 e4 76 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2e59c:	4c 89 ef             	mov    %r13,%rdi
   2e59f:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   2e5a6:	e8 b5 82 00 00       	call   36860 <__js_poll_interrupts>
   2e5ab:	48 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%rcx
   2e5b2:	85 c0                	test   %eax,%eax
   2e5b4:	0f 84 ec 1d 00 00    	je     303a6 <JS_CallInternal+0xaf56>
   2e5ba:	49 89 cc             	mov    %rcx,%r12
   2e5bd:	e9 be 76 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2e5c2:	4c 89 ef             	mov    %r13,%rdi
   2e5c5:	48 89 95 f0 fd ff ff 	mov    %rdx,-0x210(%rbp)
   2e5cc:	e8 8f 82 00 00       	call   36860 <__js_poll_interrupts>
   2e5d1:	48 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%rdx
   2e5d8:	85 c0                	test   %eax,%eax
   2e5da:	0f 84 ad 1b 00 00    	je     3018d <JS_CallInternal+0xad3d>
   2e5e0:	49 89 d4             	mov    %rdx,%r12
   2e5e3:	e9 98 76 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2e5e8:	48 8d 35 f1 e7 0a 00 	lea    0xae7f1(%rip),%rsi        # dcde0 <_IO_stdin_used+0x3de0>
   2e5ef:	4c 89 ef             	mov    %r13,%rdi
   2e5f2:	31 c0                	xor    %eax,%eax
   2e5f4:	49 83 c4 02          	add    $0x2,%r12
   2e5f8:	e8 a3 7e 00 00       	call   364a0 <JS_ThrowReferenceError>
   2e5fd:	e9 7e 76 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2e602:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e606:	48 89 c2             	mov    %rax,%rdx
   2e609:	48 89 ce             	mov    %rcx,%rsi
   2e60c:	e8 8f 03 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2e611:	e9 49 9a ff ff       	jmp    2805f <JS_CallInternal+0x2c0f>
   2e616:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e61a:	48 89 c2             	mov    %rax,%rdx
   2e61d:	48 89 ce             	mov    %rcx,%rsi
   2e620:	4c 89 9d d0 fd ff ff 	mov    %r11,-0x230(%rbp)
   2e627:	e8 74 03 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2e62c:	4c 8b 9d d0 fd ff ff 	mov    -0x230(%rbp),%r11
   2e633:	e9 e6 99 ff ff       	jmp    2801e <JS_CallInternal+0x2bce>
   2e638:	48 83 c3 10          	add    $0x10,%rbx
   2e63c:	e9 3f 76 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2e641:	4c 8b a5 f0 fd ff ff 	mov    -0x210(%rbp),%r12
   2e648:	e9 33 76 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2e64d:	4c 89 ef             	mov    %r13,%rdi
   2e650:	48 89 95 f0 fd ff ff 	mov    %rdx,-0x210(%rbp)
   2e657:	e8 04 82 00 00       	call   36860 <__js_poll_interrupts>
   2e65c:	48 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%rdx
   2e663:	85 c0                	test   %eax,%eax
   2e665:	0f 84 f4 1c 00 00    	je     3035f <JS_CallInternal+0xaf0f>
   2e66b:	49 89 d4             	mov    %rdx,%r12
   2e66e:	e9 0d 76 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2e673:	4c 8b a5 b0 fd ff ff 	mov    -0x250(%rbp),%r12
   2e67a:	e9 01 76 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2e67f:	4c 89 ef             	mov    %r13,%rdi
   2e682:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   2e689:	e8 d2 81 00 00       	call   36860 <__js_poll_interrupts>
   2e68e:	48 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%rcx
   2e695:	85 c0                	test   %eax,%eax
   2e697:	0f 84 d0 1c 00 00    	je     3036d <JS_CallInternal+0xaf1d>
   2e69d:	49 89 cc             	mov    %rcx,%r12
   2e6a0:	e9 db 75 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2e6a5:	4c 89 ef             	mov    %r13,%rdi
   2e6a8:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   2e6af:	e8 ac 81 00 00       	call   36860 <__js_poll_interrupts>
   2e6b4:	48 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%rcx
   2e6bb:	85 c0                	test   %eax,%eax
   2e6bd:	0f 84 3e 1d 00 00    	je     30401 <JS_CallInternal+0xafb1>
   2e6c3:	49 89 cc             	mov    %rcx,%r12
   2e6c6:	e9 b5 75 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2e6cb:	83 fe 08             	cmp    $0x8,%esi
   2e6ce:	0f 84 69 19 00 00    	je     3003d <JS_CallInternal+0xabed>
   2e6d4:	83 f9 08             	cmp    $0x8,%ecx
   2e6d7:	75 08                	jne    2e6e1 <JS_CallInternal+0x9291>
   2e6d9:	85 f6                	test   %esi,%esi
   2e6db:	0f 84 94 19 00 00    	je     30075 <JS_CallInternal+0xac25>
   2e6e1:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2e6e8:	44 89 d2             	mov    %r10d,%edx
   2e6eb:	48 89 de             	mov    %rbx,%rsi
   2e6ee:	4c 89 ef             	mov    %r13,%rdi
   2e6f1:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2e6f5:	e8 36 e6 02 00       	call   5cd30 <js_relational_slow>
   2e6fa:	85 c0                	test   %eax,%eax
   2e6fc:	0f 85 7e 75 ff ff    	jne    25c80 <JS_CallInternal+0x830>
   2e702:	48 83 eb 10          	sub    $0x10,%rbx
   2e706:	e9 b9 93 ff ff       	jmp    27ac4 <JS_CallInternal+0x2674>
   2e70b:	0f 85 3e 1e 00 00    	jne    3054f <JS_CallInternal+0xb0ff>
   2e711:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e715:	48 8b 87 f0 04 00 00 	mov    0x4f0(%rdi),%rax
   2e71c:	48 85 c0             	test   %rax,%rax
   2e71f:	0f 84 ca 0a 00 00    	je     2f1ef <JS_CallInternal+0x9d9f>
   2e725:	f6 40 3c 01          	testb  $0x1,0x3c(%rax)
   2e729:	0f 84 c0 0a 00 00    	je     2f1ef <JS_CallInternal+0x9d9f>
   2e72f:	89 ce                	mov    %ecx,%esi
   2e731:	4c 89 ef             	mov    %r13,%rdi
   2e734:	89 8d f0 fd ff ff    	mov    %ecx,-0x210(%rbp)
   2e73a:	e8 a1 7e 00 00       	call   365e0 <JS_ThrowReferenceErrorNotDefined>
   2e73f:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   2e745:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2e74b:	0f 8e 2f 75 ff ff    	jle    25c80 <JS_CallInternal+0x830>
   2e751:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e755:	89 ce                	mov    %ecx,%esi
   2e757:	e8 54 c8 fe ff       	call   1afb0 <JS_FreeAtom.part.0.isra.0>
   2e75c:	e9 1f 75 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2e761:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e765:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2e769:	89 c2                	mov    %eax,%edx
   2e76b:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   2e771:	e8 fa a5 fe ff       	call   18d70 <JS_AtomGetStrRT.constprop.0>
   2e776:	48 8d 35 64 ae 0a 00 	lea    0xaae64(%rip),%rsi        # d95e1 <_IO_stdin_used+0x5e1>
   2e77d:	4c 89 ef             	mov    %r13,%rdi
   2e780:	48 89 c2             	mov    %rax,%rdx
   2e783:	31 c0                	xor    %eax,%eax
   2e785:	e8 16 7d 00 00       	call   364a0 <JS_ThrowReferenceError>
   2e78a:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   2e790:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2e796:	0f 8e e4 74 ff ff    	jle    25c80 <JS_CallInternal+0x830>
   2e79c:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e7a0:	89 ce                	mov    %ecx,%esi
   2e7a2:	e8 09 c8 fe ff       	call   1afb0 <JS_FreeAtom.part.0.isra.0>
   2e7a7:	e9 d4 74 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2e7ac:	48 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%rbx
   2e7b3:	e9 c8 74 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2e7b8:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e7bc:	48 89 c2             	mov    %rax,%rdx
   2e7bf:	48 89 ce             	mov    %rcx,%rsi
   2e7c2:	e8 d9 01 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2e7c7:	e9 a8 d6 ff ff       	jmp    2be74 <JS_CallInternal+0x6a24>
   2e7cc:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e7d0:	48 89 c2             	mov    %rax,%rdx
   2e7d3:	48 89 ce             	mov    %rcx,%rsi
   2e7d6:	e8 c5 01 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2e7db:	e9 70 d6 ff ff       	jmp    2be50 <JS_CallInternal+0x6a00>
   2e7e0:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e7e4:	48 89 c2             	mov    %rax,%rdx
   2e7e7:	48 89 ce             	mov    %rcx,%rsi
   2e7ea:	e8 b1 01 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2e7ef:	e9 b0 d7 ff ff       	jmp    2bfa4 <JS_CallInternal+0x6b54>
   2e7f4:	48 8b 85 70 fe ff ff 	mov    -0x190(%rbp),%rax
   2e7fb:	48 8d 15 bb ac 0a 00 	lea    0xaacbb(%rip),%rdx        # d94bd <_IO_stdin_used+0x4bd>
   2e802:	48 8b 40 30          	mov    0x30(%rax),%rax
   2e806:	8b 44 f0 04          	mov    0x4(%rax,%rsi,8),%eax
   2e80a:	85 c0                	test   %eax,%eax
   2e80c:	0f 85 3b 16 00 00    	jne    2fe4d <JS_CallInternal+0xa9fd>
   2e812:	48 8d 35 00 ad 0a 00 	lea    0xaad00(%rip),%rsi        # d9519 <_IO_stdin_used+0x519>
   2e819:	4c 89 ef             	mov    %r13,%rdi
   2e81c:	31 c0                	xor    %eax,%eax
   2e81e:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   2e825:	e8 76 7c 00 00       	call   364a0 <JS_ThrowReferenceError>
   2e82a:	4c 8b a5 f0 fd ff ff 	mov    -0x210(%rbp),%r12
   2e831:	e9 4a 74 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2e836:	4c 8b a5 f0 fd ff ff 	mov    -0x210(%rbp),%r12
   2e83d:	e9 3e 74 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2e842:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2e846:	b8 08 00 00 00       	mov    $0x8,%eax
   2e84b:	f2 48 0f 2a c1       	cvtsi2sd %rcx,%xmm0
   2e850:	f2 41 0f 11 01       	movsd  %xmm0,(%r9)
   2e855:	e9 a5 bf ff ff       	jmp    2a7ff <JS_CallInternal+0x53af>
   2e85a:	83 f8 08             	cmp    $0x8,%eax
   2e85d:	0f 84 02 19 00 00    	je     30165 <JS_CallInternal+0xad15>
   2e863:	83 f8 f9             	cmp    $0xfffffff9,%eax
   2e866:	0f 84 63 09 00 00    	je     2f1cf <JS_CallInternal+0x9d7f>
   2e86c:	48 8b bd 80 fe ff ff 	mov    -0x180(%rbp),%rdi
   2e873:	49 8b 31             	mov    (%r9),%rsi
   2e876:	4c 89 57 30          	mov    %r10,0x30(%rdi)
   2e87a:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2e87d:	0f 87 63 09 00 00    	ja     2f1e6 <JS_CallInternal+0x9d96>
   2e883:	48 89 b5 50 ff ff ff 	mov    %rsi,-0xb0(%rbp)
   2e88a:	4c 89 ef             	mov    %r13,%rdi
   2e88d:	48 83 eb 10          	sub    $0x10,%rbx
   2e891:	48 8d b5 70 ff ff ff 	lea    -0x90(%rbp),%rsi
   2e898:	4c 89 8d e8 fd ff ff 	mov    %r9,-0x218(%rbp)
   2e89f:	4c 89 95 f0 fd ff ff 	mov    %r10,-0x210(%rbp)
   2e8a6:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
   2e8ad:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
   2e8b4:	48 89 85 58 ff ff ff 	mov    %rax,-0xa8(%rbp)
   2e8bb:	e8 a0 8f 02 00       	call   57860 <js_add_slow>
   2e8c0:	4c 8b 8d e8 fd ff ff 	mov    -0x218(%rbp),%r9
   2e8c7:	85 c0                	test   %eax,%eax
   2e8c9:	0f 85 b2 18 00 00    	jne    30181 <JS_CallInternal+0xad31>
   2e8cf:	48 8b 95 50 ff ff ff 	mov    -0xb0(%rbp),%rdx
   2e8d6:	49 8b 09             	mov    (%r9),%rcx
   2e8d9:	49 8b 41 08          	mov    0x8(%r9),%rax
   2e8dd:	49 89 11             	mov    %rdx,(%r9)
   2e8e0:	48 8b 95 58 ff ff ff 	mov    -0xa8(%rbp),%rdx
   2e8e7:	49 89 51 08          	mov    %rdx,0x8(%r9)
   2e8eb:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2e8ee:	0f 86 13 bf ff ff    	jbe    2a807 <JS_CallInternal+0x53b7>
   2e8f4:	8b 51 fc             	mov    -0x4(%rcx),%edx
   2e8f7:	83 ea 01             	sub    $0x1,%edx
   2e8fa:	89 51 fc             	mov    %edx,-0x4(%rcx)
   2e8fd:	85 d2                	test   %edx,%edx
   2e8ff:	0f 8f 02 bf ff ff    	jg     2a807 <JS_CallInternal+0x53b7>
   2e905:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2e909:	48 89 c2             	mov    %rax,%rdx
   2e90c:	48 89 ce             	mov    %rcx,%rsi
   2e90f:	e8 8c 00 ff ff       	call   1e9a0 <__JS_FreeValueRT>
   2e914:	e9 ee be ff ff       	jmp    2a807 <JS_CallInternal+0x53b7>
   2e919:	48 83 eb 10          	sub    $0x10,%rbx
   2e91d:	49 83 c4 04          	add    $0x4,%r12
   2e921:	e9 5a 73 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2e926:	49 83 c4 04          	add    $0x4,%r12
   2e92a:	e9 51 73 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2e92f:	49 8b 40 08          	mov    0x8(%r8),%rax
   2e933:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2e936:	0f 86 44 73 ff ff    	jbe    25c80 <JS_CallInternal+0x830>
   2e93c:	49 8b 10             	mov    (%r8),%rdx
   2e93f:	8b 4a fc             	mov    -0x4(%rdx),%ecx
   2e942:	83 e9 01             	sub    $0x1,%ecx
   2e945:	89 4a fc             	mov    %ecx,-0x4(%rdx)
   2e948:	85 c9                	test   %ecx,%ecx
   2e94a:	0f 8f 30 73 ff ff    	jg     25c80 <JS_CallInternal+0x830>
   2e950:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
   2e955:	e9 8b f2 ff ff       	jmp    2dbe5 <JS_CallInternal+0x8795>
   2e95a:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2e961:	48 89 de             	mov    %rbx,%rsi
   2e964:	4c 89 ef             	mov    %r13,%rdi
   2e967:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2e96b:	e8 f0 44 02 00       	call   52e60 <js_shr_slow>
   2e970:	85 c0                	test   %eax,%eax
   2e972:	0f 85 08 73 ff ff    	jne    25c80 <JS_CallInternal+0x830>
   2e978:	48 83 eb 10          	sub    $0x10,%rbx
   2e97c:	e9 39 90 ff ff       	jmp    279ba <JS_CallInternal+0x256a>
   2e981:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2e988:	44 89 d2             	mov    %r10d,%edx
   2e98b:	48 89 de             	mov    %rbx,%rsi
   2e98e:	4c 89 ef             	mov    %r13,%rdi
   2e991:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2e995:	e8 96 46 02 00       	call   53030 <js_binary_logic_slow>
   2e99a:	85 c0                	test   %eax,%eax
   2e99c:	0f 85 de 72 ff ff    	jne    25c80 <JS_CallInternal+0x830>
   2e9a2:	48 83 eb 10          	sub    $0x10,%rbx
   2e9a6:	e9 c7 8f ff ff       	jmp    27972 <JS_CallInternal+0x2522>
   2e9ab:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2e9b2:	44 89 d2             	mov    %r10d,%edx
   2e9b5:	48 89 de             	mov    %rbx,%rsi
   2e9b8:	4c 89 ef             	mov    %r13,%rdi
   2e9bb:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2e9bf:	e8 6c 46 02 00       	call   53030 <js_binary_logic_slow>
   2e9c4:	85 c0                	test   %eax,%eax
   2e9c6:	0f 85 b4 72 ff ff    	jne    25c80 <JS_CallInternal+0x830>
   2e9cc:	48 83 eb 10          	sub    $0x10,%rbx
   2e9d0:	e9 22 90 ff ff       	jmp    279f7 <JS_CallInternal+0x25a7>
   2e9d5:	83 fe 08             	cmp    $0x8,%esi
   2e9d8:	0f 84 ed 16 00 00    	je     300cb <JS_CallInternal+0xac7b>
   2e9de:	83 f9 08             	cmp    $0x8,%ecx
   2e9e1:	75 08                	jne    2e9eb <JS_CallInternal+0x959b>
   2e9e3:	85 f6                	test   %esi,%esi
   2e9e5:	0f 84 18 17 00 00    	je     30103 <JS_CallInternal+0xacb3>
   2e9eb:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2e9f2:	44 89 d2             	mov    %r10d,%edx
   2e9f5:	48 89 de             	mov    %rbx,%rsi
   2e9f8:	4c 89 ef             	mov    %r13,%rdi
   2e9fb:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2e9ff:	e8 2c e3 02 00       	call   5cd30 <js_relational_slow>
   2ea04:	85 c0                	test   %eax,%eax
   2ea06:	0f 85 74 72 ff ff    	jne    25c80 <JS_CallInternal+0x830>
   2ea0c:	48 83 eb 10          	sub    $0x10,%rbx
   2ea10:	e9 a6 8e ff ff       	jmp    278bb <JS_CallInternal+0x246b>
   2ea15:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2ea1c:	44 89 d2             	mov    %r10d,%edx
   2ea1f:	48 89 de             	mov    %rbx,%rsi
   2ea22:	4c 89 ef             	mov    %r13,%rdi
   2ea25:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2ea29:	e8 02 46 02 00       	call   53030 <js_binary_logic_slow>
   2ea2e:	85 c0                	test   %eax,%eax
   2ea30:	0f 85 4a 72 ff ff    	jne    25c80 <JS_CallInternal+0x830>
   2ea36:	48 83 eb 10          	sub    $0x10,%rbx
   2ea3a:	e9 b9 8e ff ff       	jmp    278f8 <JS_CallInternal+0x24a8>
   2ea3f:	83 fe 08             	cmp    $0x8,%esi
   2ea42:	0f 84 3c 16 00 00    	je     30084 <JS_CallInternal+0xac34>
   2ea48:	83 f9 08             	cmp    $0x8,%ecx
   2ea4b:	75 08                	jne    2ea55 <JS_CallInternal+0x9605>
   2ea4d:	85 f6                	test   %esi,%esi
   2ea4f:	0f 84 67 16 00 00    	je     300bc <JS_CallInternal+0xac6c>
   2ea55:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2ea5c:	44 89 d2             	mov    %r10d,%edx
   2ea5f:	48 89 de             	mov    %rbx,%rsi
   2ea62:	4c 89 ef             	mov    %r13,%rdi
   2ea65:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2ea69:	e8 c2 e2 02 00       	call   5cd30 <js_relational_slow>
   2ea6e:	85 c0                	test   %eax,%eax
   2ea70:	0f 85 0a 72 ff ff    	jne    25c80 <JS_CallInternal+0x830>
   2ea76:	48 83 eb 10          	sub    $0x10,%rbx
   2ea7a:	e9 f4 8d ff ff       	jmp    27873 <JS_CallInternal+0x2423>
   2ea7f:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2ea86:	44 89 d2             	mov    %r10d,%edx
   2ea89:	48 89 de             	mov    %rbx,%rsi
   2ea8c:	4c 89 ef             	mov    %r13,%rdi
   2ea8f:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2ea93:	e8 98 45 02 00       	call   53030 <js_binary_logic_slow>
   2ea98:	85 c0                	test   %eax,%eax
   2ea9a:	0f 85 e0 71 ff ff    	jne    25c80 <JS_CallInternal+0x830>
   2eaa0:	48 83 eb 10          	sub    $0x10,%rbx
   2eaa4:	e9 8c 8e ff ff       	jmp    27935 <JS_CallInternal+0x24e5>
   2eaa9:	48 8b 95 e8 fd ff ff 	mov    -0x218(%rbp),%rdx
   2eab0:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2eab4:	48 89 ce             	mov    %rcx,%rsi
   2eab7:	44 89 85 f0 fd ff ff 	mov    %r8d,-0x210(%rbp)
   2eabe:	e8 dd fe fe ff       	call   1e9a0 <__JS_FreeValueRT>
   2eac3:	44 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8d
   2eaca:	e9 46 84 ff ff       	jmp    26f15 <JS_CallInternal+0x1ac5>
   2eacf:	48 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%rdx
   2ead6:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2eada:	48 89 ce             	mov    %rcx,%rsi
   2eadd:	44 89 85 b0 fd ff ff 	mov    %r8d,-0x250(%rbp)
   2eae4:	e8 b7 fe fe ff       	call   1e9a0 <__JS_FreeValueRT>
   2eae9:	44 8b 85 b0 fd ff ff 	mov    -0x250(%rbp),%r8d
   2eaf0:	e9 f9 83 ff ff       	jmp    26eee <JS_CallInternal+0x1a9e>
   2eaf5:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2eafc:	44 89 d2             	mov    %r10d,%edx
   2eaff:	48 89 de             	mov    %rbx,%rsi
   2eb02:	4c 89 ef             	mov    %r13,%rdi
   2eb05:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2eb09:	e8 22 45 02 00       	call   53030 <js_binary_logic_slow>
   2eb0e:	85 c0                	test   %eax,%eax
   2eb10:	0f 85 6a 71 ff ff    	jne    25c80 <JS_CallInternal+0x830>
   2eb16:	48 83 eb 10          	sub    $0x10,%rbx
   2eb1a:	e9 15 8f ff ff       	jmp    27a34 <JS_CallInternal+0x25e4>
   2eb1f:	83 fe 08             	cmp    $0x8,%esi
   2eb22:	0f 84 b7 0d 00 00    	je     2f8df <JS_CallInternal+0xa48f>
   2eb28:	83 f9 08             	cmp    $0x8,%ecx
   2eb2b:	75 08                	jne    2eb35 <JS_CallInternal+0x96e5>
   2eb2d:	85 f6                	test   %esi,%esi
   2eb2f:	0f 84 7f 0d 00 00    	je     2f8b4 <JS_CallInternal+0xa464>
   2eb35:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   2eb3c:	44 89 d2             	mov    %r10d,%edx
   2eb3f:	48 89 de             	mov    %rbx,%rsi
   2eb42:	4c 89 ef             	mov    %r13,%rdi
   2eb45:	4c 89 60 30          	mov    %r12,0x30(%rax)
   2eb49:	e8 e2 e1 02 00       	call   5cd30 <js_relational_slow>
   2eb4e:	85 c0                	test   %eax,%eax
   2eb50:	0f 85 2a 71 ff ff    	jne    25c80 <JS_CallInternal+0x830>
   2eb56:	48 83 eb 10          	sub    $0x10,%rbx
   2eb5a:	e9 1d 8f ff ff       	jmp    27a7c <JS_CallInternal+0x262c>
   2eb5f:	83 fa 08             	cmp    $0x8,%edx
   2eb62:	0f 84 d8 0e 00 00    	je     2fa40 <JS_CallInternal+0xa5f0>
   2eb68:	83 fa ff             	cmp    $0xffffffff,%edx
   2eb6b:	0f 84 8d 0e 00 00    	je     2f9fe <JS_CallInternal+0xa5ae>
   2eb71:	8d 42 fe             	lea    -0x2(%rdx),%eax
   2eb74:	83 f8 01             	cmp    $0x1,%eax
   2eb77:	0f 86 92 19 00 00    	jbe    3050f <JS_CallInternal+0xb0bf>
   2eb7d:	83 fa f9             	cmp    $0xfffffff9,%edx
   2eb80:	0f 85 16 0e 00 00    	jne    2f99c <JS_CallInternal+0xa54c>
   2eb86:	41 83 f8 f9          	cmp    $0xfffffff9,%r8d
   2eb8a:	0f 85 0c 0e 00 00    	jne    2f99c <JS_CallInternal+0xa54c>
   2eb90:	4c 89 d6             	mov    %r10,%rsi
   2eb93:	4c 89 95 d0 fd ff ff 	mov    %r10,-0x230(%rbp)
   2eb9a:	4c 89 85 b0 fd ff ff 	mov    %r8,-0x250(%rbp)
   2eba1:	48 89 95 c0 fd ff ff 	mov    %rdx,-0x240(%rbp)
   2eba8:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
   2ebaf:	e8 fc ab fe ff       	call   197b0 <js_string_eq.isra.0>
   2ebb4:	48 8b 95 c0 fd ff ff 	mov    -0x240(%rbp),%rdx
   2ebbb:	4c 89 ef             	mov    %r13,%rdi
   2ebbe:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   2ebc4:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
   2ebcb:	48 89 c6             	mov    %rax,%rsi
   2ebce:	e8 4d ff fe ff       	call   1eb20 <JS_FreeValue>
   2ebd3:	4c 8b 95 d0 fd ff ff 	mov    -0x230(%rbp),%r10
   2ebda:	4c 8b 9d b0 fd ff ff 	mov    -0x250(%rbp),%r11
   2ebe1:	4c 89 d6             	mov    %r10,%rsi
   2ebe4:	4c 89 da             	mov    %r11,%rdx
   2ebe7:	4c 89 ef             	mov    %r13,%rdi
   2ebea:	e8 31 ff fe ff       	call   1eb20 <JS_FreeValue>
   2ebef:	48 63 85 f0 fd ff ff 	movslq -0x210(%rbp),%rax
   2ebf6:	e9 c2 83 ff ff       	jmp    26fbd <JS_CallInternal+0x1b6d>
   2ebfb:	4c 89 ef             	mov    %r13,%rdi
   2ebfe:	48 89 95 f0 fd ff ff 	mov    %rdx,-0x210(%rbp)
   2ec05:	e8 56 7c 00 00       	call   36860 <__js_poll_interrupts>
   2ec0a:	48 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%rdx
   2ec11:	85 c0                	test   %eax,%eax
   2ec13:	0f 84 db 16 00 00    	je     302f4 <JS_CallInternal+0xaea4>
   2ec19:	49 89 d4             	mov    %rdx,%r12
   2ec1c:	e9 5f 70 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2ec21:	48 8d 35 7e a9 0a 00 	lea    0xaa97e(%rip),%rsi        # d95a6 <_IO_stdin_used+0x5a6>
   2ec28:	4c 89 ef             	mov    %r13,%rdi
   2ec2b:	31 c0                	xor    %eax,%eax
   2ec2d:	48 89 8d e8 fd ff ff 	mov    %rcx,-0x218(%rbp)
   2ec34:	e8 87 59 00 00       	call   345c0 <JS_ThrowTypeError>
   2ec39:	48 8b 8d e8 fd ff ff 	mov    -0x218(%rbp),%rcx
   2ec40:	49 89 c0             	mov    %rax,%r8
   2ec43:	48 89 d0             	mov    %rdx,%rax
   2ec46:	48 8b 53 f0          	mov    -0x10(%rbx),%rdx
   2ec4a:	4c 8b 51 08          	mov    0x8(%rcx),%r10
   2ec4e:	41 89 c1             	mov    %eax,%r9d
   2ec51:	e9 00 bd ff ff       	jmp    2a956 <JS_CallInternal+0x5506>
   2ec56:	8b 06                	mov    (%rsi),%eax
   2ec58:	25 ff ff ff 03       	and    $0x3ffffff,%eax
   2ec5d:	0f 85 c0 bc ff ff    	jne    2a923 <JS_CallInternal+0x54d3>
   2ec63:	48 8b bd a8 fd ff ff 	mov    -0x258(%rbp),%rdi
   2ec6a:	44 89 c2             	mov    %r8d,%edx
   2ec6d:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2ec71:	48 89 8d e8 fd ff ff 	mov    %rcx,-0x218(%rbp)
   2ec78:	e8 f3 a0 fe ff       	call   18d70 <JS_AtomGetStrRT.constprop.0>
   2ec7d:	48 8d 35 a4 e1 0a 00 	lea    0xae1a4(%rip),%rsi        # dce28 <_IO_stdin_used+0x3e28>
   2ec84:	4c 89 ef             	mov    %r13,%rdi
   2ec87:	48 89 c2             	mov    %rax,%rdx
   2ec8a:	31 c0                	xor    %eax,%eax
   2ec8c:	e8 2f 59 00 00       	call   345c0 <JS_ThrowTypeError>
   2ec91:	48 8b 8d e8 fd ff ff 	mov    -0x218(%rbp),%rcx
   2ec98:	4c 8b 51 08          	mov    0x8(%rcx),%r10
   2ec9c:	41 83 fa f6          	cmp    $0xfffffff6,%r10d
   2eca0:	0f 87 a7 05 00 00    	ja     2f24d <JS_CallInternal+0x9dfd>
   2eca6:	48 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%rax
   2ecad:	48 8b 70 08          	mov    0x8(%rax),%rsi
   2ecb1:	83 fe f6             	cmp    $0xfffffff6,%esi
   2ecb4:	0f 87 8c 14 00 00    	ja     30146 <JS_CallInternal+0xacf6>
   2ecba:	45 31 d2             	xor    %r10d,%r10d
   2ecbd:	48 c7 43 e8 06 00 00 	movq   $0x6,-0x18(%rbx)
   2ecc4:	00 
   2ecc5:	4c 89 53 e0          	mov    %r10,-0x20(%rbx)
   2ecc9:	48 89 cb             	mov    %rcx,%rbx
   2eccc:	e9 af 6f ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2ecd1:	48 83 c3 10          	add    $0x10,%rbx
   2ecd5:	49 83 c4 02          	add    $0x2,%r12
   2ecd9:	e9 a2 6f ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2ecde:	4c 8b a5 f0 fd ff ff 	mov    -0x210(%rbp),%r12
   2ece5:	48 83 c3 10          	add    $0x10,%rbx
   2ece9:	e9 92 6f ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2ecee:	83 fa 08             	cmp    $0x8,%edx
   2ecf1:	0f 84 e9 0a 00 00    	je     2f7e0 <JS_CallInternal+0xa390>
   2ecf7:	83 fa ff             	cmp    $0xffffffff,%edx
   2ecfa:	0f 84 7b 0a 00 00    	je     2f77b <JS_CallInternal+0xa32b>
   2ed00:	8d 42 fe             	lea    -0x2(%rdx),%eax
   2ed03:	83 f8 01             	cmp    $0x1,%eax
   2ed06:	0f 86 30 0a 00 00    	jbe    2f73c <JS_CallInternal+0xa2ec>
   2ed0c:	83 fa f9             	cmp    $0xfffffff9,%edx
   2ed0f:	0f 85 96 e3 ff ff    	jne    2d0ab <JS_CallInternal+0x7c5b>
   2ed15:	83 f9 f9             	cmp    $0xfffffff9,%ecx
   2ed18:	0f 85 8d e3 ff ff    	jne    2d0ab <JS_CallInternal+0x7c5b>
   2ed1e:	4c 89 ce             	mov    %r9,%rsi
   2ed21:	4c 89 8d d0 fd ff ff 	mov    %r9,-0x230(%rbp)
   2ed28:	48 89 8d c0 fd ff ff 	mov    %rcx,-0x240(%rbp)
   2ed2f:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
   2ed36:	48 89 95 b0 fd ff ff 	mov    %rdx,-0x250(%rbp)
   2ed3d:	e8 6e aa fe ff       	call   197b0 <js_string_eq.isra.0>
   2ed42:	48 8b 95 b0 fd ff ff 	mov    -0x250(%rbp),%rdx
   2ed49:	4c 89 ef             	mov    %r13,%rdi
   2ed4c:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   2ed52:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
   2ed59:	48 89 c6             	mov    %rax,%rsi
   2ed5c:	e8 bf fd fe ff       	call   1eb20 <JS_FreeValue>
   2ed61:	48 8b 85 d0 fd ff ff 	mov    -0x230(%rbp),%rax
   2ed68:	48 8b 95 c0 fd ff ff 	mov    -0x240(%rbp),%rdx
   2ed6f:	4c 89 ef             	mov    %r13,%rdi
   2ed72:	48 89 c6             	mov    %rax,%rsi
   2ed75:	e8 a6 fd fe ff       	call   1eb20 <JS_FreeValue>
   2ed7a:	44 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8d
   2ed81:	e9 dd 82 ff ff       	jmp    27063 <JS_CallInternal+0x1c13>
   2ed86:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ed8a:	4c 89 d6             	mov    %r10,%rsi
   2ed8d:	4c 89 da             	mov    %r11,%rdx
   2ed90:	e8 0b fc fe ff       	call   1e9a0 <__JS_FreeValueRT>
   2ed95:	e9 95 97 ff ff       	jmp    2852f <JS_CallInternal+0x30df>
   2ed9a:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ed9e:	89 ca                	mov    %ecx,%edx
   2eda0:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2eda4:	4c 89 85 f0 fd ff ff 	mov    %r8,-0x210(%rbp)
   2edab:	e8 c0 9f fe ff       	call   18d70 <JS_AtomGetStrRT.constprop.0>
   2edb0:	48 8d 35 a2 a7 0a 00 	lea    0xaa7a2(%rip),%rsi        # d9559 <_IO_stdin_used+0x559>
   2edb7:	4c 89 ef             	mov    %r13,%rdi
   2edba:	48 89 c2             	mov    %rax,%rdx
   2edbd:	31 c0                	xor    %eax,%eax
   2edbf:	e8 fc 57 00 00       	call   345c0 <JS_ThrowTypeError>
   2edc4:	4c 8b a5 f0 fd ff ff 	mov    -0x210(%rbp),%r12
   2edcb:	e9 b0 6e ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2edd0:	48 8d 15 e6 a6 0a 00 	lea    0xaa6e6(%rip),%rdx        # d94bd <_IO_stdin_used+0x4bd>
   2edd7:	85 c9                	test   %ecx,%ecx
   2edd9:	0f 85 c7 0f 00 00    	jne    2fda6 <JS_CallInternal+0xa956>
   2eddf:	48 8d 35 33 a7 0a 00 	lea    0xaa733(%rip),%rsi        # d9519 <_IO_stdin_used+0x519>
   2ede6:	4c 89 ef             	mov    %r13,%rdi
   2ede9:	31 c0                	xor    %eax,%eax
   2edeb:	4c 89 85 f0 fd ff ff 	mov    %r8,-0x210(%rbp)
   2edf2:	e8 a9 76 00 00       	call   364a0 <JS_ThrowReferenceError>
   2edf7:	4c 8b a5 f0 fd ff ff 	mov    -0x210(%rbp),%r12
   2edfe:	e9 7d 6e ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2ee03:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ee07:	48 89 ce             	mov    %rcx,%rsi
   2ee0a:	4c 89 9d e8 fd ff ff 	mov    %r11,-0x218(%rbp)
   2ee11:	4c 89 95 f0 fd ff ff 	mov    %r10,-0x210(%rbp)
   2ee18:	e8 83 fb fe ff       	call   1e9a0 <__JS_FreeValueRT>
   2ee1d:	4c 8b 9d e8 fd ff ff 	mov    -0x218(%rbp),%r11
   2ee24:	4c 8b 95 f0 fd ff ff 	mov    -0x210(%rbp),%r10
   2ee2b:	e9 e6 96 ff ff       	jmp    28516 <JS_CallInternal+0x30c6>
   2ee30:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ee34:	48 89 ce             	mov    %rcx,%rsi
   2ee37:	e8 64 fb fe ff       	call   1e9a0 <__JS_FreeValueRT>
   2ee3c:	e9 e0 90 ff ff       	jmp    27f21 <JS_CallInternal+0x2ad1>
   2ee41:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ee45:	89 85 d0 fd ff ff    	mov    %eax,-0x230(%rbp)
   2ee4b:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   2ee52:	e8 49 fb fe ff       	call   1e9a0 <__JS_FreeValueRT>
   2ee57:	8b 85 d0 fd ff ff    	mov    -0x230(%rbp),%eax
   2ee5d:	4c 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%r8
   2ee64:	48 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%rcx
   2ee6b:	e9 18 87 ff ff       	jmp    27588 <JS_CallInternal+0x2138>
   2ee70:	81 fa f2 00 00 00    	cmp    $0xf2,%edx
   2ee76:	7e 21                	jle    2ee99 <JS_CallInternal+0x9a49>
   2ee78:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ee7c:	48 8b 87 48 04 00 00 	mov    0x448(%rdi),%rax
   2ee83:	48 8b 34 d0          	mov    (%rax,%rdx,8),%rsi
   2ee87:	8b 46 fc             	mov    -0x4(%rsi),%eax
   2ee8a:	83 e8 01             	sub    $0x1,%eax
   2ee8d:	89 46 fc             	mov    %eax,-0x4(%rsi)
   2ee90:	85 c0                	test   %eax,%eax
   2ee92:	7f 05                	jg     2ee99 <JS_CallInternal+0x9a49>
   2ee94:	e8 07 7b fe ff       	call   169a0 <JS_FreeAtomStruct>
   2ee99:	48 8d 35 50 de 0a 00 	lea    0xade50(%rip),%rsi        # dccf0 <_IO_stdin_used+0x3cf0>
   2eea0:	4c 89 ef             	mov    %r13,%rdi
   2eea3:	31 c0                	xor    %eax,%eax
   2eea5:	e8 16 57 00 00       	call   345c0 <JS_ThrowTypeError>
   2eeaa:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   2eeb1:	48 c7 43 08 06 00 00 	movq   $0x6,0x8(%rbx)
   2eeb8:	00 
   2eeb9:	e9 8f b2 ff ff       	jmp    2a14d <JS_CallInternal+0x4cfd>
   2eebe:	09 ca                	or     %ecx,%edx
   2eec0:	0f 89 69 b8 ff ff    	jns    2a72f <JS_CallInternal+0x52df>
   2eec6:	f2 0f 10 05 12 7c 0b 	movsd  0xb7c12(%rip),%xmm0        # e6ae0 <typed_array_size_log2+0x28>
   2eecd:	00 
   2eece:	e9 8d f2 ff ff       	jmp    2e160 <JS_CallInternal+0x8d10>
   2eed3:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2eed7:	48 89 ce             	mov    %rcx,%rsi
   2eeda:	4c 89 c2             	mov    %r8,%rdx
   2eedd:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   2eee3:	e8 b8 fa fe ff       	call   1e9a0 <__JS_FreeValueRT>
   2eee8:	8b 85 f0 fd ff ff    	mov    -0x210(%rbp),%eax
   2eeee:	e9 ac 86 ff ff       	jmp    2759f <JS_CallInternal+0x214f>
   2eef3:	0f 85 3a 16 00 00    	jne    30533 <JS_CallInternal+0xb0e3>
   2eef9:	49 8b 45 10          	mov    0x10(%r13),%rax
   2eefd:	48 8b 80 f0 04 00 00 	mov    0x4f0(%rax),%rax
   2ef04:	48 85 c0             	test   %rax,%rax
   2ef07:	0f 84 fb 8e ff ff    	je     27e08 <JS_CallInternal+0x29b8>
   2ef0d:	f6 40 3c 01          	testb  $0x1,0x3c(%rax)
   2ef11:	0f 84 f1 8e ff ff    	je     27e08 <JS_CallInternal+0x29b8>
   2ef17:	89 ce                	mov    %ecx,%esi
   2ef19:	4c 89 ef             	mov    %r13,%rdi
   2ef1c:	89 8d f0 fd ff ff    	mov    %ecx,-0x210(%rbp)
   2ef22:	e8 b9 76 00 00       	call   365e0 <JS_ThrowReferenceErrorNotDefined>
   2ef27:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   2ef2d:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2ef33:	0f 8e 47 6d ff ff    	jle    25c80 <JS_CallInternal+0x830>
   2ef39:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ef3d:	89 ce                	mov    %ecx,%esi
   2ef3f:	e8 6c c0 fe ff       	call   1afb0 <JS_FreeAtom.part.0.isra.0>
   2ef44:	e9 37 6d ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2ef49:	4c 89 db             	mov    %r11,%rbx
   2ef4c:	e9 2f 6d ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2ef51:	4c 8b a5 f0 fd ff ff 	mov    -0x210(%rbp),%r12
   2ef58:	e9 23 6d ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2ef5d:	41 8b 95 a8 01 00 00 	mov    0x1a8(%r13),%edx
   2ef64:	8b 38                	mov    (%rax),%edi
   2ef66:	44 8b 06             	mov    (%rsi),%r8d
   2ef69:	83 fa 01             	cmp    $0x1,%edx
   2ef6c:	7e 4f                	jle    2efbd <JS_CallInternal+0x9b6d>
   2ef6e:	39 bd 40 fd ff ff    	cmp    %edi,-0x2c0(%rbp)
   2ef74:	0f 8e 3a 14 00 00    	jle    303b4 <JS_CallInternal+0xaf64>
   2ef7a:	41 89 f9             	mov    %edi,%r9d
   2ef7d:	41 21 c9             	and    %ecx,%r9d
   2ef80:	83 fa 02             	cmp    $0x2,%edx
   2ef83:	0f 84 b3 09 00 00    	je     2f93c <JS_CallInternal+0xa4ec>
   2ef89:	45 85 c9             	test   %r9d,%r9d
   2ef8c:	74 11                	je     2ef9f <JS_CallInternal+0x9b4f>
   2ef8e:	41 81 f8 ff ff ff 7f 	cmp    $0x7fffffff,%r8d
   2ef95:	0f 84 74 14 00 00    	je     3040f <JS_CallInternal+0xafbf>
   2ef9b:	41 83 c0 01          	add    $0x1,%r8d
   2ef9f:	01 ff                	add    %edi,%edi
   2efa1:	83 fa 03             	cmp    $0x3,%edx
   2efa4:	0f 84 51 09 00 00    	je     2f8fb <JS_CallInternal+0xa4ab>
   2efaa:	83 ea 03             	sub    $0x3,%edx
   2efad:	83 fa 01             	cmp    $0x1,%edx
   2efb0:	75 bc                	jne    2ef6e <JS_CallInternal+0x9b1e>
   2efb2:	41 c7 85 a8 01 00 00 	movl   $0x1,0x1a8(%r13)
   2efb9:	01 00 00 00 
   2efbd:	89 f9                	mov    %edi,%ecx
   2efbf:	45 31 c9             	xor    %r9d,%r9d
   2efc2:	45 31 d2             	xor    %r10d,%r10d
   2efc5:	39 bd 40 fd ff ff    	cmp    %edi,-0x2c0(%rbp)
   2efcb:	48 89 08             	mov    %rcx,(%rax)
   2efce:	4c 89 ef             	mov    %r13,%rdi
   2efd1:	4c 89 48 08          	mov    %r9,0x8(%rax)
   2efd5:	44 89 c0             	mov    %r8d,%eax
   2efd8:	48 89 06             	mov    %rax,(%rsi)
   2efdb:	48 8b 85 38 fd ff ff 	mov    -0x2c8(%rbp),%rax
   2efe2:	4c 89 56 08          	mov    %r10,0x8(%rsi)
   2efe6:	48 0f 4f 85 d8 fe ff 	cmovg  -0x128(%rbp),%rax
   2efed:	ff 
   2efee:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   2eff5:	49 89 c4             	mov    %rax,%r12
   2eff8:	e8 c3 78 00 00       	call   368c0 <js_poll_interrupts>
   2effd:	85 c0                	test   %eax,%eax
   2efff:	0f 85 7a 14 00 00    	jne    3047f <JS_CallInternal+0xb02f>
   2f005:	4c 89 e0             	mov    %r12,%rax
   2f008:	4d 8d 64 24 01       	lea    0x1(%r12),%r12
   2f00d:	0f b6 00             	movzbl (%rax),%eax
   2f010:	49 89 c2             	mov    %rax,%r10
   2f013:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2f017:	48 92                	xchg   %rax,%rdx
   2f019:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f01d:	48 89 c6             	mov    %rax,%rsi
   2f020:	e8 7b f9 fe ff       	call   1e9a0 <__JS_FreeValueRT>
   2f025:	e9 c0 76 ff ff       	jmp    266ea <JS_CallInternal+0x129a>
   2f02a:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   2f031:	48 c7 43 08 03 00 00 	movq   $0x3,0x8(%rbx)
   2f038:	00 
   2f039:	e9 fb c4 ff ff       	jmp    2b539 <JS_CallInternal+0x60e9>
   2f03e:	8b 02                	mov    (%rdx),%eax
   2f040:	25 ff ff ff 03       	and    $0x3ffffff,%eax
   2f045:	0f 85 3c ba ff ff    	jne    2aa87 <JS_CallInternal+0x5637>
   2f04b:	48 8d 0d f2 a0 0a 00 	lea    0xaa0f2(%rip),%rcx        # d9144 <_IO_stdin_used+0x144>
   2f052:	48 8d 15 cf dd 0a 00 	lea    0xaddcf(%rip),%rdx        # dce28 <_IO_stdin_used+0x3e28>
   2f059:	4c 89 ef             	mov    %r13,%rdi
   2f05c:	31 c0                	xor    %eax,%eax
   2f05e:	4c 89 85 d0 fd ff ff 	mov    %r8,-0x230(%rbp)
   2f065:	e8 66 57 00 00       	call   347d0 <__JS_ThrowTypeErrorAtom>
   2f06a:	4c 8b 85 d0 fd ff ff 	mov    -0x230(%rbp),%r8
   2f071:	e9 b7 f2 ff ff       	jmp    2e32d <JS_CallInternal+0x8edd>
   2f076:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   2f07d:	00 00 00 
   2f080:	39 c1                	cmp    %eax,%ecx
   2f082:	0f 85 68 d9 ff ff    	jne    2c9f0 <JS_CallInternal+0x75a0>
   2f088:	0f b6 4a 10          	movzbl 0x10(%rdx),%ecx
   2f08c:	f7 d1                	not    %ecx
   2f08e:	83 e1 12             	and    $0x12,%ecx
   2f091:	0f 85 59 d9 ff ff    	jne    2c9f0 <JS_CallInternal+0x75a0>
   2f097:	48 8b 7a 18          	mov    0x18(%rdx),%rdi
   2f09b:	48 8b 4f 30          	mov    0x30(%rdi),%rcx
   2f09f:	48 85 c9             	test   %rcx,%rcx
   2f0a2:	74 0a                	je     2f0ae <JS_CallInternal+0x9c5e>
   2f0a4:	f6 41 10 01          	testb  $0x1,0x10(%rcx)
   2f0a8:	0f 84 42 d9 ff ff    	je     2c9f0 <JS_CallInternal+0x75a0>
   2f0ae:	48 8b 72 20          	mov    0x20(%rdx),%rsi
   2f0b2:	83 7e 08 00          	cmpl   $0x0,0x8(%rsi)
   2f0b6:	0f 85 34 d9 ff ff    	jne    2c9f0 <JS_CallInternal+0x75a0>
   2f0bc:	8d 48 01             	lea    0x1(%rax),%ecx
   2f0bf:	39 4a 28             	cmp    %ecx,0x28(%rdx)
   2f0c2:	0f 82 28 d9 ff ff    	jb     2c9f0 <JS_CallInternal+0x75a0>
   2f0c8:	39 0e                	cmp    %ecx,(%rsi)
   2f0ca:	73 1b                	jae    2f0e7 <JS_CallInternal+0x9c97>
   2f0cc:	44 8b 47 18          	mov    0x18(%rdi),%r8d
   2f0d0:	42 f6 44 87 3f 08    	testb  $0x8,0x3f(%rdi,%r8,4)
   2f0d6:	0f 84 14 d9 ff ff    	je     2c9f0 <JS_CallInternal+0x75a0>
   2f0dc:	89 cf                	mov    %ecx,%edi
   2f0de:	48 89 3e             	mov    %rdi,(%rsi)
   2f0e1:	31 ff                	xor    %edi,%edi
   2f0e3:	48 89 7e 08          	mov    %rdi,0x8(%rsi)
   2f0e7:	89 4a 38             	mov    %ecx,0x38(%rdx)
   2f0ea:	89 c0                	mov    %eax,%eax
   2f0ec:	f3 0f 6f 43 f0       	movdqu -0x10(%rbx),%xmm0
   2f0f1:	48 c1 e0 04          	shl    $0x4,%rax
   2f0f5:	48 03 42 30          	add    0x30(%rdx),%rax
   2f0f9:	0f 11 00             	movups %xmm0,(%rax)
   2f0fc:	e9 20 8e ff ff       	jmp    27f21 <JS_CallInternal+0x2ad1>
   2f101:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2f108:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f10c:	48 89 c2             	mov    %rax,%rdx
   2f10f:	48 89 ce             	mov    %rcx,%rsi
   2f112:	e8 89 f8 fe ff       	call   1e9a0 <__JS_FreeValueRT>
   2f117:	e9 26 8e ff ff       	jmp    27f42 <JS_CallInternal+0x2af2>
   2f11c:	48 89 f2             	mov    %rsi,%rdx
   2f11f:	48 89 fe             	mov    %rdi,%rsi
   2f122:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f126:	48 89 8d e8 fd ff ff 	mov    %rcx,-0x218(%rbp)
   2f12d:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   2f134:	e8 67 f8 fe ff       	call   1e9a0 <__JS_FreeValueRT>
   2f139:	48 8b 8d e8 fd ff ff 	mov    -0x218(%rbp),%rcx
   2f140:	48 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%rax
   2f147:	e9 26 77 ff ff       	jmp    26872 <JS_CallInternal+0x1422>
   2f14c:	85 c9                	test   %ecx,%ecx
   2f14e:	0f 85 57 f1 ff ff    	jne    2e2ab <JS_CallInternal+0x8e5b>
   2f154:	e9 e5 dd ff ff       	jmp    2cf3e <JS_CallInternal+0x7aee>
   2f159:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   2f160:	8b 08                	mov    (%rax),%ecx
   2f162:	81 e1 ff ff ff 03    	and    $0x3ffffff,%ecx
   2f168:	0f 85 36 7c ff ff    	jne    26da4 <JS_CallInternal+0x1954>
   2f16e:	31 c0                	xor    %eax,%eax
   2f170:	e9 45 7c ff ff       	jmp    26dba <JS_CallInternal+0x196a>
   2f175:	48 89 f2             	mov    %rsi,%rdx
   2f178:	48 89 fe             	mov    %rdi,%rsi
   2f17b:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f17f:	48 89 85 b0 fd ff ff 	mov    %rax,-0x250(%rbp)
   2f186:	48 89 8d c0 fd ff ff 	mov    %rcx,-0x240(%rbp)
   2f18d:	4c 89 95 d0 fd ff ff 	mov    %r10,-0x230(%rbp)
   2f194:	44 89 85 e8 fd ff ff 	mov    %r8d,-0x218(%rbp)
   2f19b:	4c 89 9d f0 fd ff ff 	mov    %r11,-0x210(%rbp)
   2f1a2:	e8 f9 f7 fe ff       	call   1e9a0 <__JS_FreeValueRT>
   2f1a7:	48 8b 85 b0 fd ff ff 	mov    -0x250(%rbp),%rax
   2f1ae:	48 8b 8d c0 fd ff ff 	mov    -0x240(%rbp),%rcx
   2f1b5:	4c 8b 95 d0 fd ff ff 	mov    -0x230(%rbp),%r10
   2f1bc:	44 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%r8d
   2f1c3:	4c 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%r11
   2f1ca:	e9 ce e1 ff ff       	jmp    2d39d <JS_CallInternal+0x7f4d>
   2f1cf:	83 f9 f9             	cmp    $0xfffffff9,%ecx
   2f1d2:	0f 84 c3 0f 00 00    	je     3019b <JS_CallInternal+0xad4b>
   2f1d8:	48 8b bd 80 fe ff ff 	mov    -0x180(%rbp),%rdi
   2f1df:	49 8b 31             	mov    (%r9),%rsi
   2f1e2:	4c 89 57 30          	mov    %r10,0x30(%rdi)
   2f1e6:	83 46 fc 01          	addl   $0x1,-0x4(%rsi)
   2f1ea:	e9 94 f6 ff ff       	jmp    2e883 <JS_CallInternal+0x9433>
   2f1ef:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   2f1f5:	0f 8f 23 0f 00 00    	jg     3011e <JS_CallInternal+0xacce>
   2f1fb:	31 d2                	xor    %edx,%edx
   2f1fd:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   2f203:	e9 27 8f ff ff       	jmp    2812f <JS_CallInternal+0x2cdf>
   2f208:	0f 85 29 6e ff ff    	jne    26037 <JS_CallInternal+0xbe7>
   2f20e:	49 8b 45 10          	mov    0x10(%r13),%rax
   2f212:	48 8b 80 f0 04 00 00 	mov    0x4f0(%rax),%rax
   2f219:	48 85 c0             	test   %rax,%rax
   2f21c:	0f 84 37 0f 00 00    	je     30159 <JS_CallInternal+0xad09>
   2f222:	f6 40 3c 01          	testb  $0x1,0x3c(%rax)
   2f226:	0f 84 2d 0f 00 00    	je     30159 <JS_CallInternal+0xad09>
   2f22c:	8b b5 b0 fd ff ff    	mov    -0x250(%rbp),%esi
   2f232:	4c 89 ef             	mov    %r13,%rdi
   2f235:	4c 89 9d f0 fd ff ff 	mov    %r11,-0x210(%rbp)
   2f23c:	e8 9f 73 00 00       	call   365e0 <JS_ThrowReferenceErrorNotDefined>
   2f241:	4c 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%r11
   2f248:	e9 ea 6d ff ff       	jmp    26037 <JS_CallInternal+0xbe7>
   2f24d:	48 8b 11             	mov    (%rcx),%rdx
   2f250:	41 b9 06 00 00 00    	mov    $0x6,%r9d
   2f256:	45 31 c0             	xor    %r8d,%r8d
   2f259:	b8 06 00 00 00       	mov    $0x6,%eax
   2f25e:	e9 f9 b6 ff ff       	jmp    2a95c <JS_CallInternal+0x550c>
   2f263:	48 89 f2             	mov    %rsi,%rdx
   2f266:	48 89 fe             	mov    %rdi,%rsi
   2f269:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f26d:	48 89 85 e8 fd ff ff 	mov    %rax,-0x218(%rbp)
   2f274:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   2f27b:	e8 20 f7 fe ff       	call   1e9a0 <__JS_FreeValueRT>
   2f280:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
   2f287:	48 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%rcx
   2f28e:	e9 10 d3 ff ff       	jmp    2c5a3 <JS_CallInternal+0x7153>
   2f293:	49 8b 95 88 01 00 00 	mov    0x188(%r13),%rdx
   2f29a:	49 8b 85 80 01 00 00 	mov    0x180(%r13),%rax
   2f2a1:	83 fa f6             	cmp    $0xfffffff6,%edx
   2f2a4:	76 04                	jbe    2f2aa <JS_CallInternal+0x9e5a>
   2f2a6:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   2f2aa:	48 89 43 d0          	mov    %rax,-0x30(%rbx)
   2f2ae:	48 89 53 d8          	mov    %rdx,-0x28(%rbx)
   2f2b2:	e9 1b 8b ff ff       	jmp    27dd2 <JS_CallInternal+0x2982>
   2f2b7:	0f 85 7a 6d ff ff    	jne    26037 <JS_CallInternal+0xbe7>
   2f2bd:	49 8b 45 10          	mov    0x10(%r13),%rax
   2f2c1:	48 8b 80 f0 04 00 00 	mov    0x4f0(%rax),%rax
   2f2c8:	48 85 c0             	test   %rax,%rax
   2f2cb:	0f 84 f0 6c ff ff    	je     25fc1 <JS_CallInternal+0xb71>
   2f2d1:	f6 40 3c 01          	testb  $0x1,0x3c(%rax)
   2f2d5:	0f 84 e6 6c ff ff    	je     25fc1 <JS_CallInternal+0xb71>
   2f2db:	e9 4c ff ff ff       	jmp    2f22c <JS_CallInternal+0x9ddc>
   2f2e0:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f2e4:	48 89 ca             	mov    %rcx,%rdx
   2f2e7:	89 85 e8 fd ff ff    	mov    %eax,-0x218(%rbp)
   2f2ed:	4c 89 9d f0 fd ff ff 	mov    %r11,-0x210(%rbp)
   2f2f4:	e8 a7 f6 fe ff       	call   1e9a0 <__JS_FreeValueRT>
   2f2f9:	8b 85 e8 fd ff ff    	mov    -0x218(%rbp),%eax
   2f2ff:	4c 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%r11
   2f306:	e9 21 6d ff ff       	jmp    2602c <JS_CallInternal+0xbdc>
   2f30b:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f30f:	48 89 c2             	mov    %rax,%rdx
   2f312:	48 89 ce             	mov    %rcx,%rsi
   2f315:	4c 89 9d f0 fd ff ff 	mov    %r11,-0x210(%rbp)
   2f31c:	e8 7f f6 fe ff       	call   1e9a0 <__JS_FreeValueRT>
   2f321:	4c 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%r11
   2f328:	e9 39 6e ff ff       	jmp    26166 <JS_CallInternal+0xd16>
   2f32d:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f331:	48 89 c2             	mov    %rax,%rdx
   2f334:	48 89 ce             	mov    %rcx,%rsi
   2f337:	e8 64 f6 fe ff       	call   1e9a0 <__JS_FreeValueRT>
   2f33c:	e9 41 d1 ff ff       	jmp    2c482 <JS_CallInternal+0x7032>
   2f341:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f345:	89 f2                	mov    %esi,%edx
   2f347:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2f34b:	e8 20 9a fe ff       	call   18d70 <JS_AtomGetStrRT.constprop.0>
   2f350:	48 89 c2             	mov    %rax,%rdx
   2f353:	e9 4c a1 ff ff       	jmp    294a4 <JS_CallInternal+0x4054>
   2f358:	41 83 fa f6          	cmp    $0xfffffff6,%r10d
   2f35c:	0f 86 bc ec ff ff    	jbe    2e01e <JS_CallInternal+0x8bce>
   2f362:	8b 41 fc             	mov    -0x4(%rcx),%eax
   2f365:	83 e8 01             	sub    $0x1,%eax
   2f368:	89 41 fc             	mov    %eax,-0x4(%rcx)
   2f36b:	85 c0                	test   %eax,%eax
   2f36d:	0f 8f ab ec ff ff    	jg     2e01e <JS_CallInternal+0x8bce>
   2f373:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f377:	48 89 ce             	mov    %rcx,%rsi
   2f37a:	4c 89 d2             	mov    %r10,%rdx
   2f37d:	4c 89 85 e8 fd ff ff 	mov    %r8,-0x218(%rbp)
   2f384:	4c 89 8d f0 fd ff ff 	mov    %r9,-0x210(%rbp)
   2f38b:	e8 10 f6 fe ff       	call   1e9a0 <__JS_FreeValueRT>
   2f390:	4c 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%r9
   2f397:	4c 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%r8
   2f39e:	e9 7b ec ff ff       	jmp    2e01e <JS_CallInternal+0x8bce>
   2f3a3:	4c 39 da             	cmp    %r11,%rdx
   2f3a6:	0f 85 8a bb ff ff    	jne    2af36 <JS_CallInternal+0x5ae6>
   2f3ac:	41 8b 41 10          	mov    0x10(%r9),%eax
   2f3b0:	83 f8 ff             	cmp    $0xffffffff,%eax
   2f3b3:	0f 84 7d bb ff ff    	je     2af36 <JS_CallInternal+0x5ae6>
   2f3b9:	48 c1 e0 04          	shl    $0x4,%rax
   2f3bd:	49 03 42 20          	add    0x20(%r10),%rax
   2f3c1:	48 8b 10             	mov    (%rax),%rdx
   2f3c4:	48 8b 40 08          	mov    0x8(%rax),%rax
   2f3c8:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2f3cb:	0f 86 ce d9 ff ff    	jbe    2cd9f <JS_CallInternal+0x794f>
   2f3d1:	e9 c5 d9 ff ff       	jmp    2cd9b <JS_CallInternal+0x794b>
   2f3d6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   2f3dd:	00 00 00 
   2f3e0:	81 fa f2 00 00 00    	cmp    $0xf2,%edx
   2f3e6:	0f 8e ad fa ff ff    	jle    2ee99 <JS_CallInternal+0x9a49>
   2f3ec:	31 c0                	xor    %eax,%eax
   2f3ee:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f3f2:	48 8b 8f 48 04 00 00 	mov    0x448(%rdi),%rcx
   2f3f9:	48 8b 34 d1          	mov    (%rcx,%rdx,8),%rsi
   2f3fd:	8b 4e fc             	mov    -0x4(%rsi),%ecx
   2f400:	8d 51 ff             	lea    -0x1(%rcx),%edx
   2f403:	89 56 fc             	mov    %edx,-0x4(%rsi)
   2f406:	85 d2                	test   %edx,%edx
   2f408:	7f 13                	jg     2f41d <JS_CallInternal+0x9fcd>
   2f40a:	48 89 85 d0 fd ff ff 	mov    %rax,-0x230(%rbp)
   2f411:	e8 8a 75 fe ff       	call   169a0 <JS_FreeAtomStruct>
   2f416:	48 8b 85 d0 fd ff ff 	mov    -0x230(%rbp),%rax
   2f41d:	48 85 c0             	test   %rax,%rax
   2f420:	0f 85 9c ad ff ff    	jne    2a1c2 <JS_CallInternal+0x4d72>
   2f426:	e9 6e fa ff ff       	jmp    2ee99 <JS_CallInternal+0x9a49>
   2f42b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   2f430:	48 63 b5 60 fe ff ff 	movslq -0x1a0(%rbp),%rsi
   2f437:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f43b:	48 89 95 b0 fd ff ff 	mov    %rdx,-0x250(%rbp)
   2f442:	48 89 8d c0 fd ff ff 	mov    %rcx,-0x240(%rbp)
   2f449:	48 c1 e6 04          	shl    $0x4,%rsi
   2f44d:	48 89 b5 d0 fd ff ff 	mov    %rsi,-0x230(%rbp)
   2f454:	e8 27 6a fe ff       	call   15e80 <__js_malloc>
   2f459:	4c 8b 95 50 fe ff ff 	mov    -0x1b0(%rbp),%r10
   2f460:	48 8b b5 d0 fd ff ff 	mov    -0x230(%rbp),%rsi
   2f467:	48 89 c2             	mov    %rax,%rdx
   2f46a:	31 c0                	xor    %eax,%eax
   2f46c:	48 8b 8d c0 fd ff ff 	mov    -0x240(%rbp),%rcx
   2f473:	4c 8b 85 b0 fd ff ff 	mov    -0x250(%rbp),%r8
   2f47a:	48 85 d2             	test   %rdx,%rdx
   2f47d:	0f 84 c5 0f 00 00    	je     30448 <JS_CallInternal+0xaff8>
   2f483:	4d 8b 4c 02 08       	mov    0x8(%r10,%rax,1),%r9
   2f488:	49 8b 3c 02          	mov    (%r10,%rax,1),%rdi
   2f48c:	41 83 f9 f6          	cmp    $0xfffffff6,%r9d
   2f490:	76 04                	jbe    2f496 <JS_CallInternal+0xa046>
   2f492:	83 47 fc 01          	addl   $0x1,-0x4(%rdi)
   2f496:	48 89 3c 02          	mov    %rdi,(%rdx,%rax,1)
   2f49a:	4c 89 4c 02 08       	mov    %r9,0x8(%rdx,%rax,1)
   2f49f:	48 83 c0 10          	add    $0x10,%rax
   2f4a3:	48 39 c6             	cmp    %rax,%rsi
   2f4a6:	75 db                	jne    2f483 <JS_CallInternal+0xa033>
   2f4a8:	8b 85 60 fe ff ff    	mov    -0x1a0(%rbp),%eax
   2f4ae:	48 89 51 30          	mov    %rdx,0x30(%rcx)
   2f4b2:	89 41 38             	mov    %eax,0x38(%rcx)
   2f4b5:	48 89 0b             	mov    %rcx,(%rbx)
   2f4b8:	4c 89 43 08          	mov    %r8,0x8(%rbx)
   2f4bc:	e9 18 ab ff ff       	jmp    29fd9 <JS_CallInternal+0x4b89>
   2f4c1:	48 8b bd 68 fe ff ff 	mov    -0x198(%rbp),%rdi
   2f4c8:	4c 89 c6             	mov    %r8,%rsi
   2f4cb:	e8 b0 36 ff ff       	call   22b80 <free_var_ref>
   2f4d0:	e9 92 67 ff ff       	jmp    25c67 <JS_CallInternal+0x817>
   2f4d5:	48 89 f2             	mov    %rsi,%rdx
   2f4d8:	48 89 fe             	mov    %rdi,%rsi
   2f4db:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f4df:	48 89 8d e8 fd ff ff 	mov    %rcx,-0x218(%rbp)
   2f4e6:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   2f4ed:	e8 ae f4 fe ff       	call   1e9a0 <__JS_FreeValueRT>
   2f4f2:	48 8b 8d e8 fd ff ff 	mov    -0x218(%rbp),%rcx
   2f4f9:	48 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%rax
   2f500:	e9 f4 ce ff ff       	jmp    2c3f9 <JS_CallInternal+0x6fa9>
   2f505:	f2 0f 10 05 3b ff 0a 	movsd  0xaff3b(%rip),%xmm0        # df448 <__PRETTY_FUNCTION__.0+0xb8>
   2f50c:	00 
   2f50d:	e9 70 ce ff ff       	jmp    2c382 <JS_CallInternal+0x6f32>
   2f512:	f2 0f 10 05 c6 75 0b 	movsd  0xb75c6(%rip),%xmm0        # e6ae0 <typed_array_size_log2+0x28>
   2f519:	00 
   2f51a:	e9 63 ce ff ff       	jmp    2c382 <JS_CallInternal+0x6f32>
   2f51f:	66 41 83 7a 12 01    	cmpw   $0x1,0x12(%r10)
   2f525:	0f 85 80 ba ff ff    	jne    2afab <JS_CallInternal+0x5b5b>
   2f52b:	41 f6 42 10 08       	testb  $0x8,0x10(%r10)
   2f530:	0f 85 75 ba ff ff    	jne    2afab <JS_CallInternal+0x5b5b>
   2f536:	80 7a 10 00          	cmpb   $0x0,0x10(%rdx)
   2f53a:	0f 84 6b ba ff ff    	je     2afab <JS_CallInternal+0x5b5b>
   2f540:	49 8b 79 08          	mov    0x8(%r9),%rdi
   2f544:	45 31 d2             	xor    %r10d,%r10d
   2f547:	48 c1 fe 04          	sar    $0x4,%rsi
   2f54b:	4d 8b 01             	mov    (%r9),%r8
   2f54e:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2f552:	49 89 11             	mov    %rdx,(%r9)
   2f555:	4d 89 51 08          	mov    %r10,0x8(%r9)
   2f559:	41 89 71 10          	mov    %esi,0x10(%r9)
   2f55d:	48 85 ff             	test   %rdi,%rdi
   2f560:	74 36                	je     2f598 <JS_CallInternal+0xa148>
   2f562:	48 89 fe             	mov    %rdi,%rsi
   2f565:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f569:	4c 89 85 d0 fd ff ff 	mov    %r8,-0x230(%rbp)
   2f570:	48 89 8d e8 fd ff ff 	mov    %rcx,-0x218(%rbp)
   2f577:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   2f57e:	e8 ad 10 ff ff       	call   20630 <js_free_shape>
   2f583:	4c 8b 85 d0 fd ff ff 	mov    -0x230(%rbp),%r8
   2f58a:	48 8b 8d e8 fd ff ff 	mov    -0x218(%rbp),%rcx
   2f591:	48 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%rax
   2f598:	4d 85 c0             	test   %r8,%r8
   2f59b:	0f 84 0a ba ff ff    	je     2afab <JS_CallInternal+0x5b5b>
   2f5a1:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f5a5:	4c 89 c6             	mov    %r8,%rsi
   2f5a8:	48 89 8d e8 fd ff ff 	mov    %rcx,-0x218(%rbp)
   2f5af:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   2f5b6:	e8 75 10 ff ff       	call   20630 <js_free_shape>
   2f5bb:	48 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%rax
   2f5c2:	48 8b 8d e8 fd ff ff 	mov    -0x218(%rbp),%rcx
   2f5c9:	e9 dd b9 ff ff       	jmp    2afab <JS_CallInternal+0x5b5b>
   2f5ce:	66 90                	xchg   %ax,%ax
   2f5d0:	66 83 78 12 01       	cmpw   $0x1,0x12(%rax)
   2f5d5:	0f 85 96 ba ff ff    	jne    2b071 <JS_CallInternal+0x5c21>
   2f5db:	f6 40 10 08          	testb  $0x8,0x10(%rax)
   2f5df:	0f 85 8c ba ff ff    	jne    2b071 <JS_CallInternal+0x5c21>
   2f5e5:	80 7f 10 00          	cmpb   $0x0,0x10(%rdi)
   2f5e9:	0f 84 82 ba ff ff    	je     2b071 <JS_CallInternal+0x5c21>
   2f5ef:	49 8b 72 08          	mov    0x8(%r10),%rsi
   2f5f3:	49 8b 02             	mov    (%r10),%rax
   2f5f6:	48 c1 fa 04          	sar    $0x4,%rdx
   2f5fa:	83 47 fc 01          	addl   $0x1,-0x4(%rdi)
   2f5fe:	49 89 3a             	mov    %rdi,(%r10)
   2f601:	31 ff                	xor    %edi,%edi
   2f603:	49 89 7a 08          	mov    %rdi,0x8(%r10)
   2f607:	41 89 52 10          	mov    %edx,0x10(%r10)
   2f60b:	48 85 f6             	test   %rsi,%rsi
   2f60e:	74 33                	je     2f643 <JS_CallInternal+0xa1f3>
   2f610:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f614:	48 89 85 d0 fd ff ff 	mov    %rax,-0x230(%rbp)
   2f61b:	4c 89 8d e8 fd ff ff 	mov    %r9,-0x218(%rbp)
   2f622:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   2f629:	e8 02 10 ff ff       	call   20630 <js_free_shape>
   2f62e:	48 8b 85 d0 fd ff ff 	mov    -0x230(%rbp),%rax
   2f635:	4c 8b 8d e8 fd ff ff 	mov    -0x218(%rbp),%r9
   2f63c:	48 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%rcx
   2f643:	48 85 c0             	test   %rax,%rax
   2f646:	0f 84 25 ba ff ff    	je     2b071 <JS_CallInternal+0x5c21>
   2f64c:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f650:	48 89 c6             	mov    %rax,%rsi
   2f653:	4c 89 8d e8 fd ff ff 	mov    %r9,-0x218(%rbp)
   2f65a:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   2f661:	e8 ca 0f ff ff       	call   20630 <js_free_shape>
   2f666:	48 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%rcx
   2f66d:	4c 8b 8d e8 fd ff ff 	mov    -0x218(%rbp),%r9
   2f674:	e9 f8 b9 ff ff       	jmp    2b071 <JS_CallInternal+0x5c21>
   2f679:	49 83 c4 05          	add    $0x5,%r12
   2f67d:	e9 fe 65 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2f682:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f686:	48 89 f2             	mov    %rsi,%rdx
   2f689:	48 89 ce             	mov    %rcx,%rsi
   2f68c:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   2f692:	e8 09 f3 fe ff       	call   1e9a0 <__JS_FreeValueRT>
   2f697:	8b 85 f0 fd ff ff    	mov    -0x210(%rbp),%eax
   2f69d:	e9 a7 d3 ff ff       	jmp    2ca49 <JS_CallInternal+0x75f9>
   2f6a2:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
   2f6a8:	e9 dc dc ff ff       	jmp    2d389 <JS_CallInternal+0x7f39>
   2f6ad:	48 8d 35 ac d6 0a 00 	lea    0xad6ac(%rip),%rsi        # dcd60 <_IO_stdin_used+0x3d60>
   2f6b4:	4c 89 ef             	mov    %r13,%rdi
   2f6b7:	31 c0                	xor    %eax,%eax
   2f6b9:	e8 02 4f 00 00       	call   345c0 <JS_ThrowTypeError>
   2f6be:	e9 bd 65 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2f6c3:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f6c7:	48 89 c2             	mov    %rax,%rdx
   2f6ca:	48 89 ce             	mov    %rcx,%rsi
   2f6cd:	e8 ce f2 fe ff       	call   1e9a0 <__JS_FreeValueRT>
   2f6d2:	4c 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%r11
   2f6d9:	e9 f3 ba ff ff       	jmp    2b1d1 <JS_CallInternal+0x5d81>
   2f6de:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f6e2:	4c 89 d6             	mov    %r10,%rsi
   2f6e5:	4c 89 da             	mov    %r11,%rdx
   2f6e8:	89 85 e8 fd ff ff    	mov    %eax,-0x218(%rbp)
   2f6ee:	e8 ad f2 fe ff       	call   1e9a0 <__JS_FreeValueRT>
   2f6f3:	8b 85 e8 fd ff ff    	mov    -0x218(%rbp),%eax
   2f6f9:	e9 d4 d3 ff ff       	jmp    2cad2 <JS_CallInternal+0x7682>
   2f6fe:	8b 85 30 fe ff ff    	mov    -0x1d0(%rbp),%eax
   2f704:	83 e8 02             	sub    $0x2,%eax
   2f707:	83 f8 01             	cmp    $0x1,%eax
   2f70a:	0f 87 f6 00 00 00    	ja     2f806 <JS_CallInternal+0xa3b6>
   2f710:	49 8b 85 88 01 00 00 	mov    0x188(%r13),%rax
   2f717:	49 8b 95 80 01 00 00 	mov    0x180(%r13),%rdx
   2f71e:	83 f8 f6             	cmp    $0xfffffff6,%eax
   2f721:	0f 86 2f a5 ff ff    	jbe    29c56 <JS_CallInternal+0x4806>
   2f727:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2f72b:	e9 26 a5 ff ff       	jmp    29c56 <JS_CallInternal+0x4806>
   2f730:	48 89 03             	mov    %rax,(%rbx)
   2f733:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   2f737:	e9 11 aa ff ff       	jmp    2a14d <JS_CallInternal+0x4cfd>
   2f73c:	8d 41 fe             	lea    -0x2(%rcx),%eax
   2f73f:	83 f8 01             	cmp    $0x1,%eax
   2f742:	0f 86 84 0d 00 00    	jbe    304cc <JS_CallInternal+0xb07c>
   2f748:	83 f9 ff             	cmp    $0xffffffff,%ecx
   2f74b:	0f 85 5a d9 ff ff    	jne    2d0ab <JS_CallInternal+0x7c5b>
   2f751:	45 0f b6 41 11       	movzbl 0x11(%r9),%r8d
   2f756:	48 89 ca             	mov    %rcx,%rdx
   2f759:	4c 89 ce             	mov    %r9,%rsi
   2f75c:	4c 89 ef             	mov    %r13,%rdi
   2f75f:	41 83 e0 01          	and    $0x1,%r8d
   2f763:	44 89 85 f0 fd ff ff 	mov    %r8d,-0x210(%rbp)
   2f76a:	e8 b1 f3 fe ff       	call   1eb20 <JS_FreeValue>
   2f76f:	44 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8d
   2f776:	e9 e8 78 ff ff       	jmp    27063 <JS_CallInternal+0x1c13>
   2f77b:	8d 41 fe             	lea    -0x2(%rcx),%eax
   2f77e:	83 f8 01             	cmp    $0x1,%eax
   2f781:	0f 86 50 0d 00 00    	jbe    304d7 <JS_CallInternal+0xb087>
   2f787:	83 f9 ff             	cmp    $0xffffffff,%ecx
   2f78a:	0f 85 1b d9 ff ff    	jne    2d0ab <JS_CallInternal+0x7c5b>
   2f790:	4c 39 cf             	cmp    %r9,%rdi
   2f793:	48 89 fe             	mov    %rdi,%rsi
   2f796:	4c 89 ef             	mov    %r13,%rdi
   2f799:	48 89 8d d0 fd ff ff 	mov    %rcx,-0x230(%rbp)
   2f7a0:	41 0f 94 c0          	sete   %r8b
   2f7a4:	4c 89 8d e8 fd ff ff 	mov    %r9,-0x218(%rbp)
   2f7ab:	45 0f b6 c0          	movzbl %r8b,%r8d
   2f7af:	44 89 85 f0 fd ff ff 	mov    %r8d,-0x210(%rbp)
   2f7b6:	e8 65 f3 fe ff       	call   1eb20 <JS_FreeValue>
   2f7bb:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
   2f7c2:	48 8b 95 d0 fd ff ff 	mov    -0x230(%rbp),%rdx
   2f7c9:	4c 89 ef             	mov    %r13,%rdi
   2f7cc:	48 89 c6             	mov    %rax,%rsi
   2f7cf:	e8 4c f3 fe ff       	call   1eb20 <JS_FreeValue>
   2f7d4:	44 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8d
   2f7db:	e9 83 78 ff ff       	jmp    27063 <JS_CallInternal+0x1c13>
   2f7e0:	85 c9                	test   %ecx,%ecx
   2f7e2:	75 52                	jne    2f836 <JS_CallInternal+0xa3e6>
   2f7e4:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2f7e8:	66 48 0f 6e ef       	movq   %rdi,%xmm5
   2f7ed:	45 31 c0             	xor    %r8d,%r8d
   2f7f0:	f2 41 0f 2a c1       	cvtsi2sd %r9d,%xmm0
   2f7f5:	66 0f 2e c5          	ucomisd %xmm5,%xmm0
   2f7f9:	41 0f 9b c0          	setnp  %r8b
   2f7fd:	44 0f 45 c1          	cmovne %ecx,%r8d
   2f801:	e9 5d 78 ff ff       	jmp    27063 <JS_CallInternal+0x1c13>
   2f806:	48 8b 85 10 fe ff ff 	mov    -0x1f0(%rbp),%rax
   2f80d:	48 8b 95 30 fe ff ff 	mov    -0x1d0(%rbp),%rdx
   2f814:	4c 89 ef             	mov    %r13,%rdi
   2f817:	48 89 c6             	mov    %rax,%rsi
   2f81a:	e8 b1 c1 01 00       	call   4b9d0 <JS_ToObject>
   2f81f:	48 89 c1             	mov    %rax,%rcx
   2f822:	48 89 d0             	mov    %rdx,%rax
   2f825:	83 fa 06             	cmp    $0x6,%edx
   2f828:	0f 84 52 64 ff ff    	je     25c80 <JS_CallInternal+0x830>
   2f82e:	48 89 ca             	mov    %rcx,%rdx
   2f831:	e9 20 a4 ff ff       	jmp    29c56 <JS_CallInternal+0x4806>
   2f836:	83 f9 08             	cmp    $0x8,%ecx
   2f839:	0f 85 6c d8 ff ff    	jne    2d0ab <JS_CallInternal+0x7c5b>
   2f83f:	66 48 0f 6e f7       	movq   %rdi,%xmm6
   2f844:	66 49 0f 6e f9       	movq   %r9,%xmm7
   2f849:	45 31 c0             	xor    %r8d,%r8d
   2f84c:	b8 00 00 00 00       	mov    $0x0,%eax
   2f851:	66 0f 2e f7          	ucomisd %xmm7,%xmm6
   2f855:	41 0f 9b c0          	setnp  %r8b
   2f859:	44 0f 45 c0          	cmovne %eax,%r8d
   2f85d:	e9 01 78 ff ff       	jmp    27063 <JS_CallInternal+0x1c13>
   2f862:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2f866:	4c 89 c6             	mov    %r8,%rsi
   2f869:	4c 89 e2             	mov    %r12,%rdx
   2f86c:	89 85 c0 fd ff ff    	mov    %eax,-0x240(%rbp)
   2f872:	44 89 95 d0 fd ff ff 	mov    %r10d,-0x230(%rbp)
   2f879:	4c 89 9d e8 fd ff ff 	mov    %r11,-0x218(%rbp)
   2f880:	e8 1b f1 fe ff       	call   1e9a0 <__JS_FreeValueRT>
   2f885:	8b 85 c0 fd ff ff    	mov    -0x240(%rbp),%eax
   2f88b:	44 8b 95 d0 fd ff ff 	mov    -0x230(%rbp),%r10d
   2f892:	4c 8b 9d e8 fd ff ff 	mov    -0x218(%rbp),%r11
   2f899:	e9 12 c4 ff ff       	jmp    2bcb0 <JS_CallInternal+0x6860>
   2f89e:	48 8d 35 50 9d 0a 00 	lea    0xa9d50(%rip),%rsi        # d95f5 <_IO_stdin_used+0x5f5>
   2f8a5:	4c 89 ef             	mov    %r13,%rdi
   2f8a8:	31 c0                	xor    %eax,%eax
   2f8aa:	e8 11 4d 00 00       	call   345c0 <JS_ThrowTypeError>
   2f8af:	e9 cc 63 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2f8b4:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2f8b8:	f2 0f 2a ca          	cvtsi2sd %edx,%xmm1
   2f8bc:	66 48 0f 6e c0       	movq   %rax,%xmm0
   2f8c1:	31 c0                	xor    %eax,%eax
   2f8c3:	66 0f 2f c8          	comisd %xmm0,%xmm1
   2f8c7:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   2f8ce:	00 
   2f8cf:	0f 93 c0             	setae  %al
   2f8d2:	48 83 eb 10          	sub    $0x10,%rbx
   2f8d6:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2f8da:	e9 9d 81 ff ff       	jmp    27a7c <JS_CallInternal+0x262c>
   2f8df:	66 48 0f 6e ca       	movq   %rdx,%xmm1
   2f8e4:	83 f9 08             	cmp    $0x8,%ecx
   2f8e7:	74 d3                	je     2f8bc <JS_CallInternal+0xa46c>
   2f8e9:	85 c9                	test   %ecx,%ecx
   2f8eb:	0f 85 44 f2 ff ff    	jne    2eb35 <JS_CallInternal+0x96e5>
   2f8f1:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2f8f5:	f2 0f 2a c0          	cvtsi2sd %eax,%xmm0
   2f8f9:	eb c6                	jmp    2f8c1 <JS_CallInternal+0xa471>
   2f8fb:	89 f9                	mov    %edi,%ecx
   2f8fd:	45 31 c9             	xor    %r9d,%r9d
   2f900:	45 31 d2             	xor    %r10d,%r10d
   2f903:	4c 89 ef             	mov    %r13,%rdi
   2f906:	41 c7 85 a8 01 00 00 	movl   $0x1,0x1a8(%r13)
   2f90d:	01 00 00 00 
   2f911:	48 89 08             	mov    %rcx,(%rax)
   2f914:	4c 89 48 08          	mov    %r9,0x8(%rax)
   2f918:	44 89 c0             	mov    %r8d,%eax
   2f91b:	48 89 06             	mov    %rax,(%rsi)
   2f91e:	4c 89 56 08          	mov    %r10,0x8(%rsi)
   2f922:	e8 99 6f 00 00       	call   368c0 <js_poll_interrupts>
   2f927:	85 c0                	test   %eax,%eax
   2f929:	0f 85 50 0b 00 00    	jne    3047f <JS_CallInternal+0xb02f>
   2f92f:	41 0f b6 44 24 ff    	movzbl -0x1(%r12),%eax
   2f935:	49 89 c2             	mov    %rax,%r10
   2f938:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2f93c:	41 c7 85 a8 01 00 00 	movl   $0x1,0x1a8(%r13)
   2f943:	01 00 00 00 
   2f947:	89 f9                	mov    %edi,%ecx
   2f949:	31 d2                	xor    %edx,%edx
   2f94b:	4c 89 ef             	mov    %r13,%rdi
   2f94e:	48 89 08             	mov    %rcx,(%rax)
   2f951:	31 c9                	xor    %ecx,%ecx
   2f953:	45 85 c9             	test   %r9d,%r9d
   2f956:	48 89 50 08          	mov    %rdx,0x8(%rax)
   2f95a:	44 89 c0             	mov    %r8d,%eax
   2f95d:	48 89 06             	mov    %rax,(%rsi)
   2f960:	48 8b 85 30 fd ff ff 	mov    -0x2d0(%rbp),%rax
   2f967:	48 89 4e 08          	mov    %rcx,0x8(%rsi)
   2f96b:	48 0f 44 85 e8 fe ff 	cmove  -0x118(%rbp),%rax
   2f972:	ff 
   2f973:	48 89 85 f0 fd ff ff 	mov    %rax,-0x210(%rbp)
   2f97a:	49 89 c4             	mov    %rax,%r12
   2f97d:	e8 3e 6f 00 00       	call   368c0 <js_poll_interrupts>
   2f982:	85 c0                	test   %eax,%eax
   2f984:	0f 85 f5 0a 00 00    	jne    3047f <JS_CallInternal+0xb02f>
   2f98a:	4c 89 e0             	mov    %r12,%rax
   2f98d:	4d 8d 64 24 01       	lea    0x1(%r12),%r12
   2f992:	0f b6 00             	movzbl (%rax),%eax
   2f995:	49 89 c2             	mov    %rax,%r10
   2f998:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   2f99c:	4d 89 c3             	mov    %r8,%r11
   2f99f:	49 89 d1             	mov    %rdx,%r9
   2f9a2:	45 31 c0             	xor    %r8d,%r8d
   2f9a5:	4c 89 d2             	mov    %r10,%rdx
   2f9a8:	4c 89 d9             	mov    %r11,%rcx
   2f9ab:	4c 89 ce             	mov    %r9,%rsi
   2f9ae:	4c 89 95 c0 fd ff ff 	mov    %r10,-0x240(%rbp)
   2f9b5:	4c 89 9d c8 fd ff ff 	mov    %r11,-0x238(%rbp)
   2f9bc:	48 89 bd d0 fd ff ff 	mov    %rdi,-0x230(%rbp)
   2f9c3:	4c 89 8d e8 fd ff ff 	mov    %r9,-0x218(%rbp)
   2f9ca:	e8 a1 c7 fe ff       	call   1c170 <js_strict_eq2.isra.0>
   2f9cf:	48 8b b5 d0 fd ff ff 	mov    -0x230(%rbp),%rsi
   2f9d6:	48 8b 95 e8 fd ff ff 	mov    -0x218(%rbp),%rdx
   2f9dd:	4c 89 ef             	mov    %r13,%rdi
   2f9e0:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   2f9e6:	e8 35 f1 fe ff       	call   1eb20 <JS_FreeValue>
   2f9eb:	4c 8b 95 c0 fd ff ff 	mov    -0x240(%rbp),%r10
   2f9f2:	4c 8b 9d c8 fd ff ff 	mov    -0x238(%rbp),%r11
   2f9f9:	e9 e3 f1 ff ff       	jmp    2ebe1 <JS_CallInternal+0x9791>
   2f9fe:	31 c9                	xor    %ecx,%ecx
   2fa00:	41 83 f8 ff          	cmp    $0xffffffff,%r8d
   2fa04:	75 08                	jne    2fa0e <JS_CallInternal+0xa5be>
   2fa06:	31 c9                	xor    %ecx,%ecx
   2fa08:	4c 39 d7             	cmp    %r10,%rdi
   2fa0b:	0f 94 c1             	sete   %cl
   2fa0e:	48 89 fe             	mov    %rdi,%rsi
   2fa11:	4c 89 ef             	mov    %r13,%rdi
   2fa14:	4c 89 95 e8 fd ff ff 	mov    %r10,-0x218(%rbp)
   2fa1b:	4c 89 85 d0 fd ff ff 	mov    %r8,-0x230(%rbp)
   2fa22:	89 8d f0 fd ff ff    	mov    %ecx,-0x210(%rbp)
   2fa28:	e8 f3 f0 fe ff       	call   1eb20 <JS_FreeValue>
   2fa2d:	4c 8b 95 e8 fd ff ff 	mov    -0x218(%rbp),%r10
   2fa34:	4c 8b 9d d0 fd ff ff 	mov    -0x230(%rbp),%r11
   2fa3b:	e9 a1 f1 ff ff       	jmp    2ebe1 <JS_CallInternal+0x9791>
   2fa40:	45 85 c0             	test   %r8d,%r8d
   2fa43:	75 74                	jne    2fab9 <JS_CallInternal+0xa669>
   2fa45:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2fa49:	66 48 0f 6e ef       	movq   %rdi,%xmm5
   2fa4e:	31 c0                	xor    %eax,%eax
   2fa50:	ba 00 00 00 00       	mov    $0x0,%edx
   2fa55:	f2 41 0f 2a c2       	cvtsi2sd %r10d,%xmm0
   2fa5a:	66 0f 2e c5          	ucomisd %xmm5,%xmm0
   2fa5e:	0f 9b c0             	setnp  %al
   2fa61:	48 0f 45 c2          	cmovne %rdx,%rax
   2fa65:	e9 53 75 ff ff       	jmp    26fbd <JS_CallInternal+0x1b6d>
   2fa6a:	48 8d 35 97 d3 0a 00 	lea    0xad397(%rip),%rsi        # dce08 <_IO_stdin_used+0x3e08>
   2fa71:	4c 89 ef             	mov    %r13,%rdi
   2fa74:	31 c0                	xor    %eax,%eax
   2fa76:	e8 45 4b 00 00       	call   345c0 <JS_ThrowTypeError>
   2fa7b:	e9 00 62 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2fa80:	48 8d 35 99 d2 0a 00 	lea    0xad299(%rip),%rsi        # dcd20 <_IO_stdin_used+0x3d20>
   2fa87:	4c 89 ff             	mov    %r15,%rdi
   2fa8a:	31 c0                	xor    %eax,%eax
   2fa8c:	e8 2f 4b 00 00       	call   345c0 <JS_ThrowTypeError>
   2fa91:	e9 ea 61 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2fa96:	66 48 0f 6e c9       	movq   %rcx,%xmm1
   2fa9b:	83 f8 08             	cmp    $0x8,%eax
   2fa9e:	0f 84 f4 e6 ff ff    	je     2e198 <JS_CallInternal+0x8d48>
   2faa4:	85 c0                	test   %eax,%eax
   2faa6:	0f 85 8e b1 ff ff    	jne    2ac3a <JS_CallInternal+0x57ea>
   2faac:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2fab0:	f2 0f 2a c2          	cvtsi2sd %edx,%xmm0
   2fab4:	e9 e4 e6 ff ff       	jmp    2e19d <JS_CallInternal+0x8d4d>
   2fab9:	41 83 f8 08          	cmp    $0x8,%r8d
   2fabd:	0f 85 c0 08 00 00    	jne    30383 <JS_CallInternal+0xaf33>
   2fac3:	66 48 0f 6e f7       	movq   %rdi,%xmm6
   2fac8:	66 49 0f 6e fa       	movq   %r10,%xmm7
   2facd:	31 c0                	xor    %eax,%eax
   2facf:	ba 00 00 00 00       	mov    $0x0,%edx
   2fad4:	66 0f 2e f7          	ucomisd %xmm7,%xmm6
   2fad8:	0f 9b c0             	setnp  %al
   2fadb:	48 0f 45 c2          	cmovne %rdx,%rax
   2fadf:	e9 d9 74 ff ff       	jmp    26fbd <JS_CallInternal+0x1b6d>
   2fae4:	4c 8b a5 f0 fd ff ff 	mov    -0x210(%rbp),%r12
   2faeb:	e9 90 61 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2faf0:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2faf4:	4c 89 d6             	mov    %r10,%rsi
   2faf7:	48 89 ca             	mov    %rcx,%rdx
   2fafa:	e8 a1 ee fe ff       	call   1e9a0 <__JS_FreeValueRT>
   2faff:	e9 32 d7 ff ff       	jmp    2d236 <JS_CallInternal+0x7de6>
   2fb04:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2fb08:	48 89 ce             	mov    %rcx,%rsi
   2fb0b:	48 89 da             	mov    %rbx,%rdx
   2fb0e:	4c 89 8d b0 fd ff ff 	mov    %r9,-0x250(%rbp)
   2fb15:	4c 89 85 c0 fd ff ff 	mov    %r8,-0x240(%rbp)
   2fb1c:	e8 7f ee fe ff       	call   1e9a0 <__JS_FreeValueRT>
   2fb21:	4c 8b 8d b0 fd ff ff 	mov    -0x250(%rbp),%r9
   2fb28:	4c 8b 85 c0 fd ff ff 	mov    -0x240(%rbp),%r8
   2fb2f:	e9 44 d5 ff ff       	jmp    2d078 <JS_CallInternal+0x7c28>
   2fb34:	48 8b 95 d0 fd ff ff 	mov    -0x230(%rbp),%rdx
   2fb3b:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2fb3f:	48 89 de             	mov    %rbx,%rsi
   2fb42:	4c 89 8d c0 fd ff ff 	mov    %r9,-0x240(%rbp)
   2fb49:	4c 89 85 f0 fd ff ff 	mov    %r8,-0x210(%rbp)
   2fb50:	e8 4b ee fe ff       	call   1e9a0 <__JS_FreeValueRT>
   2fb55:	4c 8b 8d c0 fd ff ff 	mov    -0x240(%rbp),%r9
   2fb5c:	4c 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8
   2fb63:	e9 37 d5 ff ff       	jmp    2d09f <JS_CallInternal+0x7c4f>
   2fb68:	8d 70 07             	lea    0x7(%rax),%esi
   2fb6b:	83 fe 01             	cmp    $0x1,%esi
   2fb6e:	0f 87 6e e2 ff ff    	ja     2dde2 <JS_CallInternal+0x8992>
   2fb74:	48 89 fe             	mov    %rdi,%rsi
   2fb77:	49 89 c0             	mov    %rax,%r8
   2fb7a:	48 8d 5b f0          	lea    -0x10(%rbx),%rbx
   2fb7e:	4c 89 ef             	mov    %r13,%rdi
   2fb81:	e8 8a 4b 01 00       	call   44710 <JS_ConcatString>
   2fb86:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
   2fb8a:	83 7b f8 06          	cmpl   $0x6,-0x8(%rbx)
   2fb8e:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2fb92:	0f 85 ca ac ff ff    	jne    2a862 <JS_CallInternal+0x5412>
   2fb98:	e9 e3 60 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2fb9d:	41 8d 40 fe          	lea    -0x2(%r8),%eax
   2fba1:	83 f8 01             	cmp    $0x1,%eax
   2fba4:	0f 86 11 07 00 00    	jbe    302bb <JS_CallInternal+0xae6b>
   2fbaa:	41 83 f8 ff          	cmp    $0xffffffff,%r8d
   2fbae:	0f 85 1c d5 ff ff    	jne    2d0d0 <JS_CallInternal+0x7c80>
   2fbb4:	41 0f b6 49 11       	movzbl 0x11(%r9),%ecx
   2fbb9:	4d 87 c8             	xchg   %r9,%r8
   2fbbc:	83 e1 01             	and    $0x1,%ecx
   2fbbf:	89 8d f0 fd ff ff    	mov    %ecx,-0x210(%rbp)
   2fbc5:	e9 c0 e2 ff ff       	jmp    2de8a <JS_CallInternal+0x8a3a>
   2fbca:	41 8d 40 fe          	lea    -0x2(%r8),%eax
   2fbce:	83 f8 01             	cmp    $0x1,%eax
   2fbd1:	0f 86 ee 06 00 00    	jbe    302c5 <JS_CallInternal+0xae75>
   2fbd7:	41 83 f8 ff          	cmp    $0xffffffff,%r8d
   2fbdb:	0f 85 ef d4 ff ff    	jne    2d0d0 <JS_CallInternal+0x7c80>
   2fbe1:	4c 39 cf             	cmp    %r9,%rdi
   2fbe4:	48 89 fe             	mov    %rdi,%rsi
   2fbe7:	4c 89 ef             	mov    %r13,%rdi
   2fbea:	4c 89 85 d0 fd ff ff 	mov    %r8,-0x230(%rbp)
   2fbf1:	0f 94 c1             	sete   %cl
   2fbf4:	4c 89 8d e8 fd ff ff 	mov    %r9,-0x218(%rbp)
   2fbfb:	0f b6 c9             	movzbl %cl,%ecx
   2fbfe:	89 8d f0 fd ff ff    	mov    %ecx,-0x210(%rbp)
   2fc04:	e8 17 ef fe ff       	call   1eb20 <JS_FreeValue>
   2fc09:	4c 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%r8
   2fc10:	4c 8b 8d d0 fd ff ff 	mov    -0x230(%rbp),%r9
   2fc17:	e9 6e e2 ff ff       	jmp    2de8a <JS_CallInternal+0x8a3a>
   2fc1c:	45 85 c0             	test   %r8d,%r8d
   2fc1f:	0f 85 f6 00 00 00    	jne    2fd1b <JS_CallInternal+0xa8cb>
   2fc25:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2fc29:	66 48 0f 6e ef       	movq   %rdi,%xmm5
   2fc2e:	31 c9                	xor    %ecx,%ecx
   2fc30:	f2 41 0f 2a c1       	cvtsi2sd %r9d,%xmm0
   2fc35:	66 0f 2e c5          	ucomisd %xmm5,%xmm0
   2fc39:	0f 9b c1             	setnp  %cl
   2fc3c:	41 0f 45 c8          	cmovne %r8d,%ecx
   2fc40:	e9 c8 73 ff ff       	jmp    2700d <JS_CallInternal+0x1bbd>
   2fc45:	4d 89 c1             	mov    %r8,%r9
   2fc48:	48 89 d0             	mov    %rdx,%rax
   2fc4b:	48 89 d7             	mov    %rdx,%rdi
   2fc4e:	45 31 c0             	xor    %r8d,%r8d
   2fc51:	4c 89 d2             	mov    %r10,%rdx
   2fc54:	4c 89 ce             	mov    %r9,%rsi
   2fc57:	4c 89 95 c0 fd ff ff 	mov    %r10,-0x240(%rbp)
   2fc5e:	48 89 8d c8 fd ff ff 	mov    %rcx,-0x238(%rbp)
   2fc65:	4c 89 8d e8 fd ff ff 	mov    %r9,-0x218(%rbp)
   2fc6c:	48 89 85 d0 fd ff ff 	mov    %rax,-0x230(%rbp)
   2fc73:	e8 f8 c4 fe ff       	call   1c170 <js_strict_eq2.isra.0>
   2fc78:	48 8b b5 d0 fd ff ff 	mov    -0x230(%rbp),%rsi
   2fc7f:	48 8b 95 e8 fd ff ff 	mov    -0x218(%rbp),%rdx
   2fc86:	4c 89 ef             	mov    %r13,%rdi
   2fc89:	89 85 f0 fd ff ff    	mov    %eax,-0x210(%rbp)
   2fc8f:	e8 8c ee fe ff       	call   1eb20 <JS_FreeValue>
   2fc94:	4c 8b 95 c0 fd ff ff 	mov    -0x240(%rbp),%r10
   2fc9b:	4c 8b 9d c8 fd ff ff 	mov    -0x238(%rbp),%r11
   2fca2:	e9 84 e2 ff ff       	jmp    2df2b <JS_CallInternal+0x8adb>
   2fca7:	45 31 c9             	xor    %r9d,%r9d
   2fcaa:	83 f9 ff             	cmp    $0xffffffff,%ecx
   2fcad:	75 0a                	jne    2fcb9 <JS_CallInternal+0xa869>
   2fcaf:	45 31 c9             	xor    %r9d,%r9d
   2fcb2:	4c 39 d2             	cmp    %r10,%rdx
   2fcb5:	41 0f 94 c1          	sete   %r9b
   2fcb9:	48 89 d0             	mov    %rdx,%rax
   2fcbc:	4c 89 ef             	mov    %r13,%rdi
   2fcbf:	4c 89 c2             	mov    %r8,%rdx
   2fcc2:	4c 89 95 e8 fd ff ff 	mov    %r10,-0x218(%rbp)
   2fcc9:	48 89 c6             	mov    %rax,%rsi
   2fccc:	48 89 8d d0 fd ff ff 	mov    %rcx,-0x230(%rbp)
   2fcd3:	44 89 8d f0 fd ff ff 	mov    %r9d,-0x210(%rbp)
   2fcda:	e8 41 ee fe ff       	call   1eb20 <JS_FreeValue>
   2fcdf:	4c 8b 95 e8 fd ff ff 	mov    -0x218(%rbp),%r10
   2fce6:	4c 8b 9d d0 fd ff ff 	mov    -0x230(%rbp),%r11
   2fced:	e9 39 e2 ff ff       	jmp    2df2b <JS_CallInternal+0x8adb>
   2fcf2:	85 c9                	test   %ecx,%ecx
   2fcf4:	75 4f                	jne    2fd45 <JS_CallInternal+0xa8f5>
   2fcf6:	66 48 0f 6e ea       	movq   %rdx,%xmm5
   2fcfb:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2fcff:	31 c0                	xor    %eax,%eax
   2fd01:	ba 01 00 00 00       	mov    $0x1,%edx
   2fd06:	f2 41 0f 2a c2       	cvtsi2sd %r10d,%xmm0
   2fd0b:	66 0f 2e c5          	ucomisd %xmm5,%xmm0
   2fd0f:	0f 9a c0             	setp   %al
   2fd12:	48 0f 45 c2          	cmovne %rdx,%rax
   2fd16:	e9 52 72 ff ff       	jmp    26f6d <JS_CallInternal+0x1b1d>
   2fd1b:	41 83 f8 08          	cmp    $0x8,%r8d
   2fd1f:	0f 85 ab d3 ff ff    	jne    2d0d0 <JS_CallInternal+0x7c80>
   2fd25:	66 48 0f 6e f7       	movq   %rdi,%xmm6
   2fd2a:	66 49 0f 6e f9       	movq   %r9,%xmm7
   2fd2f:	31 c9                	xor    %ecx,%ecx
   2fd31:	b8 00 00 00 00       	mov    $0x0,%eax
   2fd36:	66 0f 2e f7          	ucomisd %xmm7,%xmm6
   2fd3a:	0f 9b c1             	setnp  %cl
   2fd3d:	0f 45 c8             	cmovne %eax,%ecx
   2fd40:	e9 c8 72 ff ff       	jmp    2700d <JS_CallInternal+0x1bbd>
   2fd45:	83 f9 08             	cmp    $0x8,%ecx
   2fd48:	0f 85 3a 05 00 00    	jne    30288 <JS_CallInternal+0xae38>
   2fd4e:	66 48 0f 6e f2       	movq   %rdx,%xmm6
   2fd53:	66 49 0f 6e fa       	movq   %r10,%xmm7
   2fd58:	31 c0                	xor    %eax,%eax
   2fd5a:	ba 01 00 00 00       	mov    $0x1,%edx
   2fd5f:	66 0f 2e f7          	ucomisd %xmm7,%xmm6
   2fd63:	0f 9a c0             	setp   %al
   2fd66:	48 0f 45 c2          	cmovne %rdx,%rax
   2fd6a:	e9 fe 71 ff ff       	jmp    26f6d <JS_CallInternal+0x1b1d>
   2fd6f:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2fd73:	48 89 c2             	mov    %rax,%rdx
   2fd76:	48 89 ce             	mov    %rcx,%rsi
   2fd79:	e8 22 ec fe ff       	call   1e9a0 <__JS_FreeValueRT>
   2fd7e:	e9 48 d6 ff ff       	jmp    2d3cb <JS_CallInternal+0x7f7b>
   2fd83:	66 48 0f 6e c7       	movq   %rdi,%xmm0
   2fd88:	83 f8 08             	cmp    $0x8,%eax
   2fd8b:	0f 84 55 e6 ff ff    	je     2e3e6 <JS_CallInternal+0x8f96>
   2fd91:	85 c0                	test   %eax,%eax
   2fd93:	0f 85 a1 ae ff ff    	jne    2ac3a <JS_CallInternal+0x57ea>
   2fd99:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2fd9d:	f2 0f 2a c9          	cvtsi2sd %ecx,%xmm1
   2fda1:	e9 45 e6 ff ff       	jmp    2e3eb <JS_CallInternal+0x8f9b>
   2fda6:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2fdaa:	89 ca                	mov    %ecx,%edx
   2fdac:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2fdb0:	4c 89 85 f0 fd ff ff 	mov    %r8,-0x210(%rbp)
   2fdb7:	e8 b4 8f fe ff       	call   18d70 <JS_AtomGetStrRT.constprop.0>
   2fdbc:	4c 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8
   2fdc3:	48 89 c2             	mov    %rax,%rdx
   2fdc6:	e9 14 f0 ff ff       	jmp    2eddf <JS_CallInternal+0x998f>
   2fdcb:	48 89 f2             	mov    %rsi,%rdx
   2fdce:	48 89 fe             	mov    %rdi,%rsi
   2fdd1:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2fdd5:	4c 89 85 d0 fd ff ff 	mov    %r8,-0x230(%rbp)
   2fddc:	48 89 85 e8 fd ff ff 	mov    %rax,-0x218(%rbp)
   2fde3:	4c 89 85 f0 fd ff ff 	mov    %r8,-0x210(%rbp)
   2fdea:	e8 b1 eb fe ff       	call   1e9a0 <__JS_FreeValueRT>
   2fdef:	4c 8b 85 d0 fd ff ff 	mov    -0x230(%rbp),%r8
   2fdf6:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
   2fdfd:	48 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%rcx
   2fe04:	e9 2d d1 ff ff       	jmp    2cf36 <JS_CallInternal+0x7ae6>
   2fe09:	31 c0                	xor    %eax,%eax
   2fe0b:	48 c7 43 f8 03 00 00 	movq   $0x3,-0x8(%rbx)
   2fe12:	00 
   2fe13:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   2fe17:	e9 64 5e ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2fe1c:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2fe20:	4c 89 c6             	mov    %r8,%rsi
   2fe23:	48 89 da             	mov    %rbx,%rdx
   2fe26:	e8 75 eb fe ff       	call   1e9a0 <__JS_FreeValueRT>
   2fe2b:	48 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%rcx
   2fe32:	e9 32 e4 ff ff       	jmp    2e269 <JS_CallInternal+0x8e19>
   2fe37:	48 8d 35 68 97 0a 00 	lea    0xa9768(%rip),%rsi        # d95a6 <_IO_stdin_used+0x5a6>
   2fe3e:	4c 89 ef             	mov    %r13,%rdi
   2fe41:	31 c0                	xor    %eax,%eax
   2fe43:	e8 78 47 00 00       	call   345c0 <JS_ThrowTypeError>
   2fe48:	e9 33 5e ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2fe4d:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2fe51:	89 c2                	mov    %eax,%edx
   2fe53:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2fe57:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   2fe5e:	e8 0d 8f fe ff       	call   18d70 <JS_AtomGetStrRT.constprop.0>
   2fe63:	48 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%rcx
   2fe6a:	48 89 c2             	mov    %rax,%rdx
   2fe6d:	e9 a0 e9 ff ff       	jmp    2e812 <JS_CallInternal+0x93c2>
   2fe72:	48 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%rbx
   2fe79:	e9 02 5e ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2fe7e:	48 8d 35 66 96 0a 00 	lea    0xa9666(%rip),%rsi        # d94eb <_IO_stdin_used+0x4eb>
   2fe85:	4c 89 ef             	mov    %r13,%rdi
   2fe88:	e8 33 47 00 00       	call   345c0 <JS_ThrowTypeError>
   2fe8d:	e9 ee 5d ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2fe92:	48 8b 95 d0 fd ff ff 	mov    -0x230(%rbp),%rdx
   2fe99:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2fe9d:	48 89 de             	mov    %rbx,%rsi
   2fea0:	e8 fb ea fe ff       	call   1e9a0 <__JS_FreeValueRT>
   2fea5:	e9 7a 74 ff ff       	jmp    27324 <JS_CallInternal+0x1ed4>
   2feaa:	85 d2                	test   %edx,%edx
   2feac:	0f 85 30 df ff ff    	jne    2dde2 <JS_CallInternal+0x8992>
   2feb2:	66 0f ef c9          	pxor   %xmm1,%xmm1
   2feb6:	f2 0f 2a cf          	cvtsi2sd %edi,%xmm1
   2feba:	66 48 0f 6e c1       	movq   %rcx,%xmm0
   2febf:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
   2fec3:	48 c7 43 e8 08 00 00 	movq   $0x8,-0x18(%rbx)
   2feca:	00 
   2fecb:	48 83 eb 10          	sub    $0x10,%rbx
   2fecf:	f2 0f 11 43 f0       	movsd  %xmm0,-0x10(%rbx)
   2fed4:	e9 89 a9 ff ff       	jmp    2a862 <JS_CallInternal+0x5412>
   2fed9:	66 48 0f 6e cf       	movq   %rdi,%xmm1
   2fede:	83 f8 08             	cmp    $0x8,%eax
   2fee1:	74 d7                	je     2feba <JS_CallInternal+0xaa6a>
   2fee3:	85 c0                	test   %eax,%eax
   2fee5:	0f 85 f7 de ff ff    	jne    2dde2 <JS_CallInternal+0x8992>
   2feeb:	66 0f ef c0          	pxor   %xmm0,%xmm0
   2feef:	f2 0f 2a c1          	cvtsi2sd %ecx,%xmm0
   2fef3:	eb ca                	jmp    2febf <JS_CallInternal+0xaa6f>
   2fef5:	48 8b 85 68 fe ff ff 	mov    -0x198(%rbp),%rax
   2fefc:	31 d2                	xor    %edx,%edx
   2fefe:	f3 0f 6f 80 d8 04 00 	movdqu 0x4d8(%rax),%xmm0
   2ff05:	00 
   2ff06:	0f 11 43 f0          	movups %xmm0,-0x10(%rbx)
   2ff0a:	48 89 90 d8 04 00 00 	mov    %rdx,0x4d8(%rax)
   2ff11:	48 c7 80 e0 04 00 00 	movq   $0x4,0x4e0(%rax)
   2ff18:	04 00 00 00 
   2ff1c:	48 63 c1             	movslq %ecx,%rax
   2ff1f:	48 8b 8d 70 fe ff ff 	mov    -0x190(%rbp),%rcx
   2ff26:	48 03 41 18          	add    0x18(%rcx),%rax
   2ff2a:	e9 e2 57 ff ff       	jmp    25711 <JS_CallInternal+0x2c1>
   2ff2f:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ff33:	89 c2                	mov    %eax,%edx
   2ff35:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2ff39:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   2ff40:	e8 2b 8e fe ff       	call   18d70 <JS_AtomGetStrRT.constprop.0>
   2ff45:	48 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%rcx
   2ff4c:	48 89 c2             	mov    %rax,%rdx
   2ff4f:	e9 ff e4 ff ff       	jmp    2e453 <JS_CallInternal+0x9003>
   2ff54:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   2ff58:	89 c2                	mov    %eax,%edx
   2ff5a:	48 8d 75 80          	lea    -0x80(%rbp),%rsi
   2ff5e:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   2ff65:	e8 06 8e fe ff       	call   18d70 <JS_AtomGetStrRT.constprop.0>
   2ff6a:	48 8b 8d f0 fd ff ff 	mov    -0x210(%rbp),%rcx
   2ff71:	48 89 c2             	mov    %rax,%rdx
   2ff74:	e9 1c e5 ff ff       	jmp    2e495 <JS_CallInternal+0x9045>
   2ff79:	48 83 eb 10          	sub    $0x10,%rbx
   2ff7d:	e9 fe 5c ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   2ff82:	66 83 bd d0 fd ff ff 	cmpw   $0x1,-0x230(%rbp)
   2ff89:	01 
   2ff8a:	0f 85 1b b0 ff ff    	jne    2afab <JS_CallInternal+0x5b5b>
   2ff90:	41 f6 42 10 08       	testb  $0x8,0x10(%r10)
   2ff95:	0f 85 10 b0 ff ff    	jne    2afab <JS_CallInternal+0x5b5b>
   2ff9b:	66 83 7f 12 01       	cmpw   $0x1,0x12(%rdi)
   2ffa0:	0f 85 05 b0 ff ff    	jne    2afab <JS_CallInternal+0x5b5b>
   2ffa6:	f6 47 10 08          	testb  $0x8,0x10(%rdi)
   2ffaa:	0f 85 fb af ff ff    	jne    2afab <JS_CallInternal+0x5b5b>
   2ffb0:	41 80 7b 10 00       	cmpb   $0x0,0x10(%r11)
   2ffb5:	0f 84 f0 af ff ff    	je     2afab <JS_CallInternal+0x5b5b>
   2ffbb:	80 7a 10 00          	cmpb   $0x0,0x10(%rdx)
   2ffbf:	0f 84 e6 af ff ff    	je     2afab <JS_CallInternal+0x5b5b>
   2ffc5:	4d 8b 01             	mov    (%r9),%r8
   2ffc8:	49 8b 79 08          	mov    0x8(%r9),%rdi
   2ffcc:	66 48 0f 6e ea       	movq   %rdx,%xmm5
   2ffd1:	66 49 0f 6e c3       	movq   %r11,%xmm0
   2ffd6:	41 83 43 fc 01       	addl   $0x1,-0x4(%r11)
   2ffdb:	66 0f 6c c5          	punpcklqdq %xmm5,%xmm0
   2ffdf:	83 42 fc 01          	addl   $0x1,-0x4(%rdx)
   2ffe3:	48 89 f2             	mov    %rsi,%rdx
   2ffe6:	48 c1 fa 04          	sar    $0x4,%rdx
   2ffea:	41 0f 11 01          	movups %xmm0,(%r9)
   2ffee:	41 89 51 10          	mov    %edx,0x10(%r9)
   2fff2:	48 85 ff             	test   %rdi,%rdi
   2fff5:	0f 85 67 f5 ff ff    	jne    2f562 <JS_CallInternal+0xa112>
   2fffb:	e9 98 f5 ff ff       	jmp    2f598 <JS_CallInternal+0xa148>
   30000:	48 8b 95 e8 fd ff ff 	mov    -0x218(%rbp),%rdx
   30007:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   3000b:	48 89 ce             	mov    %rcx,%rsi
   3000e:	4c 89 85 d0 fd ff ff 	mov    %r8,-0x230(%rbp)
   30015:	e8 86 e9 fe ff       	call   1e9a0 <__JS_FreeValueRT>
   3001a:	4c 8b 85 d0 fd ff ff 	mov    -0x230(%rbp),%r8
   30021:	e9 2e e3 ff ff       	jmp    2e354 <JS_CallInternal+0x8f04>
   30026:	31 c0                	xor    %eax,%eax
   30028:	48 c7 43 08 03 00 00 	movq   $0x3,0x8(%rbx)
   3002f:	00 
   30030:	48 83 c3 10          	add    $0x10,%rbx
   30034:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   30038:	e9 a3 9f ff ff       	jmp    29fe0 <JS_CallInternal+0x4b90>
   3003d:	66 48 0f 6e ca       	movq   %rdx,%xmm1
   30042:	83 f9 08             	cmp    $0x8,%ecx
   30045:	74 36                	je     3007d <JS_CallInternal+0xac2d>
   30047:	85 c9                	test   %ecx,%ecx
   30049:	0f 85 92 e6 ff ff    	jne    2e6e1 <JS_CallInternal+0x9291>
   3004f:	66 0f ef c0          	pxor   %xmm0,%xmm0
   30053:	f2 0f 2a c0          	cvtsi2sd %eax,%xmm0
   30057:	31 c0                	xor    %eax,%eax
   30059:	66 0f 2f c8          	comisd %xmm0,%xmm1
   3005d:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   30064:	00 
   30065:	0f 97 c0             	seta   %al
   30068:	48 83 eb 10          	sub    $0x10,%rbx
   3006c:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   30070:	e9 4f 7a ff ff       	jmp    27ac4 <JS_CallInternal+0x2674>
   30075:	66 0f ef c9          	pxor   %xmm1,%xmm1
   30079:	f2 0f 2a ca          	cvtsi2sd %edx,%xmm1
   3007d:	66 48 0f 6e c0       	movq   %rax,%xmm0
   30082:	eb d3                	jmp    30057 <JS_CallInternal+0xac07>
   30084:	66 48 0f 6e c0       	movq   %rax,%xmm0
   30089:	83 f9 08             	cmp    $0x8,%ecx
   3008c:	74 36                	je     300c4 <JS_CallInternal+0xac74>
   3008e:	85 c9                	test   %ecx,%ecx
   30090:	0f 85 bf e9 ff ff    	jne    2ea55 <JS_CallInternal+0x9605>
   30096:	66 0f ef c9          	pxor   %xmm1,%xmm1
   3009a:	f2 0f 2a ca          	cvtsi2sd %edx,%xmm1
   3009e:	31 c0                	xor    %eax,%eax
   300a0:	66 0f 2f c8          	comisd %xmm0,%xmm1
   300a4:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   300ab:	00 
   300ac:	0f 93 c0             	setae  %al
   300af:	48 83 eb 10          	sub    $0x10,%rbx
   300b3:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   300b7:	e9 b7 77 ff ff       	jmp    27873 <JS_CallInternal+0x2423>
   300bc:	66 0f ef c0          	pxor   %xmm0,%xmm0
   300c0:	f2 0f 2a c0          	cvtsi2sd %eax,%xmm0
   300c4:	66 48 0f 6e ca       	movq   %rdx,%xmm1
   300c9:	eb d3                	jmp    3009e <JS_CallInternal+0xac4e>
   300cb:	66 48 0f 6e c0       	movq   %rax,%xmm0
   300d0:	83 f9 08             	cmp    $0x8,%ecx
   300d3:	74 36                	je     3010b <JS_CallInternal+0xacbb>
   300d5:	85 c9                	test   %ecx,%ecx
   300d7:	0f 85 0e e9 ff ff    	jne    2e9eb <JS_CallInternal+0x959b>
   300dd:	66 0f ef c9          	pxor   %xmm1,%xmm1
   300e1:	f2 0f 2a ca          	cvtsi2sd %edx,%xmm1
   300e5:	31 c0                	xor    %eax,%eax
   300e7:	66 0f 2f c8          	comisd %xmm0,%xmm1
   300eb:	48 c7 43 e8 01 00 00 	movq   $0x1,-0x18(%rbx)
   300f2:	00 
   300f3:	0f 97 c0             	seta   %al
   300f6:	48 83 eb 10          	sub    $0x10,%rbx
   300fa:	48 89 43 f0          	mov    %rax,-0x10(%rbx)
   300fe:	e9 b8 77 ff ff       	jmp    278bb <JS_CallInternal+0x246b>
   30103:	66 0f ef c0          	pxor   %xmm0,%xmm0
   30107:	f2 0f 2a c0          	cvtsi2sd %eax,%xmm0
   3010b:	66 48 0f 6e ca       	movq   %rdx,%xmm1
   30110:	eb d3                	jmp    300e5 <JS_CallInternal+0xac95>
   30112:	4c 8b a5 f0 fd ff ff 	mov    -0x210(%rbp),%r12
   30119:	e9 62 5b ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   3011e:	48 8b 97 48 04 00 00 	mov    0x448(%rdi),%rdx
   30125:	89 c8                	mov    %ecx,%eax
   30127:	48 8b 34 c2          	mov    (%rdx,%rax,8),%rsi
   3012b:	8b 46 fc             	mov    -0x4(%rsi),%eax
   3012e:	83 e8 01             	sub    $0x1,%eax
   30131:	89 46 fc             	mov    %eax,-0x4(%rsi)
   30134:	85 c0                	test   %eax,%eax
   30136:	0f 8f bf f0 ff ff    	jg     2f1fb <JS_CallInternal+0x9dab>
   3013c:	e8 5f 68 fe ff       	call   169a0 <JS_FreeAtomStruct>
   30141:	e9 b5 f0 ff ff       	jmp    2f1fb <JS_CallInternal+0x9dab>
   30146:	41 b9 06 00 00 00    	mov    $0x6,%r9d
   3014c:	45 31 c0             	xor    %r8d,%r8d
   3014f:	b8 06 00 00 00       	mov    $0x6,%eax
   30154:	e9 24 a8 ff ff       	jmp    2a97d <JS_CallInternal+0x552d>
   30159:	b8 03 00 00 00       	mov    $0x3,%eax
   3015e:	31 c9                	xor    %ecx,%ecx
   30160:	e9 62 5f ff ff       	jmp    260c7 <JS_CallInternal+0xc77>
   30165:	83 f9 08             	cmp    $0x8,%ecx
   30168:	0f 84 2d 01 00 00    	je     3029b <JS_CallInternal+0xae4b>
   3016e:	48 8b bd 80 fe ff ff 	mov    -0x180(%rbp),%rdi
   30175:	49 8b 31             	mov    (%r9),%rsi
   30178:	4c 89 57 30          	mov    %r10,0x30(%rdi)
   3017c:	e9 02 e7 ff ff       	jmp    2e883 <JS_CallInternal+0x9433>
   30181:	4c 8b a5 f0 fd ff ff 	mov    -0x210(%rbp),%r12
   30188:	e9 f3 5a ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   3018d:	0f b6 02             	movzbl (%rdx),%eax
   30190:	4c 8d 62 01          	lea    0x1(%rdx),%r12
   30194:	49 89 c2             	mov    %rax,%r10
   30197:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   3019b:	48 8b 85 80 fe ff ff 	mov    -0x180(%rbp),%rax
   301a2:	49 8b 31             	mov    (%r9),%rsi
   301a5:	48 89 95 f0 fd ff ff 	mov    %rdx,-0x210(%rbp)
   301ac:	4c 89 ef             	mov    %r13,%rdi
   301af:	48 89 8d f8 fd ff ff 	mov    %rcx,-0x208(%rbp)
   301b6:	48 8b 8d f8 fd ff ff 	mov    -0x208(%rbp),%rcx
   301bd:	48 83 eb 10          	sub    $0x10,%rbx
   301c1:	4c 89 50 30          	mov    %r10,0x30(%rax)
   301c5:	48 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%rax
   301cc:	4c 89 95 d0 fd ff ff 	mov    %r10,-0x230(%rbp)
   301d3:	48 89 c2             	mov    %rax,%rdx
   301d6:	4c 89 8d e8 fd ff ff 	mov    %r9,-0x218(%rbp)
   301dd:	e8 6e 62 fe ff       	call   16450 <JS_ConcatStringInPlace>
   301e2:	4c 8b 8d e8 fd ff ff 	mov    -0x218(%rbp),%r9
   301e9:	4c 8b 95 d0 fd ff ff 	mov    -0x230(%rbp),%r10
   301f0:	85 c0                	test   %eax,%eax
   301f2:	75 6a                	jne    3025e <JS_CallInternal+0xae0e>
   301f4:	49 8b 51 08          	mov    0x8(%r9),%rdx
   301f8:	49 8b 01             	mov    (%r9),%rax
   301fb:	83 fa f6             	cmp    $0xfffffff6,%edx
   301fe:	76 04                	jbe    30204 <JS_CallInternal+0xadb4>
   30200:	83 40 fc 01          	addl   $0x1,-0x4(%rax)
   30204:	48 8b b5 f0 fd ff ff 	mov    -0x210(%rbp),%rsi
   3020b:	48 8b bd f8 fd ff ff 	mov    -0x208(%rbp),%rdi
   30212:	4c 89 8d d0 fd ff ff 	mov    %r9,-0x230(%rbp)
   30219:	4c 89 95 e8 fd ff ff 	mov    %r10,-0x218(%rbp)
   30220:	48 89 f1             	mov    %rsi,%rcx
   30223:	49 89 f8             	mov    %rdi,%r8
   30226:	48 89 c6             	mov    %rax,%rsi
   30229:	4c 89 ef             	mov    %r13,%rdi
   3022c:	e8 df 44 01 00       	call   44710 <JS_ConcatString>
   30231:	48 89 c1             	mov    %rax,%rcx
   30234:	48 89 d0             	mov    %rdx,%rax
   30237:	83 fa 06             	cmp    $0x6,%edx
   3023a:	74 40                	je     3027c <JS_CallInternal+0xae2c>
   3023c:	4c 8b 8d d0 fd ff ff 	mov    -0x230(%rbp),%r9
   30243:	4c 89 ef             	mov    %r13,%rdi
   30246:	49 8b 31             	mov    (%r9),%rsi
   30249:	49 8b 51 08          	mov    0x8(%r9),%rdx
   3024d:	49 89 09             	mov    %rcx,(%r9)
   30250:	49 89 41 08          	mov    %rax,0x8(%r9)
   30254:	e8 c7 e8 fe ff       	call   1eb20 <JS_FreeValue>
   30259:	e9 a9 a5 ff ff       	jmp    2a807 <JS_CallInternal+0x53b7>
   3025e:	48 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%rax
   30265:	48 8b 95 f8 fd ff ff 	mov    -0x208(%rbp),%rdx
   3026c:	4c 89 ef             	mov    %r13,%rdi
   3026f:	48 89 c6             	mov    %rax,%rsi
   30272:	e8 a9 e8 fe ff       	call   1eb20 <JS_FreeValue>
   30277:	e9 8b a5 ff ff       	jmp    2a807 <JS_CallInternal+0x53b7>
   3027c:	4c 8b a5 e8 fd ff ff 	mov    -0x218(%rbp),%r12
   30283:	e9 f8 59 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   30288:	4c 89 d6             	mov    %r10,%rsi
   3028b:	48 89 ca             	mov    %rcx,%rdx
   3028e:	4c 89 ef             	mov    %r13,%rdi
   30291:	e8 8a e8 fe ff       	call   1eb20 <JS_FreeValue>
   30296:	e9 9b cf ff ff       	jmp    2d236 <JS_CallInternal+0x7de6>
   3029b:	66 48 0f 6e c2       	movq   %rdx,%xmm0
   302a0:	f2 41 0f 58 01       	addsd  (%r9),%xmm0
   302a5:	49 c7 41 08 08 00 00 	movq   $0x8,0x8(%r9)
   302ac:	00 
   302ad:	48 83 eb 10          	sub    $0x10,%rbx
   302b1:	f2 41 0f 11 01       	movsd  %xmm0,(%r9)
   302b6:	e9 4c a5 ff ff       	jmp    2a807 <JS_CallInternal+0x53b7>
   302bb:	b9 01 00 00 00       	mov    $0x1,%ecx
   302c0:	e9 48 6d ff ff       	jmp    2700d <JS_CallInternal+0x1bbd>
   302c5:	0f b6 4f 11          	movzbl 0x11(%rdi),%ecx
   302c9:	48 89 fe             	mov    %rdi,%rsi
   302cc:	4c 89 ef             	mov    %r13,%rdi
   302cf:	83 e1 01             	and    $0x1,%ecx
   302d2:	89 8d f0 fd ff ff    	mov    %ecx,-0x210(%rbp)
   302d8:	e8 43 e8 fe ff       	call   1eb20 <JS_FreeValue>
   302dd:	8b 8d f0 fd ff ff    	mov    -0x210(%rbp),%ecx
   302e3:	e9 25 6d ff ff       	jmp    2700d <JS_CallInternal+0x1bbd>
   302e8:	4c 8b a5 e8 fd ff ff 	mov    -0x218(%rbp),%r12
   302ef:	e9 8c 59 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   302f4:	0f b6 02             	movzbl (%rdx),%eax
   302f7:	4c 8d 62 01          	lea    0x1(%rdx),%r12
   302fb:	49 89 c2             	mov    %rax,%r10
   302fe:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   30302:	4c 89 d6             	mov    %r10,%rsi
   30305:	48 89 ca             	mov    %rcx,%rdx
   30308:	4c 89 ef             	mov    %r13,%rdi
   3030b:	4c 89 85 e8 fd ff ff 	mov    %r8,-0x218(%rbp)
   30312:	48 89 8d f0 fd ff ff 	mov    %rcx,-0x210(%rbp)
   30319:	e8 02 e8 fe ff       	call   1eb20 <JS_FreeValue>
   3031e:	31 c0                	xor    %eax,%eax
   30320:	4c 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%r8
   30327:	44 3b 85 f0 fd ff ff 	cmp    -0x210(%rbp),%r8d
   3032e:	0f 95 c0             	setne  %al
   30331:	e9 37 6c ff ff       	jmp    26f6d <JS_CallInternal+0x1b1d>
   30336:	4c 8b a5 e8 fd ff ff 	mov    -0x218(%rbp),%r12
   3033d:	e9 3e 59 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   30342:	e8 19 62 00 00       	call   36560 <JS_ThrowReferenceErrorUninitialized>
   30347:	4c 8b a5 f0 fd ff ff 	mov    -0x210(%rbp),%r12
   3034e:	e9 2d 59 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   30353:	48 8b 9d e8 fd ff ff 	mov    -0x218(%rbp),%rbx
   3035a:	e9 21 59 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   3035f:	0f b6 02             	movzbl (%rdx),%eax
   30362:	4c 8d 62 01          	lea    0x1(%rdx),%r12
   30366:	49 89 c2             	mov    %rax,%r10
   30369:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   3036d:	0f b6 01             	movzbl (%rcx),%eax
   30370:	4c 8d 61 01          	lea    0x1(%rcx),%r12
   30374:	49 89 c2             	mov    %rax,%r10
   30377:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   3037b:	4d 89 cc             	mov    %r9,%r12
   3037e:	e9 fd 58 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   30383:	4c 89 d6             	mov    %r10,%rsi
   30386:	4c 89 c2             	mov    %r8,%rdx
   30389:	4c 89 ef             	mov    %r13,%rdi
   3038c:	e8 8f e7 fe ff       	call   1eb20 <JS_FreeValue>
   30391:	31 c0                	xor    %eax,%eax
   30393:	e9 25 6c ff ff       	jmp    26fbd <JS_CallInternal+0x1b6d>
   30398:	0f b6 01             	movzbl (%rcx),%eax
   3039b:	4c 8d 61 01          	lea    0x1(%rcx),%r12
   3039f:	49 89 c2             	mov    %rax,%r10
   303a2:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   303a6:	0f b6 01             	movzbl (%rcx),%eax
   303a9:	4c 8d 61 01          	lea    0x1(%rcx),%r12
   303ad:	49 89 c2             	mov    %rax,%r10
   303b0:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   303b4:	89 f9                	mov    %edi,%ecx
   303b6:	83 ea 01             	sub    $0x1,%edx
   303b9:	31 ff                	xor    %edi,%edi
   303bb:	41 89 95 a8 01 00 00 	mov    %edx,0x1a8(%r13)
   303c2:	48 89 08             	mov    %rcx,(%rax)
   303c5:	48 89 78 08          	mov    %rdi,0x8(%rax)
   303c9:	44 89 c0             	mov    %r8d,%eax
   303cc:	45 31 c0             	xor    %r8d,%r8d
   303cf:	48 89 06             	mov    %rax,(%rsi)
   303d2:	48 8b 85 38 fd ff ff 	mov    -0x2c8(%rbp),%rax
   303d9:	4c 89 46 08          	mov    %r8,0x8(%rsi)
   303dd:	4c 8d 60 01          	lea    0x1(%rax),%r12
   303e1:	0f b6 00             	movzbl (%rax),%eax
   303e4:	49 89 c2             	mov    %rax,%r10
   303e7:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   303eb:	48 8d 35 03 92 0a 00 	lea    0xa9203(%rip),%rsi        # d95f5 <_IO_stdin_used+0x5f5>
   303f2:	4c 89 ef             	mov    %r13,%rdi
   303f5:	31 c0                	xor    %eax,%eax
   303f7:	e8 c4 41 00 00       	call   345c0 <JS_ThrowTypeError>
   303fc:	e9 7f 58 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   30401:	0f b6 01             	movzbl (%rcx),%eax
   30404:	4c 8d 61 01          	lea    0x1(%rcx),%r12
   30408:	49 89 c2             	mov    %rax,%r10
   3040b:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   3040f:	83 ea 02             	sub    $0x2,%edx
   30412:	89 f9                	mov    %edi,%ecx
   30414:	45 31 db             	xor    %r11d,%r11d
   30417:	45 31 e4             	xor    %r12d,%r12d
   3041a:	41 89 95 a8 01 00 00 	mov    %edx,0x1a8(%r13)
   30421:	48 89 08             	mov    %rcx,(%rax)
   30424:	4c 89 58 08          	mov    %r11,0x8(%rax)
   30428:	48 8b 85 30 fd ff ff 	mov    -0x2d0(%rbp),%rax
   3042f:	4c 89 66 08          	mov    %r12,0x8(%rsi)
   30433:	48 c7 06 ff ff ff 7f 	movq   $0x7fffffff,(%rsi)
   3043a:	4c 8d 60 01          	lea    0x1(%rax),%r12
   3043e:	0f b6 00             	movzbl (%rax),%eax
   30441:	49 89 c2             	mov    %rax,%r10
   30444:	41 ff 24 c6          	jmp    *(%r14,%rax,8)
   30448:	4d 8b 65 10          	mov    0x10(%r13),%r12
   3044c:	41 80 bc 24 e9 04 00 	cmpb   $0x0,0x4e9(%r12)
   30453:	00 00 
   30455:	74 34                	je     3048b <JS_CallInternal+0xb03b>
   30457:	48 89 ce             	mov    %rcx,%rsi
   3045a:	4c 89 c2             	mov    %r8,%rdx
   3045d:	4c 89 ef             	mov    %r13,%rdi
   30460:	e8 bb e6 fe ff       	call   1eb20 <JS_FreeValue>
   30465:	31 c0                	xor    %eax,%eax
   30467:	48 c7 43 08 06 00 00 	movq   $0x6,0x8(%rbx)
   3046e:	00 
   3046f:	48 89 03             	mov    %rax,(%rbx)
   30472:	e9 d6 9c ff ff       	jmp    2a14d <JS_CallInternal+0x4cfd>
   30477:	4d 89 dc             	mov    %r11,%r12
   3047a:	e9 01 58 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   3047f:	4c 8b a5 f0 fd ff ff 	mov    -0x210(%rbp),%r12
   30486:	e9 f5 57 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   3048b:	41 c6 84 24 e9 04 00 	movb   $0x1,0x4e9(%r12)
   30492:	00 01 
   30494:	48 8d 35 42 90 0a 00 	lea    0xa9042(%rip),%rsi        # d94dd <_IO_stdin_used+0x4dd>
   3049b:	4c 89 ef             	mov    %r13,%rdi
   3049e:	31 c0                	xor    %eax,%eax
   304a0:	4c 89 85 c0 fd ff ff 	mov    %r8,-0x240(%rbp)
   304a7:	48 89 8d d0 fd ff ff 	mov    %rcx,-0x230(%rbp)
   304ae:	e8 ed 62 00 00       	call   367a0 <JS_ThrowInternalError>
   304b3:	4c 8b 85 c0 fd ff ff 	mov    -0x240(%rbp),%r8
   304ba:	41 c6 84 24 e9 04 00 	movb   $0x0,0x4e9(%r12)
   304c1:	00 00 
   304c3:	48 8b 8d d0 fd ff ff 	mov    -0x230(%rbp),%rcx
   304ca:	eb 8b                	jmp    30457 <JS_CallInternal+0xb007>
   304cc:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   304d2:	e9 8c 6b ff ff       	jmp    27063 <JS_CallInternal+0x1c13>
   304d7:	44 0f b6 47 11       	movzbl 0x11(%rdi),%r8d
   304dc:	48 89 fe             	mov    %rdi,%rsi
   304df:	4c 89 ef             	mov    %r13,%rdi
   304e2:	41 83 e0 01          	and    $0x1,%r8d
   304e6:	44 89 85 f0 fd ff ff 	mov    %r8d,-0x210(%rbp)
   304ed:	e8 2e e6 fe ff       	call   1eb20 <JS_FreeValue>
   304f2:	44 8b 85 f0 fd ff ff 	mov    -0x210(%rbp),%r8d
   304f9:	e9 65 6b ff ff       	jmp    27063 <JS_CallInternal+0x1c13>
   304fe:	4c 8b a5 e8 fd ff ff 	mov    -0x218(%rbp),%r12
   30505:	e9 76 57 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   3050a:	e8 c1 17 fe ff       	call   11cd0 <__stack_chk_fail@plt>
   3050f:	44 39 c2             	cmp    %r8d,%edx
   30512:	4c 89 d6             	mov    %r10,%rsi
   30515:	4c 89 c2             	mov    %r8,%rdx
   30518:	4c 89 ef             	mov    %r13,%rdi
   3051b:	0f 94 85 f0 fd ff ff 	sete   -0x210(%rbp)
   30522:	e8 f9 e5 fe ff       	call   1eb20 <JS_FreeValue>
   30527:	0f b6 85 f0 fd ff ff 	movzbl -0x210(%rbp),%eax
   3052e:	e9 8a 6a ff ff       	jmp    26fbd <JS_CallInternal+0x1b6d>
   30533:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   30539:	0f 8e 41 57 ff ff    	jle    25c80 <JS_CallInternal+0x830>
   3053f:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   30543:	89 ce                	mov    %ecx,%esi
   30545:	e8 66 aa fe ff       	call   1afb0 <JS_FreeAtom.part.0.isra.0>
   3054a:	e9 31 57 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   3054f:	81 f9 f2 00 00 00    	cmp    $0xf2,%ecx
   30555:	0f 8e 25 57 ff ff    	jle    25c80 <JS_CallInternal+0x830>
   3055b:	49 8b 7d 10          	mov    0x10(%r13),%rdi
   3055f:	89 ce                	mov    %ecx,%esi
   30561:	e8 4a aa fe ff       	call   1afb0 <JS_FreeAtom.part.0.isra.0>
   30566:	e9 15 57 ff ff       	jmp    25c80 <JS_CallInternal+0x830>
   3056b:	89 ce                	mov    %ecx,%esi
   3056d:	4c 89 ef             	mov    %r13,%rdi
   30570:	4c 89 9d f0 fd ff ff 	mov    %r11,-0x210(%rbp)
   30577:	e8 e4 5f 00 00       	call   36560 <JS_ThrowReferenceErrorUninitialized>
   3057c:	4c 8b 9d f0 fd ff ff 	mov    -0x210(%rbp),%r11
   30583:	e9 d0 cd ff ff       	jmp    2d358 <JS_CallInternal+0x7f08>

Disassembly of section .fini:
