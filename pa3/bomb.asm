
bomb:     file format elf32-i386


Disassembly of section .init:

08048790 <_init>:
 8048790:	53                   	push   %ebx
 8048791:	83 ec 08             	sub    $0x8,%esp
 8048794:	e8 57 02 00 00       	call   80489f0 <__x86.get_pc_thunk.bx>
 8048799:	81 c3 67 48 00 00    	add    $0x4867,%ebx
 804879f:	8b 83 fc ff ff ff    	mov    -0x4(%ebx),%eax
 80487a5:	85 c0                	test   %eax,%eax
 80487a7:	74 05                	je     80487ae <_init+0x1e>
 80487a9:	e8 02 01 00 00       	call   80488b0 <__gmon_start__@plt>
 80487ae:	83 c4 08             	add    $0x8,%esp
 80487b1:	5b                   	pop    %ebx
 80487b2:	c3                   	ret    

Disassembly of section .plt:

080487c0 <read@plt-0x10>:
 80487c0:	ff 35 04 d0 04 08    	pushl  0x804d004
 80487c6:	ff 25 08 d0 04 08    	jmp    *0x804d008
 80487cc:	00 00                	add    %al,(%eax)
	...

080487d0 <read@plt>:
 80487d0:	ff 25 0c d0 04 08    	jmp    *0x804d00c
 80487d6:	68 00 00 00 00       	push   $0x0
 80487db:	e9 e0 ff ff ff       	jmp    80487c0 <_init+0x30>

080487e0 <fflush@plt>:
 80487e0:	ff 25 10 d0 04 08    	jmp    *0x804d010
 80487e6:	68 08 00 00 00       	push   $0x8
 80487eb:	e9 d0 ff ff ff       	jmp    80487c0 <_init+0x30>

080487f0 <fgets@plt>:
 80487f0:	ff 25 14 d0 04 08    	jmp    *0x804d014
 80487f6:	68 10 00 00 00       	push   $0x10
 80487fb:	e9 c0 ff ff ff       	jmp    80487c0 <_init+0x30>

08048800 <signal@plt>:
 8048800:	ff 25 18 d0 04 08    	jmp    *0x804d018
 8048806:	68 18 00 00 00       	push   $0x18
 804880b:	e9 b0 ff ff ff       	jmp    80487c0 <_init+0x30>

08048810 <sleep@plt>:
 8048810:	ff 25 1c d0 04 08    	jmp    *0x804d01c
 8048816:	68 20 00 00 00       	push   $0x20
 804881b:	e9 a0 ff ff ff       	jmp    80487c0 <_init+0x30>

08048820 <alarm@plt>:
 8048820:	ff 25 20 d0 04 08    	jmp    *0x804d020
 8048826:	68 28 00 00 00       	push   $0x28
 804882b:	e9 90 ff ff ff       	jmp    80487c0 <_init+0x30>

08048830 <__stack_chk_fail@plt>:
 8048830:	ff 25 24 d0 04 08    	jmp    *0x804d024
 8048836:	68 30 00 00 00       	push   $0x30
 804883b:	e9 80 ff ff ff       	jmp    80487c0 <_init+0x30>

08048840 <strcpy@plt>:
 8048840:	ff 25 28 d0 04 08    	jmp    *0x804d028
 8048846:	68 38 00 00 00       	push   $0x38
 804884b:	e9 70 ff ff ff       	jmp    80487c0 <_init+0x30>

08048850 <gethostname@plt>:
 8048850:	ff 25 2c d0 04 08    	jmp    *0x804d02c
 8048856:	68 40 00 00 00       	push   $0x40
 804885b:	e9 60 ff ff ff       	jmp    80487c0 <_init+0x30>

08048860 <getenv@plt>:
 8048860:	ff 25 30 d0 04 08    	jmp    *0x804d030
 8048866:	68 48 00 00 00       	push   $0x48
 804886b:	e9 50 ff ff ff       	jmp    80487c0 <_init+0x30>

08048870 <malloc@plt>:
 8048870:	ff 25 34 d0 04 08    	jmp    *0x804d034
 8048876:	68 50 00 00 00       	push   $0x50
 804887b:	e9 40 ff ff ff       	jmp    80487c0 <_init+0x30>

08048880 <puts@plt>:
 8048880:	ff 25 38 d0 04 08    	jmp    *0x804d038
 8048886:	68 58 00 00 00       	push   $0x58
 804888b:	e9 30 ff ff ff       	jmp    80487c0 <_init+0x30>

08048890 <__memmove_chk@plt>:
 8048890:	ff 25 3c d0 04 08    	jmp    *0x804d03c
 8048896:	68 60 00 00 00       	push   $0x60
 804889b:	e9 20 ff ff ff       	jmp    80487c0 <_init+0x30>

080488a0 <__memcpy_chk@plt>:
 80488a0:	ff 25 40 d0 04 08    	jmp    *0x804d040
 80488a6:	68 68 00 00 00       	push   $0x68
 80488ab:	e9 10 ff ff ff       	jmp    80487c0 <_init+0x30>

080488b0 <__gmon_start__@plt>:
 80488b0:	ff 25 44 d0 04 08    	jmp    *0x804d044
 80488b6:	68 70 00 00 00       	push   $0x70
 80488bb:	e9 00 ff ff ff       	jmp    80487c0 <_init+0x30>

080488c0 <exit@plt>:
 80488c0:	ff 25 48 d0 04 08    	jmp    *0x804d048
 80488c6:	68 78 00 00 00       	push   $0x78
 80488cb:	e9 f0 fe ff ff       	jmp    80487c0 <_init+0x30>

080488d0 <__libc_start_main@plt>:
 80488d0:	ff 25 4c d0 04 08    	jmp    *0x804d04c
 80488d6:	68 80 00 00 00       	push   $0x80
 80488db:	e9 e0 fe ff ff       	jmp    80487c0 <_init+0x30>

080488e0 <write@plt>:
 80488e0:	ff 25 50 d0 04 08    	jmp    *0x804d050
 80488e6:	68 88 00 00 00       	push   $0x88
 80488eb:	e9 d0 fe ff ff       	jmp    80487c0 <_init+0x30>

080488f0 <strcasecmp@plt>:
 80488f0:	ff 25 54 d0 04 08    	jmp    *0x804d054
 80488f6:	68 90 00 00 00       	push   $0x90
 80488fb:	e9 c0 fe ff ff       	jmp    80487c0 <_init+0x30>

08048900 <__isoc99_sscanf@plt>:
 8048900:	ff 25 58 d0 04 08    	jmp    *0x804d058
 8048906:	68 98 00 00 00       	push   $0x98
 804890b:	e9 b0 fe ff ff       	jmp    80487c0 <_init+0x30>

08048910 <fopen@plt>:
 8048910:	ff 25 5c d0 04 08    	jmp    *0x804d05c
 8048916:	68 a0 00 00 00       	push   $0xa0
 804891b:	e9 a0 fe ff ff       	jmp    80487c0 <_init+0x30>

08048920 <__errno_location@plt>:
 8048920:	ff 25 60 d0 04 08    	jmp    *0x804d060
 8048926:	68 a8 00 00 00       	push   $0xa8
 804892b:	e9 90 fe ff ff       	jmp    80487c0 <_init+0x30>

08048930 <__printf_chk@plt>:
 8048930:	ff 25 64 d0 04 08    	jmp    *0x804d064
 8048936:	68 b0 00 00 00       	push   $0xb0
 804893b:	e9 80 fe ff ff       	jmp    80487c0 <_init+0x30>

08048940 <socket@plt>:
 8048940:	ff 25 68 d0 04 08    	jmp    *0x804d068
 8048946:	68 b8 00 00 00       	push   $0xb8
 804894b:	e9 70 fe ff ff       	jmp    80487c0 <_init+0x30>

08048950 <__fprintf_chk@plt>:
 8048950:	ff 25 6c d0 04 08    	jmp    *0x804d06c
 8048956:	68 c0 00 00 00       	push   $0xc0
 804895b:	e9 60 fe ff ff       	jmp    80487c0 <_init+0x30>

08048960 <gethostbyname@plt>:
 8048960:	ff 25 70 d0 04 08    	jmp    *0x804d070
 8048966:	68 c8 00 00 00       	push   $0xc8
 804896b:	e9 50 fe ff ff       	jmp    80487c0 <_init+0x30>

08048970 <strtol@plt>:
 8048970:	ff 25 74 d0 04 08    	jmp    *0x804d074
 8048976:	68 d0 00 00 00       	push   $0xd0
 804897b:	e9 40 fe ff ff       	jmp    80487c0 <_init+0x30>

08048980 <connect@plt>:
 8048980:	ff 25 78 d0 04 08    	jmp    *0x804d078
 8048986:	68 d8 00 00 00       	push   $0xd8
 804898b:	e9 30 fe ff ff       	jmp    80487c0 <_init+0x30>

08048990 <close@plt>:
 8048990:	ff 25 7c d0 04 08    	jmp    *0x804d07c
 8048996:	68 e0 00 00 00       	push   $0xe0
 804899b:	e9 20 fe ff ff       	jmp    80487c0 <_init+0x30>

080489a0 <__ctype_b_loc@plt>:
 80489a0:	ff 25 80 d0 04 08    	jmp    *0x804d080
 80489a6:	68 e8 00 00 00       	push   $0xe8
 80489ab:	e9 10 fe ff ff       	jmp    80487c0 <_init+0x30>

080489b0 <__sprintf_chk@plt>:
 80489b0:	ff 25 84 d0 04 08    	jmp    *0x804d084
 80489b6:	68 f0 00 00 00       	push   $0xf0
 80489bb:	e9 00 fe ff ff       	jmp    80487c0 <_init+0x30>

Disassembly of section .text:

080489c0 <_start>:
 80489c0:	31 ed                	xor    %ebp,%ebp
 80489c2:	5e                   	pop    %esi
 80489c3:	89 e1                	mov    %esp,%ecx
 80489c5:	83 e4 f0             	and    $0xfffffff0,%esp
 80489c8:	50                   	push   %eax
 80489c9:	54                   	push   %esp
 80489ca:	52                   	push   %edx
 80489cb:	68 20 a3 04 08       	push   $0x804a320
 80489d0:	68 b0 a2 04 08       	push   $0x804a2b0
 80489d5:	51                   	push   %ecx
 80489d6:	56                   	push   %esi
 80489d7:	68 bd 8a 04 08       	push   $0x8048abd
 80489dc:	e8 ef fe ff ff       	call   80488d0 <__libc_start_main@plt>
 80489e1:	f4                   	hlt    
 80489e2:	66 90                	xchg   %ax,%ax
 80489e4:	66 90                	xchg   %ax,%ax
 80489e6:	66 90                	xchg   %ax,%ax
 80489e8:	66 90                	xchg   %ax,%ax
 80489ea:	66 90                	xchg   %ax,%ax
 80489ec:	66 90                	xchg   %ax,%ax
 80489ee:	66 90                	xchg   %ax,%ax

080489f0 <__x86.get_pc_thunk.bx>:
 80489f0:	8b 1c 24             	mov    (%esp),%ebx
 80489f3:	c3                   	ret    
 80489f4:	66 90                	xchg   %ax,%ax
 80489f6:	66 90                	xchg   %ax,%ax
 80489f8:	66 90                	xchg   %ax,%ax
 80489fa:	66 90                	xchg   %ax,%ax
 80489fc:	66 90                	xchg   %ax,%ax
 80489fe:	66 90                	xchg   %ax,%ax

08048a00 <deregister_tm_clones>:
 8048a00:	b8 e3 d7 04 08       	mov    $0x804d7e3,%eax
 8048a05:	2d e0 d7 04 08       	sub    $0x804d7e0,%eax
 8048a0a:	83 f8 06             	cmp    $0x6,%eax
 8048a0d:	77 01                	ja     8048a10 <deregister_tm_clones+0x10>
 8048a0f:	c3                   	ret    
 8048a10:	b8 00 00 00 00       	mov    $0x0,%eax
 8048a15:	85 c0                	test   %eax,%eax
 8048a17:	74 f6                	je     8048a0f <deregister_tm_clones+0xf>
 8048a19:	55                   	push   %ebp
 8048a1a:	89 e5                	mov    %esp,%ebp
 8048a1c:	83 ec 18             	sub    $0x18,%esp
 8048a1f:	c7 04 24 e0 d7 04 08 	movl   $0x804d7e0,(%esp)
 8048a26:	ff d0                	call   *%eax
 8048a28:	c9                   	leave  
 8048a29:	c3                   	ret    
 8048a2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

08048a30 <register_tm_clones>:
 8048a30:	b8 e0 d7 04 08       	mov    $0x804d7e0,%eax
 8048a35:	2d e0 d7 04 08       	sub    $0x804d7e0,%eax
 8048a3a:	c1 f8 02             	sar    $0x2,%eax
 8048a3d:	89 c2                	mov    %eax,%edx
 8048a3f:	c1 ea 1f             	shr    $0x1f,%edx
 8048a42:	01 d0                	add    %edx,%eax
 8048a44:	d1 f8                	sar    %eax
 8048a46:	75 01                	jne    8048a49 <register_tm_clones+0x19>
 8048a48:	c3                   	ret    
 8048a49:	ba 00 00 00 00       	mov    $0x0,%edx
 8048a4e:	85 d2                	test   %edx,%edx
 8048a50:	74 f6                	je     8048a48 <register_tm_clones+0x18>
 8048a52:	55                   	push   %ebp
 8048a53:	89 e5                	mov    %esp,%ebp
 8048a55:	83 ec 18             	sub    $0x18,%esp
 8048a58:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048a5c:	c7 04 24 e0 d7 04 08 	movl   $0x804d7e0,(%esp)
 8048a63:	ff d2                	call   *%edx
 8048a65:	c9                   	leave  
 8048a66:	c3                   	ret    
 8048a67:	89 f6                	mov    %esi,%esi
 8048a69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048a70 <__do_global_dtors_aux>:
 8048a70:	80 3d 04 d8 04 08 00 	cmpb   $0x0,0x804d804
 8048a77:	75 13                	jne    8048a8c <__do_global_dtors_aux+0x1c>
 8048a79:	55                   	push   %ebp
 8048a7a:	89 e5                	mov    %esp,%ebp
 8048a7c:	83 ec 08             	sub    $0x8,%esp
 8048a7f:	e8 7c ff ff ff       	call   8048a00 <deregister_tm_clones>
 8048a84:	c6 05 04 d8 04 08 01 	movb   $0x1,0x804d804
 8048a8b:	c9                   	leave  
 8048a8c:	f3 c3                	repz ret 
 8048a8e:	66 90                	xchg   %ax,%ax

08048a90 <frame_dummy>:
 8048a90:	a1 10 cf 04 08       	mov    0x804cf10,%eax
 8048a95:	85 c0                	test   %eax,%eax
 8048a97:	74 1f                	je     8048ab8 <frame_dummy+0x28>
 8048a99:	b8 00 00 00 00       	mov    $0x0,%eax
 8048a9e:	85 c0                	test   %eax,%eax
 8048aa0:	74 16                	je     8048ab8 <frame_dummy+0x28>
 8048aa2:	55                   	push   %ebp
 8048aa3:	89 e5                	mov    %esp,%ebp
 8048aa5:	83 ec 18             	sub    $0x18,%esp
 8048aa8:	c7 04 24 10 cf 04 08 	movl   $0x804cf10,(%esp)
 8048aaf:	ff d0                	call   *%eax
 8048ab1:	c9                   	leave  
 8048ab2:	e9 79 ff ff ff       	jmp    8048a30 <register_tm_clones>
 8048ab7:	90                   	nop
 8048ab8:	e9 73 ff ff ff       	jmp    8048a30 <register_tm_clones>

