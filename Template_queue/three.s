	.file	"three.c"
	.text
	.globl	cpy_three
	.def	cpy_three;	.scl	2;	.type	32;	.endef
	.seh_proc	cpy_three
cpy_three:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L2
	movl	$0, %eax
	jmp	.L3
.L2:
	call	new_three
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	cpy_three
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	16(%rbp), %rax
	movzbl	(%rax), %edx
	movq	-8(%rbp), %rax
	movb	%dl, (%rax)
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	cpy_three
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
.L3:
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	new_three
	.def	new_three;	.scl	2;	.type	32;	.endef
	.seh_proc	new_three
new_three:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movl	$24, %ecx
	call	malloc
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 16(%rax)
	movq	-8(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC0:
	.ascii "%c\0"
	.text
	.globl	build_three
	.def	build_three;	.scl	2;	.type	32;	.endef
	.seh_proc	build_three
build_three:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	leaq	-9(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC0(%rip), %rcx
	call	scanf
	movzbl	-9(%rbp), %eax
	movsbl	%al, %eax
	cmpl	$44, %eax
	je	.L8
	cmpl	$48, %eax
	je	.L9
	cmpl	$40, %eax
	jne	.L13
	call	new_three
	movq	%rax, -8(%rbp)
	leaq	-9(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC0(%rip), %rcx
	call	scanf
	movzbl	-9(%rbp), %edx
	movq	-8(%rbp), %rax
	movb	%dl, (%rax)
	call	build_three
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	call	build_three
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 16(%rax)
	leaq	-9(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC0(%rip), %rcx
	call	scanf
	movq	-8(%rbp), %rax
	jmp	.L6
.L9:
	movl	$0, %eax
	jmp	.L6
.L8:
	call	build_three
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	jmp	.L6
.L13:
.L6:
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	build_three_inf
	.def	build_three_inf;	.scl	2;	.type	32;	.endef
	.seh_proc	build_three_inf
build_three_inf:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	call	new_three
	movq	%rax, -8(%rbp)
	leaq	-9(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC0(%rip), %rcx
	call	scanf
	movzbl	-9(%rbp), %eax
	movsbl	%al, %eax
	cmpl	$40, %eax
	jne	.L19
	call	build_three_inf
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	leaq	-9(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC0(%rip), %rcx
	call	scanf
	movzbl	-9(%rbp), %edx
	movq	-8(%rbp), %rax
	movb	%dl, (%rax)
	call	build_three_inf
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 16(%rax)
	leaq	-9(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC0(%rip), %rcx
	call	scanf
	movq	-8(%rbp), %rax
	jmp	.L18
.L19:
	movzbl	-9(%rbp), %edx
	movq	-8(%rbp), %rax
	movb	%dl, (%rax)
	movq	-8(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
.L18:
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	bypass_width
	.def	bypass_width;	.scl	2;	.type	32;	.endef
	.seh_proc	bypass_width
bypass_width:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, %eax
	movq	%r8, 32(%rbp)
	movb	%al, 24(%rbp)
	movl	$1, -4(%rbp)
	movl	$0, -8(%rbp)
	movl	$0, -12(%rbp)
	movl	$-1, -16(%rbp)
	call	new_queue_bthreep
	movq	%rax, -24(%rbp)
	movq	16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	enqueue_bthreep
	jmp	.L21
.L26:
	movq	-24(%rbp), %rax
	leaq	16(%rbp), %rdx
	movq	%rax, %rcx
	call	dequeue_bthreep
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L22
	addl	$1, -12(%rbp)
	movq	16(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	enqueue_bthreep
.L22:
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L23
	addl	$1, -12(%rbp)
	movq	16(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	enqueue_bthreep
.L23:
	movq	16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	24(%rbp), %al
	jne	.L24
	movq	32(%rbp), %rax
	movl	-8(%rbp), %edx
	movl	%edx, (%rax)
	movl	$0, -16(%rbp)
.L24:
	subl	$1, -4(%rbp)
	cmpl	$0, -4(%rbp)
	jne	.L21
	movl	-12(%rbp), %eax
	movl	%eax, -4(%rbp)
	movl	$0, -12(%rbp)
	addl	$1, -8(%rbp)
.L21:
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	isEmpty_bthreep
	testl	%eax, %eax
	jne	.L25
	cmpl	$0, -16(%rbp)
	jne	.L26
.L25:
	movl	-16(%rbp), %eax
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	restructer
	.def	restructer;	.scl	2;	.type	32;	.endef
	.seh_proc	restructer
restructer:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	call	new_queue_bthreep
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	enqueue_bthreep
	jmp	.L29
.L35:
	movq	-8(%rbp), %rax
	leaq	16(%rbp), %rdx
	movq	%rax, %rcx
	call	dequeue_bthreep
	movq	16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$42, %al
	jne	.L30
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movzbl	(%rax), %eax
	cmpb	$43, %al
	je	.L31
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movzbl	(%rax), %eax
	cmpb	$45, %al
	jne	.L30
.L31:
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rcx
	call	cpy_three
	movq	%rax, -16(%rbp)
	call	new_three
	movq	%rax, -24(%rbp)
	movq	16(%rbp), %rax
	movzbl	(%rax), %edx
	movq	-24(%rbp), %rax
	movb	%dl, (%rax)
	movq	16(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	8(%rdx), %rdx
	movzbl	(%rdx), %edx
	movb	%dl, (%rax)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	-24(%rbp), %rdx
	movzbl	(%rdx), %edx
	movb	%dl, (%rax)
	movq	16(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	16(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	16(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 16(%rax)
	jmp	.L32
.L30:
	movq	16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$42, %al
	jne	.L32
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movzbl	(%rax), %eax
	cmpb	$43, %al
	je	.L33
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movzbl	(%rax), %eax
	cmpb	$45, %al
	jne	.L32
.L33:
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	cpy_three
	movq	%rax, -16(%rbp)
	call	new_three
	movq	%rax, -24(%rbp)
	movq	16(%rbp), %rax
	movzbl	(%rax), %edx
	movq	-24(%rbp), %rax
	movb	%dl, (%rax)
	movq	16(%rbp), %rax
	movq	16(%rbp), %rdx
	movq	16(%rdx), %rdx
	movzbl	(%rdx), %edx
	movb	%dl, (%rax)
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	-24(%rbp), %rdx
	movzbl	(%rdx), %edx
	movb	%dl, (%rax)
	movq	16(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	16(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 8(%rax)
.L32:
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L34
	movq	16(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	enqueue_bthreep
.L34:
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L29
	movq	16(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	enqueue_bthreep
.L29:
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	isEmpty_bthreep
	testl	%eax, %eax
	je	.L35
	movl	$0, %eax
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (tdm64-1) 5.1.0"
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	scanf;	.scl	2;	.type	32;	.endef
	.def	new_queue_bthreep;	.scl	2;	.type	32;	.endef
	.def	enqueue_bthreep;	.scl	2;	.type	32;	.endef
	.def	dequeue_bthreep;	.scl	2;	.type	32;	.endef
	.def	isEmpty_bthreep;	.scl	2;	.type	32;	.endef
