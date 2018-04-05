	.file	"linked_queue.c"
	.text
	.globl	isEmpty_bthreep
	.def	isEmpty_bthreep;	.scl	2;	.type	32;	.endef
	.seh_proc	isEmpty_bthreep
isEmpty_bthreep:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	sete	%al
	movzbl	%al, %eax
	popq	%rbp
	ret
	.seh_endproc
	.globl	new_queue_bthreep
	.def	new_queue_bthreep;	.scl	2;	.type	32;	.endef
	.seh_proc	new_queue_bthreep
new_queue_bthreep:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movl	$8, %ecx
	call	malloc
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	movq	-8(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	enqueue_bthreep
	.def	enqueue_bthreep;	.scl	2;	.type	32;	.endef
	.seh_proc	enqueue_bthreep
enqueue_bthreep:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	$24, %ecx
	call	malloc
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L6
	movl	$1, %eax
	jmp	.L5
.L6:
	movq	-8(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L8
	movq	-8(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, (%rax)
	jmp	.L9
.L8:
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 16(%rax)
.L9:
.L5:
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	dequeue_bthreep
	.def	dequeue_bthreep;	.scl	2;	.type	32;	.endef
	.seh_proc	dequeue_bthreep
dequeue_bthreep:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L11
	movl	$2, %eax
	jmp	.L12
.L11:
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rdx, (%rax)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rdx
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jne	.L13
	movq	16(%rbp), %rax
	movq	$0, (%rax)
	jmp	.L14
.L13:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, (%rax)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	16(%rdx), %rdx
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	16(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, 8(%rax)
.L14:
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movl	$0, %eax
.L12:
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	clear_queue_bthreep
	.def	clear_queue_bthreep;	.scl	2;	.type	32;	.endef
	.seh_proc	clear_queue_bthreep
clear_queue_bthreep:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rcx
	call	isEmpty_bthreep
	testl	%eax, %eax
	jne	.L20
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	movq	$0, 8(%rax)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L18
.L19:
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	free
.L18:
	cmpq	$0, -8(%rbp)
	jne	.L19
	movq	16(%rbp), %rax
	movq	$0, (%rax)
	jmp	.L15
.L20:
	nop
.L15:
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (tdm64-1) 5.1.0"
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