08048abd <main>:
 8048abd:	55                   	push   %ebp
 8048abe:	89 e5                	mov    %esp,%ebp
 8048ac0:	53                   	push   %ebx
 8048ac1:	83 e4 f0             	and    $0xfffffff0,%esp
 8048ac4:	83 ec 10             	sub    $0x10,%esp
 8048ac7:	8b 45 08             	mov    0x8(%ebp),%eax
 8048aca:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8048acd:	83 f8 01             	cmp    $0x1,%eax
 8048ad0:	75 0c                	jne    8048ade <main+0x21>
 8048ad2:	a1 e4 d7 04 08       	mov    0x804d7e4,%eax
 8048ad7:	a3 0c d8 04 08       	mov    %eax,0x804d80c
 8048adc:	eb 74                	jmp    8048b52 <main+0x95>
 8048ade:	83 f8 02             	cmp    $0x2,%eax
 8048ae1:	75 49                	jne    8048b2c <main+0x6f>
 8048ae3:	c7 44 24 04 48 a3 04 	movl   $0x804a348,0x4(%esp)
 8048aea:	08 
 8048aeb:	8b 43 04             	mov    0x4(%ebx),%eax
 8048aee:	89 04 24             	mov    %eax,(%esp)
 8048af1:	e8 1a fe ff ff       	call   8048910 <fopen@plt>
 8048af6:	a3 0c d8 04 08       	mov    %eax,0x804d80c
 8048afb:	85 c0                	test   %eax,%eax
 8048afd:	75 53                	jne    8048b52 <main+0x95>
 8048aff:	8b 43 04             	mov    0x4(%ebx),%eax
 8048b02:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048b06:	8b 03                	mov    (%ebx),%eax
 8048b08:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048b0c:	c7 44 24 04 4a a3 04 	movl   $0x804a34a,0x4(%esp)
 8048b13:	08 
 8048b14:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048b1b:	e8 10 fe ff ff       	call   8048930 <__printf_chk@plt>
 8048b20:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 8048b27:	e8 94 fd ff ff       	call   80488c0 <exit@plt>
 8048b2c:	8b 03                	mov    (%ebx),%eax
 8048b2e:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048b32:	c7 44 24 04 67 a3 04 	movl   $0x804a367,0x4(%esp)
 8048b39:	08 
 8048b3a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048b41:	e8 ea fd ff ff       	call   8048930 <__printf_chk@plt>
 8048b46:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 8048b4d:	e8 6e fd ff ff       	call   80488c0 <exit@plt>
 8048b52:	e8 cf 06 00 00       	call   8049226 <initialize_bomb>
 8048b57:	c7 04 24 d8 a3 04 08 	movl   $0x804a3d8,(%esp)
 8048b5e:	e8 1d fd ff ff       	call   8048880 <puts@plt>
 8048b63:	c7 04 24 14 a4 04 08 	movl   $0x804a414,(%esp)
 8048b6a:	e8 11 fd ff ff       	call   8048880 <puts@plt>
 8048b6f:	e8 d0 09 00 00       	call   8049544 <read_line>
 8048b74:	89 04 24             	mov    %eax,(%esp)
 8048b77:	e8 04 01 00 00       	call   8048c80 <phase_1>
 8048b7c:	e8 bd 0a 00 00       	call   804963e <phase_defused>
 8048b81:	c7 04 24 40 a4 04 08 	movl   $0x804a440,(%esp)
 8048b88:	e8 f3 fc ff ff       	call   8048880 <puts@plt>
 8048b8d:	e8 b2 09 00 00       	call   8049544 <read_line>
 8048b92:	89 04 24             	mov    %eax,(%esp)
 8048b95:	e8 2a 01 00 00       	call   8048cc4 <phase_2>
 8048b9a:	e8 9f 0a 00 00       	call   804963e <phase_defused>
 8048b9f:	c7 04 24 81 a3 04 08 	movl   $0x804a381,(%esp)
 8048ba6:	e8 d5 fc ff ff       	call   8048880 <puts@plt>
 8048bab:	e8 94 09 00 00       	call   8049544 <read_line>
 8048bb0:	89 04 24             	mov    %eax,(%esp)
 8048bb3:	e8 30 01 00 00       	call   8048ce8 <phase_3>
 8048bb8:	e8 81 0a 00 00       	call   804963e <phase_defused>
 8048bbd:	c7 04 24 9f a3 04 08 	movl   $0x804a39f,(%esp)
 8048bc4:	e8 b7 fc ff ff       	call   8048880 <puts@plt>
 8048bc9:	e8 76 09 00 00       	call   8049544 <read_line>
 8048bce:	89 04 24             	mov    %eax,(%esp)
 8048bd1:	e8 84 01 00 00       	call   8048d5a <phase_4>
 8048bd6:	e8 63 0a 00 00       	call   804963e <phase_defused>
 8048bdb:	c7 04 24 6c a4 04 08 	movl   $0x804a46c,(%esp)
 8048be2:	e8 99 fc ff ff       	call   8048880 <puts@plt>
 8048be7:	e8 58 09 00 00       	call   8049544 <read_line>
 8048bec:	89 04 24             	mov    %eax,(%esp)
 8048bef:	e8 be 01 00 00       	call   8048db2 <phase_5>
 8048bf4:	e8 45 0a 00 00       	call   804963e <phase_defused>
 8048bf9:	c7 04 24 b0 a3 04 08 	movl   $0x804a3b0,(%esp)
 8048c00:	e8 7b fc ff ff       	call   8048880 <puts@plt>
 8048c05:	e8 3a 09 00 00       	call   8049544 <read_line>
 8048c0a:	89 04 24             	mov    %eax,(%esp)
 8048c0d:	e8 a6 02 00 00       	call   8048eb8 <phase_6>
 8048c12:	e8 27 0a 00 00       	call   804963e <phase_defused>
 8048c17:	c7 04 24 90 a4 04 08 	movl   $0x804a490,(%esp)
 8048c1e:	e8 5d fc ff ff       	call   8048880 <puts@plt>
 8048c23:	e8 1c 09 00 00       	call   8049544 <read_line>
 8048c28:	89 04 24             	mov    %eax,(%esp)
 8048c2b:	e8 e8 02 00 00       	call   8048f18 <phase_7>
 8048c30:	e8 09 0a 00 00       	call   804963e <phase_defused>
 8048c35:	c7 04 24 b0 a4 04 08 	movl   $0x804a4b0,(%esp)
 8048c3c:	e8 3f fc ff ff       	call   8048880 <puts@plt>
 8048c41:	e8 fe 08 00 00       	call   8049544 <read_line>
 8048c46:	89 04 24             	mov    %eax,(%esp)
 8048c49:	e8 3e 03 00 00       	call   8048f8c <phase_8>
 8048c4e:	e8 eb 09 00 00       	call   804963e <phase_defused>
 8048c53:	c7 04 24 ce a3 04 08 	movl   $0x804a3ce,(%esp)
 8048c5a:	e8 21 fc ff ff       	call   8048880 <puts@plt>
 8048c5f:	e8 e0 08 00 00       	call   8049544 <read_line>
 8048c64:	89 04 24             	mov    %eax,(%esp)
 8048c67:	e8 45 04 00 00       	call   80490b1 <phase_9>
 8048c6c:	e8 cd 09 00 00       	call   804963e <phase_defused>
 8048c71:	b8 00 00 00 00       	mov    $0x0,%eax
 8048c76:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8048c79:	c9                   	leave  
 8048c7a:	c3                   	ret    
 8048c7b:	66 90                	xchg   %ax,%ax
 8048c7d:	66 90                	xchg   %ax,%ax
 8048c7f:	90                   	nop

08048c80 <phase_1>:
 8048c80:	83 ec 2c             	sub    $0x2c,%esp
 8048c83:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
 8048c8a:	00 
 8048c8b:	8d 44 24 1c          	lea    0x1c(%esp),%eax
 8048c8f:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048c93:	c7 44 24 04 84 a7 04 	movl   $0x804a784,0x4(%esp)
 8048c9a:	08 
 8048c9b:	8b 44 24 30          	mov    0x30(%esp),%eax
 8048c9f:	89 04 24             	mov    %eax,(%esp)
 8048ca2:	e8 59 fc ff ff       	call   8048900 <__isoc99_sscanf@plt>
 8048ca7:	83 f8 01             	cmp    $0x1,%eax
 8048caa:	74 05                	je     8048cb1 <phase_1+0x31>
 8048cac:	e8 04 08 00 00       	call   80494b5 <explode_bomb>
 8048cb1:	81 7c 24 1c 6b 01 00 	cmpl   $0x16b,0x1c(%esp)
 8048cb8:	00 
 8048cb9:	74 05                	je     8048cc0 <phase_1+0x40>
 8048cbb:	e8 f5 07 00 00       	call   80494b5 <explode_bomb>
 8048cc0:	83 c4 2c             	add    $0x2c,%esp
 8048cc3:	c3                   	ret    

08048cc4 <phase_2>:
 8048cc4:	83 ec 1c             	sub    $0x1c,%esp
 8048cc7:	c7 44 24 04 d0 a4 04 	movl   $0x804a4d0,0x4(%esp)
 8048cce:	08 
 8048ccf:	8b 44 24 20          	mov    0x20(%esp),%eax
 8048cd3:	89 04 24             	mov    %eax,(%esp)
 8048cd6:	e8 df 04 00 00       	call   80491ba <strings_not_equal>
 8048cdb:	85 c0                	test   %eax,%eax
 8048cdd:	74 05                	je     8048ce4 <phase_2+0x20>
 8048cdf:	e8 d1 07 00 00       	call   80494b5 <explode_bomb>
 8048ce4:	83 c4 1c             	add    $0x1c,%esp
 8048ce7:	c3                   	ret    

08048ce8 <phase_3>:
 8048ce8:	83 ec 1c             	sub    $0x1c,%esp
 8048ceb:	c7 04 24 08 a5 04 08 	movl   $0x804a508,(%esp)
 8048cf2:	e8 a4 04 00 00       	call   804919b <string_length>
 8048cf7:	83 c0 01             	add    $0x1,%eax
 8048cfa:	89 04 24             	mov    %eax,(%esp)
 8048cfd:	e8 6e fb ff ff       	call   8048870 <malloc@plt>
 8048d02:	c7 00 49 20 63 61    	movl   $0x61632049,(%eax)
 8048d08:	c7 40 04 6e 20 73 65 	movl   $0x6573206e,0x4(%eax)
 8048d0f:	c7 40 08 65 20 52 75 	movl   $0x75522065,0x8(%eax)
 8048d16:	c7 40 0c 73 73 69 61 	movl   $0x61697373,0xc(%eax)
 8048d1d:	c7 40 10 20 66 72 6f 	movl   $0x6f726620,0x10(%eax)
 8048d24:	c7 40 14 6d 20 6d 79 	movl   $0x796d206d,0x14(%eax)
 8048d2b:	c7 40 18 20 68 6f 75 	movl   $0x756f6820,0x18(%eax)
 8048d32:	c7 40 1c 73 65 21 00 	movl   $0x216573,0x1c(%eax)
 8048d39:	c6 40 11 63          	movb   $0x63,0x11(%eax)
 8048d3d:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048d41:	8b 44 24 20          	mov    0x20(%esp),%eax
 8048d45:	89 04 24             	mov    %eax,(%esp)
 8048d48:	e8 6d 04 00 00       	call   80491ba <strings_not_equal>
 8048d4d:	85 c0                	test   %eax,%eax
 8048d4f:	74 05                	je     8048d56 <phase_3+0x6e>
 8048d51:	e8 5f 07 00 00       	call   80494b5 <explode_bomb>
 8048d56:	83 c4 1c             	add    $0x1c,%esp
 8048d59:	c3                   	ret    

08048d5a <phase_4>:
 8048d5a:	56                   	push   %esi
 8048d5b:	53                   	push   %ebx
 8048d5c:	83 ec 34             	sub    $0x34,%esp
 8048d5f:	8d 44 24 18          	lea    0x18(%esp),%eax
 8048d63:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048d67:	8b 44 24 40          	mov    0x40(%esp),%eax
 8048d6b:	89 04 24             	mov    %eax,(%esp)
 8048d6e:	e8 81 07 00 00       	call   80494f4 <read_six_numbers>
 8048d73:	83 7c 24 18 05       	cmpl   $0x5,0x18(%esp)
 8048d78:	75 07                	jne    8048d81 <phase_4+0x27>
 8048d7a:	83 7c 24 1c 08       	cmpl   $0x8,0x1c(%esp)
 8048d7f:	74 21                	je     8048da2 <phase_4+0x48>
 8048d81:	e8 2f 07 00 00       	call   80494b5 <explode_bomb>
 8048d86:	eb 1a                	jmp    8048da2 <phase_4+0x48>
 8048d88:	8b 43 f8             	mov    -0x8(%ebx),%eax
 8048d8b:	03 43 fc             	add    -0x4(%ebx),%eax
 8048d8e:	39 03                	cmp    %eax,(%ebx)
 8048d90:	74 05                	je     8048d97 <phase_4+0x3d>
 8048d92:	e8 1e 07 00 00       	call   80494b5 <explode_bomb>
 8048d97:	83 c3 04             	add    $0x4,%ebx
 8048d9a:	39 f3                	cmp    %esi,%ebx
 8048d9c:	75 ea                	jne    8048d88 <phase_4+0x2e>
 8048d9e:	66 90                	xchg   %ax,%ax
 8048da0:	eb 0a                	jmp    8048dac <phase_4+0x52>
 8048da2:	8d 5c 24 20          	lea    0x20(%esp),%ebx
 8048da6:	8d 74 24 30          	lea    0x30(%esp),%esi
 8048daa:	eb dc                	jmp    8048d88 <phase_4+0x2e>
 8048dac:	83 c4 34             	add    $0x34,%esp
 8048daf:	5b                   	pop    %ebx
 8048db0:	5e                   	pop    %esi
 8048db1:	c3                   	ret    

08048db2 <phase_5>:
 8048db2:	83 ec 2c             	sub    $0x2c,%esp
 8048db5:	8d 44 24 1c          	lea    0x1c(%esp),%eax
 8048db9:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048dbd:	8d 44 24 18          	lea    0x18(%esp),%eax
 8048dc1:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048dc5:	c7 44 24 04 81 a7 04 	movl   $0x804a781,0x4(%esp)
 8048dcc:	08 
 8048dcd:	8b 44 24 30          	mov    0x30(%esp),%eax
 8048dd1:	89 04 24             	mov    %eax,(%esp)
 8048dd4:	e8 27 fb ff ff       	call   8048900 <__isoc99_sscanf@plt>
 8048dd9:	83 f8 01             	cmp    $0x1,%eax
 8048ddc:	7f 05                	jg     8048de3 <phase_5+0x31>
 8048dde:	e8 d2 06 00 00       	call   80494b5 <explode_bomb>
 8048de3:	83 7c 24 18 07       	cmpl   $0x7,0x18(%esp)
 8048de8:	77 64                	ja     8048e4e <phase_5+0x9c>
 8048dea:	8b 44 24 18          	mov    0x18(%esp),%eax
 8048dee:	ff 24 85 40 a5 04 08 	jmp    *0x804a540(,%eax,4)
 8048df5:	b8 00 00 00 00       	mov    $0x0,%eax
 8048dfa:	eb 05                	jmp    8048e01 <phase_5+0x4f>
 8048dfc:	b8 2e 01 00 00       	mov    $0x12e,%eax
 8048e01:	2d e9 00 00 00       	sub    $0xe9,%eax
 8048e06:	eb 05                	jmp    8048e0d <phase_5+0x5b>
 8048e08:	b8 00 00 00 00       	mov    $0x0,%eax
 8048e0d:	83 c0 7f             	add    $0x7f,%eax
 8048e10:	eb 05                	jmp    8048e17 <phase_5+0x65>
 8048e12:	b8 00 00 00 00       	mov    $0x0,%eax
 8048e17:	2d ee 00 00 00       	sub    $0xee,%eax
 8048e1c:	eb 05                	jmp    8048e23 <phase_5+0x71>
 8048e1e:	b8 00 00 00 00       	mov    $0x0,%eax
 8048e23:	05 ee 00 00 00       	add    $0xee,%eax
 8048e28:	eb 05                	jmp    8048e2f <phase_5+0x7d>
 8048e2a:	b8 00 00 00 00       	mov    $0x0,%eax
 8048e2f:	2d ee 00 00 00       	sub    $0xee,%eax
 8048e34:	eb 05                	jmp    8048e3b <phase_5+0x89>
 8048e36:	b8 00 00 00 00       	mov    $0x0,%eax
 8048e3b:	05 ee 00 00 00       	add    $0xee,%eax
 8048e40:	eb 05                	jmp    8048e47 <phase_5+0x95>
 8048e42:	b8 00 00 00 00       	mov    $0x0,%eax
 8048e47:	2d ee 00 00 00       	sub    $0xee,%eax
 8048e4c:	eb 0a                	jmp    8048e58 <phase_5+0xa6>
 8048e4e:	e8 62 06 00 00       	call   80494b5 <explode_bomb>
 8048e53:	b8 00 00 00 00       	mov    $0x0,%eax
 8048e58:	83 7c 24 18 05       	cmpl   $0x5,0x18(%esp)
 8048e5d:	7f 06                	jg     8048e65 <phase_5+0xb3>
 8048e5f:	3b 44 24 1c          	cmp    0x1c(%esp),%eax
 8048e63:	74 05                	je     8048e6a <phase_5+0xb8>
 8048e65:	e8 4b 06 00 00       	call   80494b5 <explode_bomb>
 8048e6a:	83 c4 2c             	add    $0x2c,%esp
 8048e6d:	c3                   	ret    

