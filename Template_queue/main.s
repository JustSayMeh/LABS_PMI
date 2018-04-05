	.file	"main.c"
	.section .rdata,"dr"
.LC0:
	.ascii " %c \0"
	.text
	.globl	in_order_print
	.def	in_order_print;	.scl	2;	.type	32;	.endef
	.seh_proc	in_order_print
in_order_print:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L5
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L4
	movq	16(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edx
	leaq	.LC0(%rip), %rcx
	call	printf
	jmp	.L1
.L4:
	movl	$40, %ecx
	call	putchar
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	in_order_print
	movq	16(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edx
	leaq	.LC0(%rip), %rcx
	call	printf
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	in_order_print
	movl	$41, %ecx
	call	putchar
	jmp	.L1
.L5:
	nop
.L1:
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	pre_order_print
	.def	pre_order_print;	.scl	2;	.type	32;	.endef
	.seh_proc	pre_order_print
pre_order_print:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L9
	movq	16(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edx
	leaq	.LC0(%rip), %rcx
	call	printf
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	pre_order_print
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	pre_order_print
	jmp	.L6
.L9:
	nop
.L6:
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	post_order_print
	.def	post_order_print;	.scl	2;	.type	32;	.endef
	.seh_proc	post_order_print
post_order_print:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L13
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	post_order_print
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	post_order_print
	movq	16(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edx
	leaq	.LC0(%rip), %rcx
	call	printf
	jmp	.L10
.L13:
	nop
.L10:
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	call	__main
	call	build_three_inf
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	restructer
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	pre_order_print
	movl	$10, %ecx
	call	putchar
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	in_order_print
	movl	$10, %ecx
	call	putchar
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	post_order_print
	movl	$10, %ecx
	call	putchar
	movl	$0, %eax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (tdm64-1) 5.1.0"
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	putchar;	.scl	2;	.type	32;	.endef
	.def	build_three_inf;	.scl	2;	.type	32;	.endef
	.def	restructer;	.scl	2;	.type	32;	.endef