08048e6e <func6>:
 8048e6e:	57                   	push   %edi
 8048e6f:	56                   	push   %esi
 8048e70:	53                   	push   %ebx
 8048e71:	83 ec 10             	sub    $0x10,%esp
 8048e74:	8b 5c 24 20          	mov    0x20(%esp),%ebx
 8048e78:	8b 74 24 24          	mov    0x24(%esp),%esi
 8048e7c:	85 db                	test   %ebx,%ebx
 8048e7e:	7e 2c                	jle    8048eac <func6+0x3e>
 8048e80:	89 f0                	mov    %esi,%eax
 8048e82:	83 fb 01             	cmp    $0x1,%ebx
 8048e85:	74 2a                	je     8048eb1 <func6+0x43>
 8048e87:	89 74 24 04          	mov    %esi,0x4(%esp)
 8048e8b:	8d 43 ff             	lea    -0x1(%ebx),%eax
 8048e8e:	89 04 24             	mov    %eax,(%esp)
 8048e91:	e8 d8 ff ff ff       	call   8048e6e <func6>
 8048e96:	8d 3c 30             	lea    (%eax,%esi,1),%edi
 8048e99:	89 74 24 04          	mov    %esi,0x4(%esp)
 8048e9d:	83 eb 02             	sub    $0x2,%ebx
 8048ea0:	89 1c 24             	mov    %ebx,(%esp)
 8048ea3:	e8 c6 ff ff ff       	call   8048e6e <func6>
 8048ea8:	01 f8                	add    %edi,%eax
 8048eaa:	eb 05                	jmp    8048eb1 <func6+0x43>
 8048eac:	b8 00 00 00 00       	mov    $0x0,%eax
 8048eb1:	83 c4 10             	add    $0x10,%esp
 8048eb4:	5b                   	pop    %ebx
 8048eb5:	5e                   	pop    %esi
 8048eb6:	5f                   	pop    %edi
 8048eb7:	c3                   	ret    

08048eb8 <phase_6>:
 8048eb8:	83 ec 2c             	sub    $0x2c,%esp
 8048ebb:	8d 44 24 18          	lea    0x18(%esp),%eax
 8048ebf:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048ec3:	8d 44 24 1c          	lea    0x1c(%esp),%eax
 8048ec7:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048ecb:	c7 44 24 04 81 a7 04 	movl   $0x804a781,0x4(%esp)
 8048ed2:	08 
 8048ed3:	8b 44 24 30          	mov    0x30(%esp),%eax
 8048ed7:	89 04 24             	mov    %eax,(%esp)
 8048eda:	e8 21 fa ff ff       	call   8048900 <__isoc99_sscanf@plt>
 8048edf:	83 f8 02             	cmp    $0x2,%eax
 8048ee2:	75 0c                	jne    8048ef0 <phase_6+0x38>
 8048ee4:	8b 44 24 18          	mov    0x18(%esp),%eax
 8048ee8:	83 e8 02             	sub    $0x2,%eax
 8048eeb:	83 f8 02             	cmp    $0x2,%eax
 8048eee:	76 05                	jbe    8048ef5 <phase_6+0x3d>
 8048ef0:	e8 c0 05 00 00       	call   80494b5 <explode_bomb>
 8048ef5:	8b 44 24 18          	mov    0x18(%esp),%eax
 8048ef9:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048efd:	c7 04 24 09 00 00 00 	movl   $0x9,(%esp)
 8048f04:	e8 65 ff ff ff       	call   8048e6e <func6>
 8048f09:	3b 44 24 1c          	cmp    0x1c(%esp),%eax
 8048f0d:	74 05                	je     8048f14 <phase_6+0x5c>
 8048f0f:	e8 a1 05 00 00       	call   80494b5 <explode_bomb>
 8048f14:	83 c4 2c             	add    $0x2c,%esp
 8048f17:	c3                   	ret    

08048f18 <phase_7>:
 8048f18:	83 ec 2c             	sub    $0x2c,%esp
 8048f1b:	8d 44 24 1c          	lea    0x1c(%esp),%eax
 8048f1f:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048f23:	8d 44 24 18          	lea    0x18(%esp),%eax
 8048f27:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048f2b:	c7 44 24 04 81 a7 04 	movl   $0x804a781,0x4(%esp)
 8048f32:	08 
 8048f33:	8b 44 24 30          	mov    0x30(%esp),%eax
 8048f37:	89 04 24             	mov    %eax,(%esp)
 8048f3a:	e8 c1 f9 ff ff       	call   8048900 <__isoc99_sscanf@plt>
 8048f3f:	83 f8 01             	cmp    $0x1,%eax
 8048f42:	7f 05                	jg     8048f49 <phase_7+0x31>
 8048f44:	e8 6c 05 00 00       	call   80494b5 <explode_bomb>
 8048f49:	8b 44 24 18          	mov    0x18(%esp),%eax
 8048f4d:	83 e0 0f             	and    $0xf,%eax
 8048f50:	89 44 24 18          	mov    %eax,0x18(%esp)
 8048f54:	83 f8 0f             	cmp    $0xf,%eax
 8048f57:	74 2a                	je     8048f83 <phase_7+0x6b>
 8048f59:	b9 00 00 00 00       	mov    $0x0,%ecx
 8048f5e:	ba 00 00 00 00       	mov    $0x0,%edx
 8048f63:	83 c2 01             	add    $0x1,%edx
 8048f66:	8b 04 85 60 a5 04 08 	mov    0x804a560(,%eax,4),%eax
 8048f6d:	01 c1                	add    %eax,%ecx
 8048f6f:	83 f8 0f             	cmp    $0xf,%eax
 8048f72:	75 ef                	jne    8048f63 <phase_7+0x4b>
 8048f74:	89 44 24 18          	mov    %eax,0x18(%esp)
 8048f78:	83 fa 0f             	cmp    $0xf,%edx
 8048f7b:	75 06                	jne    8048f83 <phase_7+0x6b>
 8048f7d:	3b 4c 24 1c          	cmp    0x1c(%esp),%ecx
 8048f81:	74 05                	je     8048f88 <phase_7+0x70>
 8048f83:	e8 2d 05 00 00       	call   80494b5 <explode_bomb>
 8048f88:	83 c4 2c             	add    $0x2c,%esp
 8048f8b:	c3                   	ret    

08048f8c <phase_8>:
 8048f8c:	56                   	push   %esi
 8048f8d:	53                   	push   %ebx
 8048f8e:	83 ec 44             	sub    $0x44,%esp
 8048f91:	8d 44 24 10          	lea    0x10(%esp),%eax
 8048f95:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048f99:	8b 44 24 50          	mov    0x50(%esp),%eax
 8048f9d:	89 04 24             	mov    %eax,(%esp)
 8048fa0:	e8 4f 05 00 00       	call   80494f4 <read_six_numbers>
 8048fa5:	be 00 00 00 00       	mov    $0x0,%esi
 8048faa:	8b 44 b4 10          	mov    0x10(%esp,%esi,4),%eax
 8048fae:	83 e8 01             	sub    $0x1,%eax
 8048fb1:	83 f8 05             	cmp    $0x5,%eax
 8048fb4:	76 05                	jbe    8048fbb <phase_8+0x2f>
 8048fb6:	e8 fa 04 00 00       	call   80494b5 <explode_bomb>
 8048fbb:	83 c6 01             	add    $0x1,%esi
 8048fbe:	83 fe 06             	cmp    $0x6,%esi
 8048fc1:	75 07                	jne    8048fca <phase_8+0x3e>
 8048fc3:	bb 00 00 00 00       	mov    $0x0,%ebx
 8048fc8:	eb 39                	jmp    8049003 <phase_8+0x77>
 8048fca:	89 f3                	mov    %esi,%ebx
 8048fcc:	8b 44 9c 10          	mov    0x10(%esp,%ebx,4),%eax
 8048fd0:	39 44 b4 0c          	cmp    %eax,0xc(%esp,%esi,4)
 8048fd4:	75 05                	jne    8048fdb <phase_8+0x4f>
 8048fd6:	e8 da 04 00 00       	call   80494b5 <explode_bomb>
 8048fdb:	83 c3 01             	add    $0x1,%ebx
 8048fde:	83 fb 05             	cmp    $0x5,%ebx
 8048fe1:	7e e9                	jle    8048fcc <phase_8+0x40>
 8048fe3:	eb c5                	jmp    8048faa <phase_8+0x1e>
 8048fe5:	8b 52 08             	mov    0x8(%edx),%edx
 8048fe8:	83 c0 01             	add    $0x1,%eax
 8048feb:	39 c8                	cmp    %ecx,%eax
 8048fed:	75 f6                	jne    8048fe5 <phase_8+0x59>
 8048fef:	90                   	nop
 8048ff0:	eb 05                	jmp    8048ff7 <phase_8+0x6b>
 8048ff2:	ba 74 d1 04 08       	mov    $0x804d174,%edx
 8048ff7:	89 54 b4 28          	mov    %edx,0x28(%esp,%esi,4)
 8048ffb:	83 c3 01             	add    $0x1,%ebx
 8048ffe:	83 fb 06             	cmp    $0x6,%ebx
 8049001:	74 17                	je     804901a <phase_8+0x8e>
 8049003:	89 de                	mov    %ebx,%esi
 8049005:	8b 4c 9c 10          	mov    0x10(%esp,%ebx,4),%ecx
 8049009:	83 f9 01             	cmp    $0x1,%ecx
 804900c:	7e e4                	jle    8048ff2 <phase_8+0x66>
 804900e:	b8 01 00 00 00       	mov    $0x1,%eax
 8049013:	ba 74 d1 04 08       	mov    $0x804d174,%edx
 8049018:	eb cb                	jmp    8048fe5 <phase_8+0x59>
 804901a:	8b 5c 24 28          	mov    0x28(%esp),%ebx
 804901e:	8d 44 24 2c          	lea    0x2c(%esp),%eax
 8049022:	8d 74 24 40          	lea    0x40(%esp),%esi
 8049026:	89 d9                	mov    %ebx,%ecx
 8049028:	8b 10                	mov    (%eax),%edx
 804902a:	89 51 08             	mov    %edx,0x8(%ecx)
 804902d:	83 c0 04             	add    $0x4,%eax
 8049030:	39 f0                	cmp    %esi,%eax
 8049032:	74 04                	je     8049038 <phase_8+0xac>
 8049034:	89 d1                	mov    %edx,%ecx
 8049036:	eb f0                	jmp    8049028 <phase_8+0x9c>
 8049038:	c7 42 08 00 00 00 00 	movl   $0x0,0x8(%edx)
 804903f:	be 05 00 00 00       	mov    $0x5,%esi
 8049044:	8b 43 08             	mov    0x8(%ebx),%eax
 8049047:	8b 00                	mov    (%eax),%eax
 8049049:	39 03                	cmp    %eax,(%ebx)
 804904b:	7d 05                	jge    8049052 <phase_8+0xc6>
 804904d:	e8 63 04 00 00       	call   80494b5 <explode_bomb>
 8049052:	8b 5b 08             	mov    0x8(%ebx),%ebx
 8049055:	83 ee 01             	sub    $0x1,%esi
 8049058:	75 ea                	jne    8049044 <phase_8+0xb8>
 804905a:	83 c4 44             	add    $0x44,%esp
 804905d:	5b                   	pop    %ebx
 804905e:	5e                   	pop    %esi
 804905f:	c3                   	ret    

08049060 <fun9>:
 8049060:	53                   	push   %ebx
 8049061:	83 ec 18             	sub    $0x18,%esp
 8049064:	8b 54 24 20          	mov    0x20(%esp),%edx
 8049068:	8b 4c 24 24          	mov    0x24(%esp),%ecx
 804906c:	85 d2                	test   %edx,%edx
 804906e:	74 37                	je     80490a7 <fun9+0x47>
 8049070:	8b 1a                	mov    (%edx),%ebx
 8049072:	39 cb                	cmp    %ecx,%ebx
 8049074:	7e 13                	jle    8049089 <fun9+0x29>
 8049076:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 804907a:	8b 42 04             	mov    0x4(%edx),%eax
 804907d:	89 04 24             	mov    %eax,(%esp)
 8049080:	e8 db ff ff ff       	call   8049060 <fun9>
 8049085:	01 c0                	add    %eax,%eax
 8049087:	eb 23                	jmp    80490ac <fun9+0x4c>
 8049089:	b8 00 00 00 00       	mov    $0x0,%eax
 804908e:	39 cb                	cmp    %ecx,%ebx
 8049090:	74 1a                	je     80490ac <fun9+0x4c>
 8049092:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8049096:	8b 42 08             	mov    0x8(%edx),%eax
 8049099:	89 04 24             	mov    %eax,(%esp)
 804909c:	e8 bf ff ff ff       	call   8049060 <fun9>
 80490a1:	8d 44 00 01          	lea    0x1(%eax,%eax,1),%eax
 80490a5:	eb 05                	jmp    80490ac <fun9+0x4c>
 80490a7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 80490ac:	83 c4 18             	add    $0x18,%esp
 80490af:	5b                   	pop    %ebx
 80490b0:	c3                   	ret    

080490b1 <phase_9>:
 80490b1:	53                   	push   %ebx
 80490b2:	83 ec 18             	sub    $0x18,%esp
 80490b5:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 80490bc:	00 
 80490bd:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 80490c4:	00 
 80490c5:	8b 44 24 20          	mov    0x20(%esp),%eax
 80490c9:	89 04 24             	mov    %eax,(%esp)
 80490cc:	e8 9f f8 ff ff       	call   8048970 <strtol@plt>
 80490d1:	89 c3                	mov    %eax,%ebx
 80490d3:	8d 40 ff             	lea    -0x1(%eax),%eax
 80490d6:	3d ec 03 00 00       	cmp    $0x3ec,%eax
 80490db:	76 05                	jbe    80490e2 <phase_9+0x31>
 80490dd:	e8 d3 03 00 00       	call   80494b5 <explode_bomb>
 80490e2:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 80490e6:	c7 04 24 c0 d0 04 08 	movl   $0x804d0c0,(%esp)
 80490ed:	e8 6e ff ff ff       	call   8049060 <fun9>
 80490f2:	83 f8 03             	cmp    $0x3,%eax
 80490f5:	74 05                	je     80490fc <phase_9+0x4b>
 80490f7:	e8 b9 03 00 00       	call   80494b5 <explode_bomb>
 80490fc:	83 c4 18             	add    $0x18,%esp
 80490ff:	5b                   	pop    %ebx
 8049100:	c3                   	ret    
 8049101:	66 90                	xchg   %ax,%ax
 8049103:	66 90                	xchg   %ax,%ax
 8049105:	66 90                	xchg   %ax,%ax
 8049107:	66 90                	xchg   %ax,%ax
 8049109:	66 90                	xchg   %ax,%ax
 804910b:	66 90                	xchg   %ax,%ax
 804910d:	66 90                	xchg   %ax,%ax
 804910f:	90                   	nop

08049110 <sig_handler>:
 8049110:	83 ec 1c             	sub    $0x1c,%esp
 8049113:	c7 04 24 a0 a5 04 08 	movl   $0x804a5a0,(%esp)
 804911a:	e8 61 f7 ff ff       	call   8048880 <puts@plt>
 804911f:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
 8049126:	e8 e5 f6 ff ff       	call   8048810 <sleep@plt>
 804912b:	c7 44 24 04 fd a6 04 	movl   $0x804a6fd,0x4(%esp)
 8049132:	08 
 8049133:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804913a:	e8 f1 f7 ff ff       	call   8048930 <__printf_chk@plt>
 804913f:	a1 00 d8 04 08       	mov    0x804d800,%eax
 8049144:	89 04 24             	mov    %eax,(%esp)
 8049147:	e8 94 f6 ff ff       	call   80487e0 <fflush@plt>
 804914c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8049153:	e8 b8 f6 ff ff       	call   8048810 <sleep@plt>
 8049158:	c7 04 24 05 a7 04 08 	movl   $0x804a705,(%esp)
 804915f:	e8 1c f7 ff ff       	call   8048880 <puts@plt>
 8049164:	c7 04 24 10 00 00 00 	movl   $0x10,(%esp)
 804916b:	e8 50 f7 ff ff       	call   80488c0 <exit@plt>

08049170 <invalid_phase>:
 8049170:	83 ec 1c             	sub    $0x1c,%esp
 8049173:	8b 44 24 20          	mov    0x20(%esp),%eax
 8049177:	89 44 24 08          	mov    %eax,0x8(%esp)
 804917b:	c7 44 24 04 0d a7 04 	movl   $0x804a70d,0x4(%esp)
 8049182:	08 
 8049183:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804918a:	e8 a1 f7 ff ff       	call   8048930 <__printf_chk@plt>
 804918f:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 8049196:	e8 25 f7 ff ff       	call   80488c0 <exit@plt>

0804919b <string_length>:
 804919b:	8b 54 24 04          	mov    0x4(%esp),%edx
 804919f:	80 3a 00             	cmpb   $0x0,(%edx)
 80491a2:	74 10                	je     80491b4 <string_length+0x19>
 80491a4:	b8 00 00 00 00       	mov    $0x0,%eax
 80491a9:	83 c0 01             	add    $0x1,%eax
 80491ac:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 80491b0:	75 f7                	jne    80491a9 <string_length+0xe>
 80491b2:	f3 c3                	repz ret 
 80491b4:	b8 00 00 00 00       	mov    $0x0,%eax
 80491b9:	c3                   	ret    

080491ba <strings_not_equal>:
 80491ba:	57                   	push   %edi
 80491bb:	56                   	push   %esi
 80491bc:	53                   	push   %ebx
 80491bd:	83 ec 04             	sub    $0x4,%esp
 80491c0:	8b 5c 24 14          	mov    0x14(%esp),%ebx
 80491c4:	8b 74 24 18          	mov    0x18(%esp),%esi
 80491c8:	89 1c 24             	mov    %ebx,(%esp)
 80491cb:	e8 cb ff ff ff       	call   804919b <string_length>
 80491d0:	89 c7                	mov    %eax,%edi
 80491d2:	89 34 24             	mov    %esi,(%esp)
 80491d5:	e8 c1 ff ff ff       	call   804919b <string_length>
 80491da:	ba 01 00 00 00       	mov    $0x1,%edx
 80491df:	39 c7                	cmp    %eax,%edi
 80491e1:	75 3a                	jne    804921d <strings_not_equal+0x63>
 80491e3:	0f b6 03             	movzbl (%ebx),%eax
 80491e6:	84 c0                	test   %al,%al
 80491e8:	74 20                	je     804920a <strings_not_equal+0x50>
 80491ea:	3a 06                	cmp    (%esi),%al
 80491ec:	74 08                	je     80491f6 <strings_not_equal+0x3c>
 80491ee:	66 90                	xchg   %ax,%ax
 80491f0:	eb 1f                	jmp    8049211 <strings_not_equal+0x57>
 80491f2:	3a 06                	cmp    (%esi),%al
 80491f4:	75 22                	jne    8049218 <strings_not_equal+0x5e>
 80491f6:	83 c3 01             	add    $0x1,%ebx
 80491f9:	83 c6 01             	add    $0x1,%esi
 80491fc:	0f b6 03             	movzbl (%ebx),%eax
 80491ff:	84 c0                	test   %al,%al
 8049201:	75 ef                	jne    80491f2 <strings_not_equal+0x38>
 8049203:	ba 00 00 00 00       	mov    $0x0,%edx
 8049208:	eb 13                	jmp    804921d <strings_not_equal+0x63>
 804920a:	ba 00 00 00 00       	mov    $0x0,%edx
 804920f:	eb 0c                	jmp    804921d <strings_not_equal+0x63>
 8049211:	ba 01 00 00 00       	mov    $0x1,%edx
 8049216:	eb 05                	jmp    804921d <strings_not_equal+0x63>
 8049218:	ba 01 00 00 00       	mov    $0x1,%edx
 804921d:	89 d0                	mov    %edx,%eax
 804921f:	83 c4 04             	add    $0x4,%esp
 8049222:	5b                   	pop    %ebx
 8049223:	5e                   	pop    %esi
 8049224:	5f                   	pop    %edi
 8049225:	c3                   	ret    

08049226 <initialize_bomb>:
 8049226:	56                   	push   %esi
 8049227:	53                   	push   %ebx
 8049228:	81 ec 64 20 00 00    	sub    $0x2064,%esp
 804922e:	65 a1 14 00 00 00    	mov    %gs:0x14,%eax
 8049234:	89 84 24 5c 20 00 00 	mov    %eax,0x205c(%esp)
 804923b:	31 c0                	xor    %eax,%eax
 804923d:	c7 44 24 04 10 91 04 	movl   $0x8049110,0x4(%esp)
 8049244:	08 
 8049245:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 804924c:	e8 af f5 ff ff       	call   8048800 <signal@plt>
 8049251:	c7 44 24 04 40 00 00 	movl   $0x40,0x4(%esp)
 8049258:	00 
 8049259:	8d 44 24 1c          	lea    0x1c(%esp),%eax
 804925d:	89 04 24             	mov    %eax,(%esp)
 8049260:	e8 eb f5 ff ff       	call   8048850 <gethostname@plt>
 8049265:	85 c0                	test   %eax,%eax
 8049267:	75 14                	jne    804927d <initialize_bomb+0x57>
 8049269:	a1 e0 d5 04 08       	mov    0x804d5e0,%eax
 804926e:	bb 00 00 00 00       	mov    $0x0,%ebx
 8049273:	8d 74 24 1c          	lea    0x1c(%esp),%esi
 8049277:	85 c0                	test   %eax,%eax
 8049279:	75 1a                	jne    8049295 <initialize_bomb+0x6f>
 804927b:	eb 60                	jmp    80492dd <initialize_bomb+0xb7>
 804927d:	c7 04 24 d8 a5 04 08 	movl   $0x804a5d8,(%esp)
 8049284:	e8 f7 f5 ff ff       	call   8048880 <puts@plt>
 8049289:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 8049290:	e8 2b f6 ff ff       	call   80488c0 <exit@plt>
 8049295:	89 74 24 04          	mov    %esi,0x4(%esp)
 8049299:	89 04 24             	mov    %eax,(%esp)
 804929c:	e8 4f f6 ff ff       	call   80488f0 <strcasecmp@plt>
 80492a1:	85 c0                	test   %eax,%eax
 80492a3:	74 50                	je     80492f5 <initialize_bomb+0xcf>
 80492a5:	83 c3 01             	add    $0x1,%ebx
 80492a8:	8b 04 9d e0 d5 04 08 	mov    0x804d5e0(,%ebx,4),%eax
 80492af:	85 c0                	test   %eax,%eax
 80492b1:	75 e2                	jne    8049295 <initialize_bomb+0x6f>
 80492b3:	eb 28                	jmp    80492dd <initialize_bomb+0xb7>
 80492b5:	8d 44 24 5c          	lea    0x5c(%esp),%eax
 80492b9:	89 44 24 08          	mov    %eax,0x8(%esp)
 80492bd:	c7 44 24 04 1e a7 04 	movl   $0x804a71e,0x4(%esp)
 80492c4:	08 
 80492c5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 80492cc:	e8 5f f6 ff ff       	call   8048930 <__printf_chk@plt>
 80492d1:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 80492d8:	e8 e3 f5 ff ff       	call   80488c0 <exit@plt>
 80492dd:	c7 04 24 10 a6 04 08 	movl   $0x804a610,(%esp)
 80492e4:	e8 97 f5 ff ff       	call   8048880 <puts@plt>
 80492e9:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 80492f0:	e8 cb f5 ff ff       	call   80488c0 <exit@plt>
 80492f5:	8d 44 24 5c          	lea    0x5c(%esp),%eax
 80492f9:	89 04 24             	mov    %eax,(%esp)
 80492fc:	e8 0d 0d 00 00       	call   804a00e <init_driver>
 8049301:	85 c0                	test   %eax,%eax
 8049303:	78 b0                	js     80492b5 <initialize_bomb+0x8f>
 8049305:	8b 84 24 5c 20 00 00 	mov    0x205c(%esp),%eax
 804930c:	65 33 05 14 00 00 00 	xor    %gs:0x14,%eax
 8049313:	74 05                	je     804931a <initialize_bomb+0xf4>
 8049315:	e8 16 f5 ff ff       	call   8048830 <__stack_chk_fail@plt>
 804931a:	81 c4 64 20 00 00    	add    $0x2064,%esp
 8049320:	5b                   	pop    %ebx
 8049321:	5e                   	pop    %esi
 8049322:	c3                   	ret    

08049323 <initialize_bomb_solve>:
 8049323:	f3 c3                	repz ret 

08049325 <blank_line>:
 8049325:	56                   	push   %esi
 8049326:	53                   	push   %ebx
 8049327:	83 ec 04             	sub    $0x4,%esp
 804932a:	8b 5c 24 10          	mov    0x10(%esp),%ebx
 804932e:	eb 16                	jmp    8049346 <blank_line+0x21>
 8049330:	e8 6b f6 ff ff       	call   80489a0 <__ctype_b_loc@plt>
 8049335:	83 c3 01             	add    $0x1,%ebx
 8049338:	89 f2                	mov    %esi,%edx
 804933a:	0f be f2             	movsbl %dl,%esi
 804933d:	8b 00                	mov    (%eax),%eax
 804933f:	f6 44 70 01 20       	testb  $0x20,0x1(%eax,%esi,2)
 8049344:	74 10                	je     8049356 <blank_line+0x31>
 8049346:	0f b6 33             	movzbl (%ebx),%esi
 8049349:	89 f0                	mov    %esi,%eax
 804934b:	84 c0                	test   %al,%al
 804934d:	75 e1                	jne    8049330 <blank_line+0xb>
 804934f:	b8 01 00 00 00       	mov    $0x1,%eax
 8049354:	eb 05                	jmp    804935b <blank_line+0x36>
 8049356:	b8 00 00 00 00       	mov    $0x0,%eax
 804935b:	83 c4 04             	add    $0x4,%esp
 804935e:	5b                   	pop    %ebx
 804935f:	5e                   	pop    %esi
 8049360:	c3                   	ret    

08049361 <skip>:
 8049361:	53                   	push   %ebx
 8049362:	83 ec 18             	sub    $0x18,%esp
 8049365:	a1 0c d8 04 08       	mov    0x804d80c,%eax
 804936a:	89 44 24 08          	mov    %eax,0x8(%esp)
 804936e:	c7 44 24 04 50 00 00 	movl   $0x50,0x4(%esp)
 8049375:	00 
 8049376:	a1 08 d8 04 08       	mov    0x804d808,%eax
 804937b:	8d 04 80             	lea    (%eax,%eax,4),%eax
 804937e:	c1 e0 04             	shl    $0x4,%eax
 8049381:	05 20 d8 04 08       	add    $0x804d820,%eax
 8049386:	89 04 24             	mov    %eax,(%esp)
 8049389:	e8 62 f4 ff ff       	call   80487f0 <fgets@plt>
 804938e:	89 c3                	mov    %eax,%ebx
 8049390:	85 c0                	test   %eax,%eax
 8049392:	74 0c                	je     80493a0 <skip+0x3f>
 8049394:	89 04 24             	mov    %eax,(%esp)
 8049397:	e8 89 ff ff ff       	call   8049325 <blank_line>
 804939c:	85 c0                	test   %eax,%eax
 804939e:	75 c5                	jne    8049365 <skip+0x4>
 80493a0:	89 d8                	mov    %ebx,%eax
 80493a2:	83 c4 18             	add    $0x18,%esp
 80493a5:	5b                   	pop    %ebx
 80493a6:	c3                   	ret    

080493a7 <send_msg>:
 80493a7:	57                   	push   %edi
 80493a8:	53                   	push   %ebx
 80493a9:	81 ec 34 40 00 00    	sub    $0x4034,%esp
 80493af:	65 a1 14 00 00 00    	mov    %gs:0x14,%eax
 80493b5:	89 84 24 2c 40 00 00 	mov    %eax,0x402c(%esp)
 80493bc:	31 c0                	xor    %eax,%eax
 80493be:	8b 15 08 d8 04 08    	mov    0x804d808,%edx
 80493c4:	8d 5c 92 fb          	lea    -0x5(%edx,%edx,4),%ebx
 80493c8:	c1 e3 04             	shl    $0x4,%ebx
 80493cb:	81 c3 20 d8 04 08    	add    $0x804d820,%ebx
 80493d1:	89 df                	mov    %ebx,%edi
 80493d3:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
 80493d8:	f2 ae                	repnz scas %es:(%edi),%al
 80493da:	f7 d1                	not    %ecx
 80493dc:	83 c1 63             	add    $0x63,%ecx
 80493df:	81 f9 00 20 00 00    	cmp    $0x2000,%ecx
 80493e5:	76 20                	jbe    8049407 <send_msg+0x60>
 80493e7:	c7 44 24 04 48 a6 04 	movl   $0x804a648,0x4(%esp)
 80493ee:	08 
 80493ef:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 80493f6:	e8 35 f5 ff ff       	call   8048930 <__printf_chk@plt>
 80493fb:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 8049402:	e8 b9 f4 ff ff       	call   80488c0 <exit@plt>
 8049407:	83 bc 24 40 40 00 00 	cmpl   $0x0,0x4040(%esp)
 804940e:	00 
 804940f:	b8 38 a7 04 08       	mov    $0x804a738,%eax
 8049414:	b9 40 a7 04 08       	mov    $0x804a740,%ecx
 8049419:	0f 44 c1             	cmove  %ecx,%eax
 804941c:	89 5c 24 1c          	mov    %ebx,0x1c(%esp)
 8049420:	89 54 24 18          	mov    %edx,0x18(%esp)
 8049424:	89 44 24 14          	mov    %eax,0x14(%esp)
 8049428:	a1 c0 d5 04 08       	mov    0x804d5c0,%eax
 804942d:	89 44 24 10          	mov    %eax,0x10(%esp)
 8049431:	c7 44 24 0c 49 a7 04 	movl   $0x804a749,0xc(%esp)
 8049438:	08 
 8049439:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
 8049440:	00 
 8049441:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8049448:	00 
 8049449:	8d 5c 24 2c          	lea    0x2c(%esp),%ebx
 804944d:	89 1c 24             	mov    %ebx,(%esp)
 8049450:	e8 5b f5 ff ff       	call   80489b0 <__sprintf_chk@plt>
 8049455:	8d 84 24 2c 20 00 00 	lea    0x202c(%esp),%eax
 804945c:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049460:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 8049467:	00 
 8049468:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 804946c:	c7 04 24 c0 d1 04 08 	movl   $0x804d1c0,(%esp)
 8049473:	e8 a4 0d 00 00       	call   804a21c <driver_post>
 8049478:	85 c0                	test   %eax,%eax
 804947a:	79 1b                	jns    8049497 <send_msg+0xf0>
 804947c:	8d 84 24 2c 20 00 00 	lea    0x202c(%esp),%eax
 8049483:	89 04 24             	mov    %eax,(%esp)
 8049486:	e8 f5 f3 ff ff       	call   8048880 <puts@plt>
 804948b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8049492:	e8 29 f4 ff ff       	call   80488c0 <exit@plt>
 8049497:	8b 84 24 2c 40 00 00 	mov    0x402c(%esp),%eax
 804949e:	65 33 05 14 00 00 00 	xor    %gs:0x14,%eax
 80494a5:	74 05                	je     80494ac <send_msg+0x105>
 80494a7:	e8 84 f3 ff ff       	call   8048830 <__stack_chk_fail@plt>
 80494ac:	81 c4 34 40 00 00    	add    $0x4034,%esp
 80494b2:	5b                   	pop    %ebx
 80494b3:	5f                   	pop    %edi
 80494b4:	c3                   	ret    

080494b5 <explode_bomb>:
 80494b5:	83 ec 1c             	sub    $0x1c,%esp
 80494b8:	c7 04 24 55 a7 04 08 	movl   $0x804a755,(%esp)
 80494bf:	e8 bc f3 ff ff       	call   8048880 <puts@plt>
 80494c4:	c7 04 24 5e a7 04 08 	movl   $0x804a75e,(%esp)
 80494cb:	e8 b0 f3 ff ff       	call   8048880 <puts@plt>
 80494d0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 80494d7:	e8 cb fe ff ff       	call   80493a7 <send_msg>
 80494dc:	c7 04 24 6c a6 04 08 	movl   $0x804a66c,(%esp)
 80494e3:	e8 98 f3 ff ff       	call   8048880 <puts@plt>
 80494e8:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 80494ef:	e8 cc f3 ff ff       	call   80488c0 <exit@plt>

080494f4 <read_six_numbers>:
 80494f4:	83 ec 2c             	sub    $0x2c,%esp
 80494f7:	8b 44 24 34          	mov    0x34(%esp),%eax
 80494fb:	8d 50 14             	lea    0x14(%eax),%edx
 80494fe:	89 54 24 1c          	mov    %edx,0x1c(%esp)
 8049502:	8d 50 10             	lea    0x10(%eax),%edx
 8049505:	89 54 24 18          	mov    %edx,0x18(%esp)
 8049509:	8d 50 0c             	lea    0xc(%eax),%edx
 804950c:	89 54 24 14          	mov    %edx,0x14(%esp)
 8049510:	8d 50 08             	lea    0x8(%eax),%edx
 8049513:	89 54 24 10          	mov    %edx,0x10(%esp)
 8049517:	8d 50 04             	lea    0x4(%eax),%edx
 804951a:	89 54 24 0c          	mov    %edx,0xc(%esp)
 804951e:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049522:	c7 44 24 04 75 a7 04 	movl   $0x804a775,0x4(%esp)
 8049529:	08 
 804952a:	8b 44 24 30          	mov    0x30(%esp),%eax
 804952e:	89 04 24             	mov    %eax,(%esp)
 8049531:	e8 ca f3 ff ff       	call   8048900 <__isoc99_sscanf@plt>
 8049536:	83 f8 05             	cmp    $0x5,%eax
 8049539:	7f 05                	jg     8049540 <read_six_numbers+0x4c>
 804953b:	e8 75 ff ff ff       	call   80494b5 <explode_bomb>
 8049540:	83 c4 2c             	add    $0x2c,%esp
 8049543:	c3                   	ret    

08049544 <read_line>:
 8049544:	57                   	push   %edi
 8049545:	56                   	push   %esi
 8049546:	53                   	push   %ebx
 8049547:	83 ec 10             	sub    $0x10,%esp
 804954a:	e8 12 fe ff ff       	call   8049361 <skip>
 804954f:	85 c0                	test   %eax,%eax
 8049551:	75 6c                	jne    80495bf <read_line+0x7b>
 8049553:	a1 e4 d7 04 08       	mov    0x804d7e4,%eax
 8049558:	39 05 0c d8 04 08    	cmp    %eax,0x804d80c
 804955e:	75 18                	jne    8049578 <read_line+0x34>
 8049560:	c7 04 24 87 a7 04 08 	movl   $0x804a787,(%esp)
 8049567:	e8 14 f3 ff ff       	call   8048880 <puts@plt>
 804956c:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 8049573:	e8 48 f3 ff ff       	call   80488c0 <exit@plt>
 8049578:	c7 04 24 a5 a7 04 08 	movl   $0x804a7a5,(%esp)
 804957f:	e8 dc f2 ff ff       	call   8048860 <getenv@plt>
 8049584:	85 c0                	test   %eax,%eax
 8049586:	74 0c                	je     8049594 <read_line+0x50>
 8049588:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 804958f:	e8 2c f3 ff ff       	call   80488c0 <exit@plt>
 8049594:	a1 e4 d7 04 08       	mov    0x804d7e4,%eax
 8049599:	a3 0c d8 04 08       	mov    %eax,0x804d80c
 804959e:	e8 be fd ff ff       	call   8049361 <skip>
 80495a3:	85 c0                	test   %eax,%eax
 80495a5:	75 18                	jne    80495bf <read_line+0x7b>
 80495a7:	c7 04 24 87 a7 04 08 	movl   $0x804a787,(%esp)
 80495ae:	e8 cd f2 ff ff       	call   8048880 <puts@plt>
 80495b3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 80495ba:	e8 01 f3 ff ff       	call   80488c0 <exit@plt>
 80495bf:	8b 15 08 d8 04 08    	mov    0x804d808,%edx
 80495c5:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 80495c8:	c1 e3 04             	shl    $0x4,%ebx
 80495cb:	81 c3 20 d8 04 08    	add    $0x804d820,%ebx
 80495d1:	89 df                	mov    %ebx,%edi
 80495d3:	b8 00 00 00 00       	mov    $0x0,%eax
 80495d8:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
 80495dd:	f2 ae                	repnz scas %es:(%edi),%al
 80495df:	f7 d1                	not    %ecx
 80495e1:	83 e9 01             	sub    $0x1,%ecx
 80495e4:	83 f9 4e             	cmp    $0x4e,%ecx
 80495e7:	7e 35                	jle    804961e <read_line+0xda>
 80495e9:	c7 04 24 b0 a7 04 08 	movl   $0x804a7b0,(%esp)
 80495f0:	e8 8b f2 ff ff       	call   8048880 <puts@plt>
 80495f5:	a1 08 d8 04 08       	mov    0x804d808,%eax
 80495fa:	8d 50 01             	lea    0x1(%eax),%edx
 80495fd:	89 15 08 d8 04 08    	mov    %edx,0x804d808
 8049603:	6b c0 50             	imul   $0x50,%eax,%eax
 8049606:	05 20 d8 04 08       	add    $0x804d820,%eax
 804960b:	be cb a7 04 08       	mov    $0x804a7cb,%esi
 8049610:	b9 04 00 00 00       	mov    $0x4,%ecx
 8049615:	89 c7                	mov    %eax,%edi
 8049617:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
 8049619:	e8 97 fe ff ff       	call   80494b5 <explode_bomb>
 804961e:	8d 04 92             	lea    (%edx,%edx,4),%eax
 8049621:	c1 e0 04             	shl    $0x4,%eax
 8049624:	c6 84 01 1f d8 04 08 	movb   $0x0,0x804d81f(%ecx,%eax,1)
 804962b:	00 
 804962c:	83 c2 01             	add    $0x1,%edx
 804962f:	89 15 08 d8 04 08    	mov    %edx,0x804d808
 8049635:	89 d8                	mov    %ebx,%eax
 8049637:	83 c4 10             	add    $0x10,%esp
 804963a:	5b                   	pop    %ebx
 804963b:	5e                   	pop    %esi
 804963c:	5f                   	pop    %edi
 804963d:	c3                   	ret    

0804963e <phase_defused>:
 804963e:	83 ec 1c             	sub    $0x1c,%esp
 8049641:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8049648:	e8 5a fd ff ff       	call   80493a7 <send_msg>
 804964d:	83 3d 08 d8 04 08 09 	cmpl   $0x9,0x804d808
 8049654:	75 18                	jne    804966e <phase_defused+0x30>
 8049656:	c7 04 24 90 a6 04 08 	movl   $0x804a690,(%esp)
 804965d:	e8 1e f2 ff ff       	call   8048880 <puts@plt>
 8049662:	c7 04 24 bc a6 04 08 	movl   $0x804a6bc,(%esp)
 8049669:	e8 12 f2 ff ff       	call   8048880 <puts@plt>
 804966e:	83 c4 1c             	add    $0x1c,%esp
 8049671:	c3                   	ret    
 8049672:	66 90                	xchg   %ax,%ax
 8049674:	66 90                	xchg   %ax,%ax
 8049676:	66 90                	xchg   %ax,%ax
 8049678:	66 90                	xchg   %ax,%ax
 804967a:	66 90                	xchg   %ax,%ax
 804967c:	66 90                	xchg   %ax,%ax
 804967e:	66 90                	xchg   %ax,%ax

08049680 <sigalrm_handler>:
 8049680:	83 ec 1c             	sub    $0x1c,%esp
 8049683:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 804968a:	00 
 804968b:	c7 44 24 08 70 ab 04 	movl   $0x804ab70,0x8(%esp)
 8049692:	08 
 8049693:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 804969a:	00 
 804969b:	a1 e0 d7 04 08       	mov    0x804d7e0,%eax
 80496a0:	89 04 24             	mov    %eax,(%esp)
 80496a3:	e8 a8 f2 ff ff       	call   8048950 <__fprintf_chk@plt>
 80496a8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 80496af:	e8 0c f2 ff ff       	call   80488c0 <exit@plt>

080496b4 <rio_readlineb>:
 80496b4:	55                   	push   %ebp
 80496b5:	57                   	push   %edi
 80496b6:	56                   	push   %esi
 80496b7:	53                   	push   %ebx
 80496b8:	83 ec 3c             	sub    $0x3c,%esp
 80496bb:	89 d5                	mov    %edx,%ebp
 80496bd:	83 f9 01             	cmp    $0x1,%ecx
 80496c0:	0f 86 d0 00 00 00    	jbe    8049796 <rio_readlineb+0xe2>
 80496c6:	89 c3                	mov    %eax,%ebx
 80496c8:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
 80496cc:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
 80496d3:	00 
 80496d4:	8d 78 0c             	lea    0xc(%eax),%edi
 80496d7:	eb 33                	jmp    804970c <rio_readlineb+0x58>
 80496d9:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
 80496e0:	00 
 80496e1:	89 7c 24 04          	mov    %edi,0x4(%esp)
 80496e5:	8b 03                	mov    (%ebx),%eax
 80496e7:	89 04 24             	mov    %eax,(%esp)
 80496ea:	e8 e1 f0 ff ff       	call   80487d0 <read@plt>
 80496ef:	89 43 04             	mov    %eax,0x4(%ebx)
 80496f2:	85 c0                	test   %eax,%eax
 80496f4:	79 0f                	jns    8049705 <rio_readlineb+0x51>
 80496f6:	e8 25 f2 ff ff       	call   8048920 <__errno_location@plt>
 80496fb:	83 38 04             	cmpl   $0x4,(%eax)
 80496fe:	74 0c                	je     804970c <rio_readlineb+0x58>
 8049700:	e9 a3 00 00 00       	jmp    80497a8 <rio_readlineb+0xf4>
 8049705:	85 c0                	test   %eax,%eax
 8049707:	74 6e                	je     8049777 <rio_readlineb+0xc3>
 8049709:	89 7b 08             	mov    %edi,0x8(%ebx)
 804970c:	8b 73 04             	mov    0x4(%ebx),%esi
 804970f:	85 f6                	test   %esi,%esi
 8049711:	7e c6                	jle    80496d9 <rio_readlineb+0x25>
 8049713:	85 f6                	test   %esi,%esi
 8049715:	0f 95 c0             	setne  %al
 8049718:	0f b6 c0             	movzbl %al,%eax
 804971b:	89 44 24 14          	mov    %eax,0x14(%esp)
 804971f:	8b 4b 08             	mov    0x8(%ebx),%ecx
 8049722:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 8049729:	00 
 804972a:	89 44 24 08          	mov    %eax,0x8(%esp)
 804972e:	89 4c 24 18          	mov    %ecx,0x18(%esp)
 8049732:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8049736:	8d 54 24 2f          	lea    0x2f(%esp),%edx
 804973a:	89 14 24             	mov    %edx,(%esp)
 804973d:	e8 5e f1 ff ff       	call   80488a0 <__memcpy_chk@plt>
 8049742:	8b 4c 24 18          	mov    0x18(%esp),%ecx
 8049746:	8b 54 24 14          	mov    0x14(%esp),%edx
 804974a:	01 d1                	add    %edx,%ecx
 804974c:	89 4b 08             	mov    %ecx,0x8(%ebx)
 804974f:	29 d6                	sub    %edx,%esi
 8049751:	89 73 04             	mov    %esi,0x4(%ebx)
 8049754:	83 fa 01             	cmp    $0x1,%edx
 8049757:	75 11                	jne    804976a <rio_readlineb+0xb6>
 8049759:	83 c5 01             	add    $0x1,%ebp
 804975c:	0f b6 44 24 2f       	movzbl 0x2f(%esp),%eax
 8049761:	88 45 ff             	mov    %al,-0x1(%ebp)
 8049764:	3c 0a                	cmp    $0xa,%al
 8049766:	75 1a                	jne    8049782 <rio_readlineb+0xce>
 8049768:	eb 34                	jmp    804979e <rio_readlineb+0xea>
 804976a:	83 7c 24 14 00       	cmpl   $0x0,0x14(%esp)
 804976f:	75 3e                	jne    80497af <rio_readlineb+0xfb>
 8049771:	8b 44 24 10          	mov    0x10(%esp),%eax
 8049775:	eb 04                	jmp    804977b <rio_readlineb+0xc7>
 8049777:	8b 44 24 10          	mov    0x10(%esp),%eax
 804977b:	83 f8 01             	cmp    $0x1,%eax
 804977e:	75 1e                	jne    804979e <rio_readlineb+0xea>
 8049780:	eb 34                	jmp    80497b6 <rio_readlineb+0x102>
 8049782:	83 44 24 10 01       	addl   $0x1,0x10(%esp)
 8049787:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 804978b:	39 44 24 10          	cmp    %eax,0x10(%esp)
 804978f:	74 0d                	je     804979e <rio_readlineb+0xea>
 8049791:	e9 76 ff ff ff       	jmp    804970c <rio_readlineb+0x58>
 8049796:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
 804979d:	00 
 804979e:	c6 45 00 00          	movb   $0x0,0x0(%ebp)
 80497a2:	8b 44 24 10          	mov    0x10(%esp),%eax
 80497a6:	eb 13                	jmp    80497bb <rio_readlineb+0x107>
 80497a8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 80497ad:	eb 0c                	jmp    80497bb <rio_readlineb+0x107>
 80497af:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 80497b4:	eb 05                	jmp    80497bb <rio_readlineb+0x107>
 80497b6:	b8 00 00 00 00       	mov    $0x0,%eax
 80497bb:	83 c4 3c             	add    $0x3c,%esp
 80497be:	5b                   	pop    %ebx
 80497bf:	5e                   	pop    %esi
 80497c0:	5f                   	pop    %edi
 80497c1:	5d                   	pop    %ebp
 80497c2:	c3                   	ret    

080497c3 <submitr>:
 80497c3:	55                   	push   %ebp
 80497c4:	57                   	push   %edi
 80497c5:	56                   	push   %esi
 80497c6:	53                   	push   %ebx
 80497c7:	81 ec 7c a0 00 00    	sub    $0xa07c,%esp
 80497cd:	8b b4 24 90 a0 00 00 	mov    0xa090(%esp),%esi
 80497d4:	8b 84 24 98 a0 00 00 	mov    0xa098(%esp),%eax
 80497db:	89 44 24 28          	mov    %eax,0x28(%esp)
 80497df:	8b 84 24 9c a0 00 00 	mov    0xa09c(%esp),%eax
 80497e6:	89 44 24 2c          	mov    %eax,0x2c(%esp)
 80497ea:	8b 84 24 a0 a0 00 00 	mov    0xa0a0(%esp),%eax
 80497f1:	89 44 24 30          	mov    %eax,0x30(%esp)
 80497f5:	8b 9c 24 a4 a0 00 00 	mov    0xa0a4(%esp),%ebx
 80497fc:	8b 84 24 a8 a0 00 00 	mov    0xa0a8(%esp),%eax
 8049803:	89 44 24 34          	mov    %eax,0x34(%esp)
 8049807:	65 a1 14 00 00 00    	mov    %gs:0x14,%eax
 804980d:	89 84 24 6c a0 00 00 	mov    %eax,0xa06c(%esp)
 8049814:	31 c0                	xor    %eax,%eax
 8049816:	c7 44 24 4c 00 00 00 	movl   $0x0,0x4c(%esp)
 804981d:	00 
 804981e:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 8049825:	00 
 8049826:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 804982d:	00 
 804982e:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 8049835:	e8 06 f1 ff ff       	call   8048940 <socket@plt>
 804983a:	89 c5                	mov    %eax,%ebp
 804983c:	85 c0                	test   %eax,%eax
 804983e:	79 52                	jns    8049892 <submitr+0xcf>
 8049840:	8b 44 24 34          	mov    0x34(%esp),%eax
 8049844:	c7 00 45 72 72 6f    	movl   $0x6f727245,(%eax)
 804984a:	c7 40 04 72 3a 20 43 	movl   $0x43203a72,0x4(%eax)
 8049851:	c7 40 08 6c 69 65 6e 	movl   $0x6e65696c,0x8(%eax)
 8049858:	c7 40 0c 74 20 75 6e 	movl   $0x6e752074,0xc(%eax)
 804985f:	c7 40 10 61 62 6c 65 	movl   $0x656c6261,0x10(%eax)
 8049866:	c7 40 14 20 74 6f 20 	movl   $0x206f7420,0x14(%eax)
 804986d:	c7 40 18 63 72 65 61 	movl   $0x61657263,0x18(%eax)
 8049874:	c7 40 1c 74 65 20 73 	movl   $0x73206574,0x1c(%eax)
 804987b:	c7 40 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%eax)
 8049882:	66 c7 40 24 74 00    	movw   $0x74,0x24(%eax)
 8049888:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804988d:	e9 37 06 00 00       	jmp    8049ec9 <submitr+0x706>
 8049892:	89 34 24             	mov    %esi,(%esp)
 8049895:	e8 c6 f0 ff ff       	call   8048960 <gethostbyname@plt>
 804989a:	85 c0                	test   %eax,%eax
 804989c:	75 6c                	jne    804990a <submitr+0x147>
 804989e:	8b 44 24 34          	mov    0x34(%esp),%eax
 80498a2:	c7 00 45 72 72 6f    	movl   $0x6f727245,(%eax)
 80498a8:	c7 40 04 72 3a 20 44 	movl   $0x44203a72,0x4(%eax)
 80498af:	c7 40 08 4e 53 20 69 	movl   $0x6920534e,0x8(%eax)
 80498b6:	c7 40 0c 73 20 75 6e 	movl   $0x6e752073,0xc(%eax)
 80498bd:	c7 40 10 61 62 6c 65 	movl   $0x656c6261,0x10(%eax)
 80498c4:	c7 40 14 20 74 6f 20 	movl   $0x206f7420,0x14(%eax)
 80498cb:	c7 40 18 72 65 73 6f 	movl   $0x6f736572,0x18(%eax)
 80498d2:	c7 40 1c 6c 76 65 20 	movl   $0x2065766c,0x1c(%eax)
 80498d9:	c7 40 20 73 65 72 76 	movl   $0x76726573,0x20(%eax)
 80498e0:	c7 40 24 65 72 20 61 	movl   $0x61207265,0x24(%eax)
 80498e7:	c7 40 28 64 64 72 65 	movl   $0x65726464,0x28(%eax)
 80498ee:	66 c7 40 2c 73 73    	movw   $0x7373,0x2c(%eax)
 80498f4:	c6 40 2e 00          	movb   $0x0,0x2e(%eax)
 80498f8:	89 2c 24             	mov    %ebp,(%esp)
 80498fb:	e8 90 f0 ff ff       	call   8048990 <close@plt>
 8049900:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049905:	e9 bf 05 00 00       	jmp    8049ec9 <submitr+0x706>
 804990a:	8d 74 24 50          	lea    0x50(%esp),%esi
 804990e:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%esp)
 8049915:	00 
 8049916:	c7 44 24 54 00 00 00 	movl   $0x0,0x54(%esp)
 804991d:	00 
 804991e:	c7 44 24 58 00 00 00 	movl   $0x0,0x58(%esp)
 8049925:	00 
 8049926:	c7 44 24 5c 00 00 00 	movl   $0x0,0x5c(%esp)
 804992d:	00 
 804992e:	66 c7 44 24 50 02 00 	movw   $0x2,0x50(%esp)
 8049935:	c7 44 24 0c 0c 00 00 	movl   $0xc,0xc(%esp)
 804993c:	00 
 804993d:	8b 50 0c             	mov    0xc(%eax),%edx
 8049940:	89 54 24 08          	mov    %edx,0x8(%esp)
 8049944:	8b 40 10             	mov    0x10(%eax),%eax
 8049947:	8b 00                	mov    (%eax),%eax
 8049949:	89 44 24 04          	mov    %eax,0x4(%esp)
 804994d:	8d 44 24 54          	lea    0x54(%esp),%eax
 8049951:	89 04 24             	mov    %eax,(%esp)
 8049954:	e8 37 ef ff ff       	call   8048890 <__memmove_chk@plt>
 8049959:	0f b7 84 24 94 a0 00 	movzwl 0xa094(%esp),%eax
 8049960:	00 
 8049961:	66 c1 c8 08          	ror    $0x8,%ax
 8049965:	66 89 44 24 52       	mov    %ax,0x52(%esp)
 804996a:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 8049971:	00 
 8049972:	89 74 24 04          	mov    %esi,0x4(%esp)
 8049976:	89 2c 24             	mov    %ebp,(%esp)
 8049979:	e8 02 f0 ff ff       	call   8048980 <connect@plt>
 804997e:	85 c0                	test   %eax,%eax
 8049980:	79 5e                	jns    80499e0 <submitr+0x21d>
 8049982:	8b 44 24 34          	mov    0x34(%esp),%eax
 8049986:	c7 00 45 72 72 6f    	movl   $0x6f727245,(%eax)
 804998c:	c7 40 04 72 3a 20 55 	movl   $0x55203a72,0x4(%eax)
 8049993:	c7 40 08 6e 61 62 6c 	movl   $0x6c62616e,0x8(%eax)
 804999a:	c7 40 0c 65 20 74 6f 	movl   $0x6f742065,0xc(%eax)
 80499a1:	c7 40 10 20 63 6f 6e 	movl   $0x6e6f6320,0x10(%eax)
 80499a8:	c7 40 14 6e 65 63 74 	movl   $0x7463656e,0x14(%eax)
 80499af:	c7 40 18 20 74 6f 20 	movl   $0x206f7420,0x18(%eax)
 80499b6:	c7 40 1c 74 68 65 20 	movl   $0x20656874,0x1c(%eax)
 80499bd:	c7 40 20 73 65 72 76 	movl   $0x76726573,0x20(%eax)
 80499c4:	66 c7 40 24 65 72    	movw   $0x7265,0x24(%eax)
 80499ca:	c6 40 26 00          	movb   $0x0,0x26(%eax)
 80499ce:	89 2c 24             	mov    %ebp,(%esp)
 80499d1:	e8 ba ef ff ff       	call   8048990 <close@plt>
 80499d6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 80499db:	e9 e9 04 00 00       	jmp    8049ec9 <submitr+0x706>
 80499e0:	ba ff ff ff ff       	mov    $0xffffffff,%edx
 80499e5:	89 df                	mov    %ebx,%edi
 80499e7:	b8 00 00 00 00       	mov    $0x0,%eax
 80499ec:	89 d1                	mov    %edx,%ecx
 80499ee:	f2 ae                	repnz scas %es:(%edi),%al
 80499f0:	f7 d1                	not    %ecx
 80499f2:	89 ce                	mov    %ecx,%esi
 80499f4:	8b 7c 24 28          	mov    0x28(%esp),%edi
 80499f8:	89 d1                	mov    %edx,%ecx
 80499fa:	f2 ae                	repnz scas %es:(%edi),%al
 80499fc:	89 4c 24 38          	mov    %ecx,0x38(%esp)
 8049a00:	8b 7c 24 2c          	mov    0x2c(%esp),%edi
 8049a04:	89 d1                	mov    %edx,%ecx
 8049a06:	f2 ae                	repnz scas %es:(%edi),%al
 8049a08:	f7 d1                	not    %ecx
 8049a0a:	89 4c 24 3c          	mov    %ecx,0x3c(%esp)
 8049a0e:	8b 7c 24 30          	mov    0x30(%esp),%edi
 8049a12:	89 d1                	mov    %edx,%ecx
 8049a14:	f2 ae                	repnz scas %es:(%edi),%al
 8049a16:	8b 44 24 3c          	mov    0x3c(%esp),%eax
 8049a1a:	2b 44 24 38          	sub    0x38(%esp),%eax
 8049a1e:	29 c8                	sub    %ecx,%eax
 8049a20:	89 c2                	mov    %eax,%edx
 8049a22:	8d 44 76 fd          	lea    -0x3(%esi,%esi,2),%eax
 8049a26:	8d 44 02 7b          	lea    0x7b(%edx,%eax,1),%eax
 8049a2a:	3d 00 20 00 00       	cmp    $0x2000,%eax
 8049a2f:	76 77                	jbe    8049aa8 <submitr+0x2e5>
 8049a31:	8b 44 24 34          	mov    0x34(%esp),%eax
 8049a35:	c7 00 45 72 72 6f    	movl   $0x6f727245,(%eax)
 8049a3b:	c7 40 04 72 3a 20 52 	movl   $0x52203a72,0x4(%eax)
 8049a42:	c7 40 08 65 73 75 6c 	movl   $0x6c757365,0x8(%eax)
 8049a49:	c7 40 0c 74 20 73 74 	movl   $0x74732074,0xc(%eax)
 8049a50:	c7 40 10 72 69 6e 67 	movl   $0x676e6972,0x10(%eax)
 8049a57:	c7 40 14 20 74 6f 6f 	movl   $0x6f6f7420,0x14(%eax)
 8049a5e:	c7 40 18 20 6c 61 72 	movl   $0x72616c20,0x18(%eax)
 8049a65:	c7 40 1c 67 65 2e 20 	movl   $0x202e6567,0x1c(%eax)
 8049a6c:	c7 40 20 49 6e 63 72 	movl   $0x72636e49,0x20(%eax)
 8049a73:	c7 40 24 65 61 73 65 	movl   $0x65736165,0x24(%eax)
 8049a7a:	c7 40 28 20 53 55 42 	movl   $0x42555320,0x28(%eax)
 8049a81:	c7 40 2c 4d 49 54 52 	movl   $0x5254494d,0x2c(%eax)
 8049a88:	c7 40 30 5f 4d 41 58 	movl   $0x58414d5f,0x30(%eax)
 8049a8f:	c7 40 34 42 55 46 00 	movl   $0x465542,0x34(%eax)
 8049a96:	89 2c 24             	mov    %ebp,(%esp)
 8049a99:	e8 f2 ee ff ff       	call   8048990 <close@plt>
 8049a9e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049aa3:	e9 21 04 00 00       	jmp    8049ec9 <submitr+0x706>
 8049aa8:	8d 94 24 60 20 00 00 	lea    0x2060(%esp),%edx
 8049aaf:	b9 00 08 00 00       	mov    $0x800,%ecx
 8049ab4:	b8 00 00 00 00       	mov    $0x0,%eax
 8049ab9:	89 d7                	mov    %edx,%edi
 8049abb:	f3 ab                	rep stos %eax,%es:(%edi)
 8049abd:	89 df                	mov    %ebx,%edi
 8049abf:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
 8049ac4:	f2 ae                	repnz scas %es:(%edi),%al
 8049ac6:	f7 d1                	not    %ecx
 8049ac8:	83 e9 01             	sub    $0x1,%ecx
 8049acb:	89 ce                	mov    %ecx,%esi
 8049acd:	0f 84 0f 04 00 00    	je     8049ee2 <submitr+0x71f>
 8049ad3:	89 d7                	mov    %edx,%edi
 8049ad5:	0f b6 03             	movzbl (%ebx),%eax
 8049ad8:	3c 2a                	cmp    $0x2a,%al
 8049ada:	74 21                	je     8049afd <submitr+0x33a>
 8049adc:	8d 50 d3             	lea    -0x2d(%eax),%edx
 8049adf:	80 fa 01             	cmp    $0x1,%dl
 8049ae2:	76 19                	jbe    8049afd <submitr+0x33a>
 8049ae4:	3c 5f                	cmp    $0x5f,%al
 8049ae6:	74 15                	je     8049afd <submitr+0x33a>
 8049ae8:	8d 50 d0             	lea    -0x30(%eax),%edx
 8049aeb:	80 fa 09             	cmp    $0x9,%dl
 8049aee:	76 0d                	jbe    8049afd <submitr+0x33a>
 8049af0:	89 c2                	mov    %eax,%edx
 8049af2:	83 e2 df             	and    $0xffffffdf,%edx
 8049af5:	83 ea 41             	sub    $0x41,%edx
 8049af8:	80 fa 19             	cmp    $0x19,%dl
 8049afb:	77 07                	ja     8049b04 <submitr+0x341>
 8049afd:	8d 57 01             	lea    0x1(%edi),%edx
 8049b00:	88 07                	mov    %al,(%edi)
 8049b02:	eb 6d                	jmp    8049b71 <submitr+0x3ae>
 8049b04:	3c 20                	cmp    $0x20,%al
 8049b06:	75 08                	jne    8049b10 <submitr+0x34d>
 8049b08:	8d 57 01             	lea    0x1(%edi),%edx
 8049b0b:	c6 07 2b             	movb   $0x2b,(%edi)
 8049b0e:	eb 61                	jmp    8049b71 <submitr+0x3ae>
 8049b10:	8d 50 e0             	lea    -0x20(%eax),%edx
 8049b13:	80 fa 5f             	cmp    $0x5f,%dl
 8049b16:	76 08                	jbe    8049b20 <submitr+0x35d>
 8049b18:	3c 09                	cmp    $0x9,%al
 8049b1a:	0f 85 2d 04 00 00    	jne    8049f4d <submitr+0x78a>
 8049b20:	0f b6 c0             	movzbl %al,%eax
 8049b23:	89 44 24 10          	mov    %eax,0x10(%esp)
 8049b27:	c7 44 24 0c 7c ac 04 	movl   $0x804ac7c,0xc(%esp)
 8049b2e:	08 
 8049b2f:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
 8049b36:	00 
 8049b37:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8049b3e:	00 
 8049b3f:	8d 84 24 60 80 00 00 	lea    0x8060(%esp),%eax
 8049b46:	89 04 24             	mov    %eax,(%esp)
 8049b49:	e8 62 ee ff ff       	call   80489b0 <__sprintf_chk@plt>
 8049b4e:	0f b6 84 24 60 80 00 	movzbl 0x8060(%esp),%eax
 8049b55:	00 
 8049b56:	88 07                	mov    %al,(%edi)
 8049b58:	0f b6 84 24 61 80 00 	movzbl 0x8061(%esp),%eax
 8049b5f:	00 
 8049b60:	88 47 01             	mov    %al,0x1(%edi)
 8049b63:	8d 57 03             	lea    0x3(%edi),%edx
 8049b66:	0f b6 84 24 62 80 00 	movzbl 0x8062(%esp),%eax
 8049b6d:	00 
 8049b6e:	88 47 02             	mov    %al,0x2(%edi)
 8049b71:	83 c3 01             	add    $0x1,%ebx
 8049b74:	83 ee 01             	sub    $0x1,%esi
 8049b77:	0f 84 65 03 00 00    	je     8049ee2 <submitr+0x71f>
 8049b7d:	89 d7                	mov    %edx,%edi
 8049b7f:	e9 51 ff ff ff       	jmp    8049ad5 <submitr+0x312>
 8049b84:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 8049b88:	89 74 24 04          	mov    %esi,0x4(%esp)
 8049b8c:	89 2c 24             	mov    %ebp,(%esp)
 8049b8f:	e8 4c ed ff ff       	call   80488e0 <write@plt>
 8049b94:	85 c0                	test   %eax,%eax
 8049b96:	7f 0f                	jg     8049ba7 <submitr+0x3e4>
 8049b98:	e8 83 ed ff ff       	call   8048920 <__errno_location@plt>
 8049b9d:	83 38 04             	cmpl   $0x4,(%eax)
 8049ba0:	75 0f                	jne    8049bb1 <submitr+0x3ee>
 8049ba2:	b8 00 00 00 00       	mov    $0x0,%eax
 8049ba7:	01 c6                	add    %eax,%esi
 8049ba9:	29 c3                	sub    %eax,%ebx
 8049bab:	75 d7                	jne    8049b84 <submitr+0x3c1>
 8049bad:	85 ff                	test   %edi,%edi
 8049baf:	79 62                	jns    8049c13 <submitr+0x450>
 8049bb1:	8b 44 24 34          	mov    0x34(%esp),%eax
 8049bb5:	c7 00 45 72 72 6f    	movl   $0x6f727245,(%eax)
 8049bbb:	c7 40 04 72 3a 20 43 	movl   $0x43203a72,0x4(%eax)
 8049bc2:	c7 40 08 6c 69 65 6e 	movl   $0x6e65696c,0x8(%eax)
 8049bc9:	c7 40 0c 74 20 75 6e 	movl   $0x6e752074,0xc(%eax)
 8049bd0:	c7 40 10 61 62 6c 65 	movl   $0x656c6261,0x10(%eax)
 8049bd7:	c7 40 14 20 74 6f 20 	movl   $0x206f7420,0x14(%eax)
 8049bde:	c7 40 18 77 72 69 74 	movl   $0x74697277,0x18(%eax)
 8049be5:	c7 40 1c 65 20 74 6f 	movl   $0x6f742065,0x1c(%eax)
 8049bec:	c7 40 20 20 74 68 65 	movl   $0x65687420,0x20(%eax)
 8049bf3:	c7 40 24 20 73 65 72 	movl   $0x72657320,0x24(%eax)
 8049bfa:	c7 40 28 76 65 72 00 	movl   $0x726576,0x28(%eax)
 8049c01:	89 2c 24             	mov    %ebp,(%esp)
 8049c04:	e8 87 ed ff ff       	call   8048990 <close@plt>
 8049c09:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049c0e:	e9 b6 02 00 00       	jmp    8049ec9 <submitr+0x706>
 8049c13:	89 ac 24 60 80 00 00 	mov    %ebp,0x8060(%esp)
 8049c1a:	c7 84 24 64 80 00 00 	movl   $0x0,0x8064(%esp)
 8049c21:	00 00 00 00 
 8049c25:	8d 84 24 6c 80 00 00 	lea    0x806c(%esp),%eax
 8049c2c:	89 84 24 68 80 00 00 	mov    %eax,0x8068(%esp)
 8049c33:	b9 00 20 00 00       	mov    $0x2000,%ecx
 8049c38:	8d 54 24 60          	lea    0x60(%esp),%edx
 8049c3c:	8d 84 24 60 80 00 00 	lea    0x8060(%esp),%eax
 8049c43:	e8 6c fa ff ff       	call   80496b4 <rio_readlineb>
 8049c48:	85 c0                	test   %eax,%eax
 8049c4a:	7f 76                	jg     8049cc2 <submitr+0x4ff>
 8049c4c:	8b 44 24 34          	mov    0x34(%esp),%eax
 8049c50:	c7 00 45 72 72 6f    	movl   $0x6f727245,(%eax)
 8049c56:	c7 40 04 72 3a 20 43 	movl   $0x43203a72,0x4(%eax)
 8049c5d:	c7 40 08 6c 69 65 6e 	movl   $0x6e65696c,0x8(%eax)
 8049c64:	c7 40 0c 74 20 75 6e 	movl   $0x6e752074,0xc(%eax)
 8049c6b:	c7 40 10 61 62 6c 65 	movl   $0x656c6261,0x10(%eax)
 8049c72:	c7 40 14 20 74 6f 20 	movl   $0x206f7420,0x14(%eax)
 8049c79:	c7 40 18 72 65 61 64 	movl   $0x64616572,0x18(%eax)
 8049c80:	c7 40 1c 20 66 69 72 	movl   $0x72696620,0x1c(%eax)
 8049c87:	c7 40 20 73 74 20 68 	movl   $0x68207473,0x20(%eax)
 8049c8e:	c7 40 24 65 61 64 65 	movl   $0x65646165,0x24(%eax)
 8049c95:	c7 40 28 72 20 66 72 	movl   $0x72662072,0x28(%eax)
 8049c9c:	c7 40 2c 6f 6d 20 73 	movl   $0x73206d6f,0x2c(%eax)
 8049ca3:	c7 40 30 65 72 76 65 	movl   $0x65767265,0x30(%eax)
 8049caa:	66 c7 40 34 72 00    	movw   $0x72,0x34(%eax)
 8049cb0:	89 2c 24             	mov    %ebp,(%esp)
 8049cb3:	e8 d8 ec ff ff       	call   8048990 <close@plt>
 8049cb8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049cbd:	e9 07 02 00 00       	jmp    8049ec9 <submitr+0x706>
 8049cc2:	8d 84 24 60 60 00 00 	lea    0x6060(%esp),%eax
 8049cc9:	89 44 24 10          	mov    %eax,0x10(%esp)
 8049ccd:	8d 44 24 4c          	lea    0x4c(%esp),%eax
 8049cd1:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049cd5:	8d 84 24 60 40 00 00 	lea    0x4060(%esp),%eax
 8049cdc:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049ce0:	c7 44 24 04 83 ac 04 	movl   $0x804ac83,0x4(%esp)
 8049ce7:	08 
 8049ce8:	8d 44 24 60          	lea    0x60(%esp),%eax
 8049cec:	89 04 24             	mov    %eax,(%esp)
 8049cef:	e8 0c ec ff ff       	call   8048900 <__isoc99_sscanf@plt>
 8049cf4:	8b 44 24 4c          	mov    0x4c(%esp),%eax
 8049cf8:	3d c8 00 00 00       	cmp    $0xc8,%eax
 8049cfd:	0f 84 cb 00 00 00    	je     8049dce <submitr+0x60b>
 8049d03:	8d 94 24 60 60 00 00 	lea    0x6060(%esp),%edx
 8049d0a:	89 54 24 14          	mov    %edx,0x14(%esp)
 8049d0e:	89 44 24 10          	mov    %eax,0x10(%esp)
 8049d12:	c7 44 24 0c 94 ab 04 	movl   $0x804ab94,0xc(%esp)
 8049d19:	08 
 8049d1a:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
 8049d21:	ff 
 8049d22:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8049d29:	00 
 8049d2a:	8b 44 24 34          	mov    0x34(%esp),%eax
 8049d2e:	89 04 24             	mov    %eax,(%esp)
 8049d31:	e8 7a ec ff ff       	call   80489b0 <__sprintf_chk@plt>
 8049d36:	89 2c 24             	mov    %ebp,(%esp)
 8049d39:	e8 52 ec ff ff       	call   8048990 <close@plt>
 8049d3e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049d43:	e9 81 01 00 00       	jmp    8049ec9 <submitr+0x706>
 8049d48:	b9 00 20 00 00       	mov    $0x2000,%ecx
 8049d4d:	8d 54 24 60          	lea    0x60(%esp),%edx
 8049d51:	8d 84 24 60 80 00 00 	lea    0x8060(%esp),%eax
 8049d58:	e8 57 f9 ff ff       	call   80496b4 <rio_readlineb>
 8049d5d:	85 c0                	test   %eax,%eax
 8049d5f:	7f 6d                	jg     8049dce <submitr+0x60b>
 8049d61:	8b 44 24 34          	mov    0x34(%esp),%eax
 8049d65:	c7 00 45 72 72 6f    	movl   $0x6f727245,(%eax)
 8049d6b:	c7 40 04 72 3a 20 43 	movl   $0x43203a72,0x4(%eax)
 8049d72:	c7 40 08 6c 69 65 6e 	movl   $0x6e65696c,0x8(%eax)
 8049d79:	c7 40 0c 74 20 75 6e 	movl   $0x6e752074,0xc(%eax)
 8049d80:	c7 40 10 61 62 6c 65 	movl   $0x656c6261,0x10(%eax)
 8049d87:	c7 40 14 20 74 6f 20 	movl   $0x206f7420,0x14(%eax)
 8049d8e:	c7 40 18 72 65 61 64 	movl   $0x64616572,0x18(%eax)
 8049d95:	c7 40 1c 20 68 65 61 	movl   $0x61656820,0x1c(%eax)
 8049d9c:	c7 40 20 64 65 72 73 	movl   $0x73726564,0x20(%eax)
 8049da3:	c7 40 24 20 66 72 6f 	movl   $0x6f726620,0x24(%eax)
 8049daa:	c7 40 28 6d 20 73 65 	movl   $0x6573206d,0x28(%eax)
 8049db1:	c7 40 2c 72 76 65 72 	movl   $0x72657672,0x2c(%eax)
 8049db8:	c6 40 30 00          	movb   $0x0,0x30(%eax)
 8049dbc:	89 2c 24             	mov    %ebp,(%esp)
 8049dbf:	e8 cc eb ff ff       	call   8048990 <close@plt>
 8049dc4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049dc9:	e9 fb 00 00 00       	jmp    8049ec9 <submitr+0x706>
 8049dce:	80 7c 24 60 0d       	cmpb   $0xd,0x60(%esp)
 8049dd3:	0f 85 6f ff ff ff    	jne    8049d48 <submitr+0x585>
 8049dd9:	80 7c 24 61 0a       	cmpb   $0xa,0x61(%esp)
 8049dde:	0f 85 64 ff ff ff    	jne    8049d48 <submitr+0x585>
 8049de4:	80 7c 24 62 00       	cmpb   $0x0,0x62(%esp)
 8049de9:	0f 85 59 ff ff ff    	jne    8049d48 <submitr+0x585>
 8049def:	b9 00 20 00 00       	mov    $0x2000,%ecx
 8049df4:	8d 54 24 60          	lea    0x60(%esp),%edx
 8049df8:	8d 84 24 60 80 00 00 	lea    0x8060(%esp),%eax
 8049dff:	e8 b0 f8 ff ff       	call   80496b4 <rio_readlineb>
 8049e04:	85 c0                	test   %eax,%eax
 8049e06:	7f 74                	jg     8049e7c <submitr+0x6b9>
 8049e08:	8b 44 24 34          	mov    0x34(%esp),%eax
 8049e0c:	c7 00 45 72 72 6f    	movl   $0x6f727245,(%eax)
 8049e12:	c7 40 04 72 3a 20 43 	movl   $0x43203a72,0x4(%eax)
 8049e19:	c7 40 08 6c 69 65 6e 	movl   $0x6e65696c,0x8(%eax)
 8049e20:	c7 40 0c 74 20 75 6e 	movl   $0x6e752074,0xc(%eax)
 8049e27:	c7 40 10 61 62 6c 65 	movl   $0x656c6261,0x10(%eax)
 8049e2e:	c7 40 14 20 74 6f 20 	movl   $0x206f7420,0x14(%eax)
 8049e35:	c7 40 18 72 65 61 64 	movl   $0x64616572,0x18(%eax)
 8049e3c:	c7 40 1c 20 73 74 61 	movl   $0x61747320,0x1c(%eax)
 8049e43:	c7 40 20 74 75 73 20 	movl   $0x20737574,0x20(%eax)
 8049e4a:	c7 40 24 6d 65 73 73 	movl   $0x7373656d,0x24(%eax)
 8049e51:	c7 40 28 61 67 65 20 	movl   $0x20656761,0x28(%eax)
 8049e58:	c7 40 2c 66 72 6f 6d 	movl   $0x6d6f7266,0x2c(%eax)
 8049e5f:	c7 40 30 20 73 65 72 	movl   $0x72657320,0x30(%eax)
 8049e66:	c7 40 34 76 65 72 00 	movl   $0x726576,0x34(%eax)
 8049e6d:	89 2c 24             	mov    %ebp,(%esp)
 8049e70:	e8 1b eb ff ff       	call   8048990 <close@plt>
 8049e75:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049e7a:	eb 4d                	jmp    8049ec9 <submitr+0x706>
 8049e7c:	8d 44 24 60          	lea    0x60(%esp),%eax
 8049e80:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049e84:	8b 74 24 34          	mov    0x34(%esp),%esi
 8049e88:	89 34 24             	mov    %esi,(%esp)
 8049e8b:	e8 b0 e9 ff ff       	call   8048840 <strcpy@plt>
 8049e90:	89 2c 24             	mov    %ebp,(%esp)
 8049e93:	e8 f8 ea ff ff       	call   8048990 <close@plt>
 8049e98:	0f b6 06             	movzbl (%esi),%eax
 8049e9b:	ba 4f 00 00 00       	mov    $0x4f,%edx
 8049ea0:	29 c2                	sub    %eax,%edx
 8049ea2:	75 1b                	jne    8049ebf <submitr+0x6fc>
 8049ea4:	8b 44 24 34          	mov    0x34(%esp),%eax
 8049ea8:	0f b6 40 01          	movzbl 0x1(%eax),%eax
 8049eac:	ba 4b 00 00 00       	mov    $0x4b,%edx
 8049eb1:	29 c2                	sub    %eax,%edx
 8049eb3:	75 0a                	jne    8049ebf <submitr+0x6fc>
 8049eb5:	8b 44 24 34          	mov    0x34(%esp),%eax
 8049eb9:	0f b6 50 02          	movzbl 0x2(%eax),%edx
 8049ebd:	f7 da                	neg    %edx
 8049ebf:	85 d2                	test   %edx,%edx
 8049ec1:	0f 95 c0             	setne  %al
 8049ec4:	0f b6 c0             	movzbl %al,%eax
 8049ec7:	f7 d8                	neg    %eax
 8049ec9:	8b 8c 24 6c a0 00 00 	mov    0xa06c(%esp),%ecx
 8049ed0:	65 33 0d 14 00 00 00 	xor    %gs:0x14,%ecx
 8049ed7:	0f 84 ef 00 00 00    	je     8049fcc <submitr+0x809>
 8049edd:	e9 e5 00 00 00       	jmp    8049fc7 <submitr+0x804>
 8049ee2:	8d 84 24 60 20 00 00 	lea    0x2060(%esp),%eax
 8049ee9:	89 44 24 1c          	mov    %eax,0x1c(%esp)
 8049eed:	8b 44 24 30          	mov    0x30(%esp),%eax
 8049ef1:	89 44 24 18          	mov    %eax,0x18(%esp)
 8049ef5:	8b 44 24 2c          	mov    0x2c(%esp),%eax
 8049ef9:	89 44 24 14          	mov    %eax,0x14(%esp)
 8049efd:	8b 44 24 28          	mov    0x28(%esp),%eax
 8049f01:	89 44 24 10          	mov    %eax,0x10(%esp)
 8049f05:	c7 44 24 0c c4 ab 04 	movl   $0x804abc4,0xc(%esp)
 8049f0c:	08 
 8049f0d:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
 8049f14:	00 
 8049f15:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8049f1c:	00 
 8049f1d:	8d 7c 24 60          	lea    0x60(%esp),%edi
 8049f21:	89 3c 24             	mov    %edi,(%esp)
 8049f24:	e8 87 ea ff ff       	call   80489b0 <__sprintf_chk@plt>
 8049f29:	b8 00 00 00 00       	mov    $0x0,%eax
 8049f2e:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
 8049f33:	f2 ae                	repnz scas %es:(%edi),%al
 8049f35:	f7 d1                	not    %ecx
 8049f37:	83 e9 01             	sub    $0x1,%ecx
 8049f3a:	89 cf                	mov    %ecx,%edi
 8049f3c:	0f 84 d1 fc ff ff    	je     8049c13 <submitr+0x450>
 8049f42:	89 cb                	mov    %ecx,%ebx
 8049f44:	8d 74 24 60          	lea    0x60(%esp),%esi
 8049f48:	e9 37 fc ff ff       	jmp    8049b84 <submitr+0x3c1>
 8049f4d:	8b 4c 24 34          	mov    0x34(%esp),%ecx
 8049f51:	89 cf                	mov    %ecx,%edi
 8049f53:	be 10 ac 04 08       	mov    $0x804ac10,%esi
 8049f58:	b8 43 00 00 00       	mov    $0x43,%eax
 8049f5d:	f6 c1 01             	test   $0x1,%cl
 8049f60:	74 16                	je     8049f78 <submitr+0x7b5>
 8049f62:	0f b6 05 10 ac 04 08 	movzbl 0x804ac10,%eax
 8049f69:	88 01                	mov    %al,(%ecx)
 8049f6b:	8d 79 01             	lea    0x1(%ecx),%edi
 8049f6e:	be 11 ac 04 08       	mov    $0x804ac11,%esi
 8049f73:	b8 42 00 00 00       	mov    $0x42,%eax
 8049f78:	f7 c7 02 00 00 00    	test   $0x2,%edi
 8049f7e:	74 0f                	je     8049f8f <submitr+0x7cc>
 8049f80:	0f b7 16             	movzwl (%esi),%edx
 8049f83:	66 89 17             	mov    %dx,(%edi)
 8049f86:	83 c7 02             	add    $0x2,%edi
 8049f89:	83 c6 02             	add    $0x2,%esi
 8049f8c:	83 e8 02             	sub    $0x2,%eax
 8049f8f:	89 c1                	mov    %eax,%ecx
 8049f91:	c1 e9 02             	shr    $0x2,%ecx
 8049f94:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
 8049f96:	ba 00 00 00 00       	mov    $0x0,%edx
 8049f9b:	a8 02                	test   $0x2,%al
 8049f9d:	74 0b                	je     8049faa <submitr+0x7e7>
 8049f9f:	0f b7 16             	movzwl (%esi),%edx
 8049fa2:	66 89 17             	mov    %dx,(%edi)
 8049fa5:	ba 02 00 00 00       	mov    $0x2,%edx
 8049faa:	a8 01                	test   $0x1,%al
 8049fac:	74 07                	je     8049fb5 <submitr+0x7f2>
 8049fae:	0f b6 04 16          	movzbl (%esi,%edx,1),%eax
 8049fb2:	88 04 17             	mov    %al,(%edi,%edx,1)
 8049fb5:	89 2c 24             	mov    %ebp,(%esp)
 8049fb8:	e8 d3 e9 ff ff       	call   8048990 <close@plt>
 8049fbd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049fc2:	e9 02 ff ff ff       	jmp    8049ec9 <submitr+0x706>
 8049fc7:	e8 64 e8 ff ff       	call   8048830 <__stack_chk_fail@plt>
 8049fcc:	81 c4 7c a0 00 00    	add    $0xa07c,%esp
 8049fd2:	5b                   	pop    %ebx
 8049fd3:	5e                   	pop    %esi
 8049fd4:	5f                   	pop    %edi
 8049fd5:	5d                   	pop    %ebp
 8049fd6:	c3                   	ret    

08049fd7 <init_timeout>:
 8049fd7:	53                   	push   %ebx
 8049fd8:	83 ec 18             	sub    $0x18,%esp
 8049fdb:	8b 5c 24 20          	mov    0x20(%esp),%ebx
 8049fdf:	85 db                	test   %ebx,%ebx
 8049fe1:	74 26                	je     804a009 <init_timeout+0x32>
 8049fe3:	c7 44 24 04 80 96 04 	movl   $0x8049680,0x4(%esp)
 8049fea:	08 
 8049feb:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
 8049ff2:	e8 09 e8 ff ff       	call   8048800 <signal@plt>
 8049ff7:	85 db                	test   %ebx,%ebx
 8049ff9:	b8 00 00 00 00       	mov    $0x0,%eax
 8049ffe:	0f 48 d8             	cmovs  %eax,%ebx
 804a001:	89 1c 24             	mov    %ebx,(%esp)
 804a004:	e8 17 e8 ff ff       	call   8048820 <alarm@plt>
 804a009:	83 c4 18             	add    $0x18,%esp
 804a00c:	5b                   	pop    %ebx
 804a00d:	c3                   	ret    

0804a00e <init_driver>:
 804a00e:	57                   	push   %edi
 804a00f:	56                   	push   %esi
 804a010:	53                   	push   %ebx
 804a011:	83 ec 40             	sub    $0x40,%esp
 804a014:	8b 74 24 50          	mov    0x50(%esp),%esi
 804a018:	65 a1 14 00 00 00    	mov    %gs:0x14,%eax
 804a01e:	89 44 24 3c          	mov    %eax,0x3c(%esp)
 804a022:	31 c0                	xor    %eax,%eax
 804a024:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 804a02b:	00 
 804a02c:	c7 04 24 0d 00 00 00 	movl   $0xd,(%esp)
 804a033:	e8 c8 e7 ff ff       	call   8048800 <signal@plt>
 804a038:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 804a03f:	00 
 804a040:	c7 04 24 1d 00 00 00 	movl   $0x1d,(%esp)
 804a047:	e8 b4 e7 ff ff       	call   8048800 <signal@plt>
 804a04c:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 804a053:	00 
 804a054:	c7 04 24 1d 00 00 00 	movl   $0x1d,(%esp)
 804a05b:	e8 a0 e7 ff ff       	call   8048800 <signal@plt>
 804a060:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 804a067:	00 
 804a068:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 804a06f:	00 
 804a070:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 804a077:	e8 c4 e8 ff ff       	call   8048940 <socket@plt>
 804a07c:	89 c3                	mov    %eax,%ebx
 804a07e:	85 c0                	test   %eax,%eax
 804a080:	79 4e                	jns    804a0d0 <init_driver+0xc2>
 804a082:	c7 06 45 72 72 6f    	movl   $0x6f727245,(%esi)
 804a088:	c7 46 04 72 3a 20 43 	movl   $0x43203a72,0x4(%esi)
 804a08f:	c7 46 08 6c 69 65 6e 	movl   $0x6e65696c,0x8(%esi)
 804a096:	c7 46 0c 74 20 75 6e 	movl   $0x6e752074,0xc(%esi)
 804a09d:	c7 46 10 61 62 6c 65 	movl   $0x656c6261,0x10(%esi)
 804a0a4:	c7 46 14 20 74 6f 20 	movl   $0x206f7420,0x14(%esi)
 804a0ab:	c7 46 18 63 72 65 61 	movl   $0x61657263,0x18(%esi)
 804a0b2:	c7 46 1c 74 65 20 73 	movl   $0x73206574,0x1c(%esi)
 804a0b9:	c7 46 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%esi)
 804a0c0:	66 c7 46 24 74 00    	movw   $0x74,0x24(%esi)
 804a0c6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804a0cb:	e9 33 01 00 00       	jmp    804a203 <init_driver+0x1f5>
 804a0d0:	c7 04 24 59 ab 04 08 	movl   $0x804ab59,(%esp)
 804a0d7:	e8 84 e8 ff ff       	call   8048960 <gethostbyname@plt>
 804a0dc:	85 c0                	test   %eax,%eax
 804a0de:	75 68                	jne    804a148 <init_driver+0x13a>
 804a0e0:	c7 06 45 72 72 6f    	movl   $0x6f727245,(%esi)
 804a0e6:	c7 46 04 72 3a 20 44 	movl   $0x44203a72,0x4(%esi)
 804a0ed:	c7 46 08 4e 53 20 69 	movl   $0x6920534e,0x8(%esi)
 804a0f4:	c7 46 0c 73 20 75 6e 	movl   $0x6e752073,0xc(%esi)
 804a0fb:	c7 46 10 61 62 6c 65 	movl   $0x656c6261,0x10(%esi)
 804a102:	c7 46 14 20 74 6f 20 	movl   $0x206f7420,0x14(%esi)
 804a109:	c7 46 18 72 65 73 6f 	movl   $0x6f736572,0x18(%esi)
 804a110:	c7 46 1c 6c 76 65 20 	movl   $0x2065766c,0x1c(%esi)
 804a117:	c7 46 20 73 65 72 76 	movl   $0x76726573,0x20(%esi)
 804a11e:	c7 46 24 65 72 20 61 	movl   $0x61207265,0x24(%esi)
 804a125:	c7 46 28 64 64 72 65 	movl   $0x65726464,0x28(%esi)
 804a12c:	66 c7 46 2c 73 73    	movw   $0x7373,0x2c(%esi)
 804a132:	c6 46 2e 00          	movb   $0x0,0x2e(%esi)
 804a136:	89 1c 24             	mov    %ebx,(%esp)
 804a139:	e8 52 e8 ff ff       	call   8048990 <close@plt>
 804a13e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804a143:	e9 bb 00 00 00       	jmp    804a203 <init_driver+0x1f5>
 804a148:	8d 7c 24 2c          	lea    0x2c(%esp),%edi
 804a14c:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%esp)
 804a153:	00 
 804a154:	c7 44 24 30 00 00 00 	movl   $0x0,0x30(%esp)
 804a15b:	00 
 804a15c:	c7 44 24 34 00 00 00 	movl   $0x0,0x34(%esp)
 804a163:	00 
 804a164:	c7 44 24 38 00 00 00 	movl   $0x0,0x38(%esp)
 804a16b:	00 
 804a16c:	66 c7 44 24 2c 02 00 	movw   $0x2,0x2c(%esp)
 804a173:	c7 44 24 0c 0c 00 00 	movl   $0xc,0xc(%esp)
 804a17a:	00 
 804a17b:	8b 50 0c             	mov    0xc(%eax),%edx
 804a17e:	89 54 24 08          	mov    %edx,0x8(%esp)
 804a182:	8b 40 10             	mov    0x10(%eax),%eax
 804a185:	8b 00                	mov    (%eax),%eax
 804a187:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a18b:	8d 44 24 30          	lea    0x30(%esp),%eax
 804a18f:	89 04 24             	mov    %eax,(%esp)
 804a192:	e8 f9 e6 ff ff       	call   8048890 <__memmove_chk@plt>
 804a197:	66 c7 44 24 2e 43 31 	movw   $0x3143,0x2e(%esp)
 804a19e:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 804a1a5:	00 
 804a1a6:	89 7c 24 04          	mov    %edi,0x4(%esp)
 804a1aa:	89 1c 24             	mov    %ebx,(%esp)
 804a1ad:	e8 ce e7 ff ff       	call   8048980 <connect@plt>
 804a1b2:	85 c0                	test   %eax,%eax
 804a1b4:	79 37                	jns    804a1ed <init_driver+0x1df>
 804a1b6:	c7 44 24 10 59 ab 04 	movl   $0x804ab59,0x10(%esp)
 804a1bd:	08 
 804a1be:	c7 44 24 0c 54 ac 04 	movl   $0x804ac54,0xc(%esp)
 804a1c5:	08 
 804a1c6:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
 804a1cd:	ff 
 804a1ce:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 804a1d5:	00 
 804a1d6:	89 34 24             	mov    %esi,(%esp)
 804a1d9:	e8 d2 e7 ff ff       	call   80489b0 <__sprintf_chk@plt>
 804a1de:	89 1c 24             	mov    %ebx,(%esp)
 804a1e1:	e8 aa e7 ff ff       	call   8048990 <close@plt>
 804a1e6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804a1eb:	eb 16                	jmp    804a203 <init_driver+0x1f5>
 804a1ed:	89 1c 24             	mov    %ebx,(%esp)
 804a1f0:	e8 9b e7 ff ff       	call   8048990 <close@plt>
 804a1f5:	66 c7 06 4f 4b       	movw   $0x4b4f,(%esi)
 804a1fa:	c6 46 02 00          	movb   $0x0,0x2(%esi)
 804a1fe:	b8 00 00 00 00       	mov    $0x0,%eax
 804a203:	8b 4c 24 3c          	mov    0x3c(%esp),%ecx
 804a207:	65 33 0d 14 00 00 00 	xor    %gs:0x14,%ecx
 804a20e:	74 05                	je     804a215 <init_driver+0x207>
 804a210:	e8 1b e6 ff ff       	call   8048830 <__stack_chk_fail@plt>
 804a215:	83 c4 40             	add    $0x40,%esp
 804a218:	5b                   	pop    %ebx
 804a219:	5e                   	pop    %esi
 804a21a:	5f                   	pop    %edi
 804a21b:	c3                   	ret    

0804a21c <driver_post>:
 804a21c:	53                   	push   %ebx
 804a21d:	83 ec 28             	sub    $0x28,%esp
 804a220:	8b 44 24 30          	mov    0x30(%esp),%eax
 804a224:	8b 5c 24 3c          	mov    0x3c(%esp),%ebx
 804a228:	83 7c 24 38 00       	cmpl   $0x0,0x38(%esp)
 804a22d:	74 2c                	je     804a25b <driver_post+0x3f>
 804a22f:	8b 44 24 34          	mov    0x34(%esp),%eax
 804a233:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a237:	c7 44 24 04 94 ac 04 	movl   $0x804ac94,0x4(%esp)
 804a23e:	08 
 804a23f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804a246:	e8 e5 e6 ff ff       	call   8048930 <__printf_chk@plt>
 804a24b:	66 c7 03 4f 4b       	movw   $0x4b4f,(%ebx)
 804a250:	c6 43 02 00          	movb   $0x0,0x2(%ebx)
 804a254:	b8 00 00 00 00       	mov    $0x0,%eax
 804a259:	eb 4d                	jmp    804a2a8 <driver_post+0x8c>
 804a25b:	85 c0                	test   %eax,%eax
 804a25d:	74 3b                	je     804a29a <driver_post+0x7e>
 804a25f:	80 38 00             	cmpb   $0x0,(%eax)
 804a262:	74 36                	je     804a29a <driver_post+0x7e>
 804a264:	89 5c 24 18          	mov    %ebx,0x18(%esp)
 804a268:	8b 54 24 34          	mov    0x34(%esp),%edx
 804a26c:	89 54 24 14          	mov    %edx,0x14(%esp)
 804a270:	c7 44 24 10 ab ac 04 	movl   $0x804acab,0x10(%esp)
 804a277:	08 
 804a278:	89 44 24 0c          	mov    %eax,0xc(%esp)
 804a27c:	c7 44 24 08 b4 ac 04 	movl   $0x804acb4,0x8(%esp)
 804a283:	08 
 804a284:	c7 44 24 04 31 43 00 	movl   $0x4331,0x4(%esp)
 804a28b:	00 
 804a28c:	c7 04 24 59 ab 04 08 	movl   $0x804ab59,(%esp)
 804a293:	e8 2b f5 ff ff       	call   80497c3 <submitr>
 804a298:	eb 0e                	jmp    804a2a8 <driver_post+0x8c>
 804a29a:	66 c7 03 4f 4b       	movw   $0x4b4f,(%ebx)
 804a29f:	c6 43 02 00          	movb   $0x0,0x2(%ebx)
 804a2a3:	b8 00 00 00 00       	mov    $0x0,%eax
 804a2a8:	83 c4 28             	add    $0x28,%esp
 804a2ab:	5b                   	pop    %ebx
 804a2ac:	c3                   	ret    
 804a2ad:	66 90                	xchg   %ax,%ax
 804a2af:	90                   	nop

0804a2b0 <__libc_csu_init>:
 804a2b0:	55                   	push   %ebp
 804a2b1:	57                   	push   %edi
 804a2b2:	31 ff                	xor    %edi,%edi
 804a2b4:	56                   	push   %esi
 804a2b5:	53                   	push   %ebx
 804a2b6:	e8 35 e7 ff ff       	call   80489f0 <__x86.get_pc_thunk.bx>
 804a2bb:	81 c3 45 2d 00 00    	add    $0x2d45,%ebx
 804a2c1:	83 ec 1c             	sub    $0x1c,%esp
 804a2c4:	8b 6c 24 30          	mov    0x30(%esp),%ebp
 804a2c8:	8d b3 0c ff ff ff    	lea    -0xf4(%ebx),%esi
 804a2ce:	e8 bd e4 ff ff       	call   8048790 <_init>
 804a2d3:	8d 83 08 ff ff ff    	lea    -0xf8(%ebx),%eax
 804a2d9:	29 c6                	sub    %eax,%esi
 804a2db:	c1 fe 02             	sar    $0x2,%esi
 804a2de:	85 f6                	test   %esi,%esi
 804a2e0:	74 27                	je     804a309 <__libc_csu_init+0x59>
 804a2e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804a2e8:	8b 44 24 38          	mov    0x38(%esp),%eax
 804a2ec:	89 2c 24             	mov    %ebp,(%esp)
 804a2ef:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a2f3:	8b 44 24 34          	mov    0x34(%esp),%eax
 804a2f7:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a2fb:	ff 94 bb 08 ff ff ff 	call   *-0xf8(%ebx,%edi,4)
 804a302:	83 c7 01             	add    $0x1,%edi
 804a305:	39 f7                	cmp    %esi,%edi
 804a307:	75 df                	jne    804a2e8 <__libc_csu_init+0x38>
 804a309:	83 c4 1c             	add    $0x1c,%esp
 804a30c:	5b                   	pop    %ebx
 804a30d:	5e                   	pop    %esi
 804a30e:	5f                   	pop    %edi
 804a30f:	5d                   	pop    %ebp
 804a310:	c3                   	ret    
 804a311:	eb 0d                	jmp    804a320 <__libc_csu_fini>
 804a313:	90                   	nop
 804a314:	90                   	nop
 804a315:	90                   	nop
 804a316:	90                   	nop
 804a317:	90                   	nop
 804a318:	90                   	nop
 804a319:	90                   	nop
 804a31a:	90                   	nop
 804a31b:	90                   	nop
 804a31c:	90                   	nop
 804a31d:	90                   	nop
 804a31e:	90                   	nop
 804a31f:	90                   	nop

0804a320 <__libc_csu_fini>:
 804a320:	f3 c3                	repz ret 

Disassembly of section .fini:

0804a324 <_fini>:
 804a324:	53                   	push   %ebx
 804a325:	83 ec 08             	sub    $0x8,%esp
 804a328:	e8 c3 e6 ff ff       	call   80489f0 <__x86.get_pc_thunk.bx>
 804a32d:	81 c3 d3 2c 00 00    	add    $0x2cd3,%ebx
 804a333:	83 c4 08             	add    $0x8,%esp
 804a336:	5b                   	pop    %ebx
 804a337:	c3                   	ret