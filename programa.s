	.file	"programa.c"
	.text
	.globl	llamadas
	.bss
	.align 4
llamadas:
	.space 4
	.text
	.globl	sumar
	.def	sumar;	.scl	2;	.type	32;	.endef
	.seh_proc	sumar
sumar:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	llamadas(%rip), %eax
	addl	$1, %eax
	movl	%eax, llamadas(%rip)
	movl	16(%rbp), %edx
	movl	24(%rbp), %eax
	addl	%edx, %eax
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC1:
	.ascii "1.0\0"
	.align 8
.LC2:
	.ascii "=== Laboratorio de Compilacion en C (v%s) ===\12\12\0"
.LC3:
	.ascii "sumar(3, 4)       = %d\12\0"
.LC4:
	.ascii "CUADRADO(%d)      = %d\12\0"
.LC5:
	.ascii "MAX(7, 12)        = %d\12\0"
.LC6:
	.ascii "area_circulo(%.1f) = %.4f\12\0"
.LC7:
	.ascii "Factoriales:\0"
.LC8:
	.ascii "  %d! = %d\12\0"
.LC9:
	.ascii "Llamadas a sumar(): %d\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	call	__main
	movsd	.LC0(%rip), %xmm0
	movsd	%xmm0, -16(%rbp)
	leaq	.LC1(%rip), %rdx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$4, %edx
	movl	$3, %ecx
	call	sumar
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
	leaq	.LC3(%rip), %rcx
	movl	%eax, %edx
	call	printf
	leaq	.LC4(%rip), %rax
	movl	$25, %r8d
	movl	$5, %edx
	movq	%rax, %rcx
	call	printf
	leaq	.LC5(%rip), %rax
	movl	$12, %edx
	movq	%rax, %rcx
	call	printf
	call	imprimir_separador
	movq	-16(%rbp), %rax
	movq	%rax, %xmm0
	call	area_circulo
	movapd	%xmm0, %xmm1
	movq	%xmm0, %rcx
	movsd	-16(%rbp), %xmm0
	movq	-16(%rbp), %rdx
	leaq	.LC6(%rip), %rax
	movapd	%xmm1, %xmm2
	movq	%rcx, %r8
	movapd	%xmm0, %xmm1
	movq	%rax, %rcx
	call	printf
	leaq	.LC7(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movl	$0, -4(%rbp)
	jmp	.L4
.L5:
	movl	-4(%rbp), %eax
	movl	%eax, %ecx
	call	factorial
	movl	%eax, %edx
	movl	-4(%rbp), %eax
	leaq	.LC8(%rip), %rcx
	movl	%edx, %r8d
	movl	%eax, %edx
	call	printf
	addl	$1, -4(%rbp)
.L4:
	cmpl	$5, -4(%rbp)
	jle	.L5
	call	imprimir_separador
	movl	llamadas(%rip), %eax
	leaq	.LC9(%rip), %rcx
	movl	%eax, %edx
	call	printf
	movl	$0, %eax
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC10:
	.ascii "----------------------------------------\0"
	.text
	.globl	imprimir_separador
	.def	imprimir_separador;	.scl	2;	.type	32;	.endef
	.seh_proc	imprimir_separador
imprimir_separador:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	leaq	.LC10(%rip), %rax
	movq	%rax, %rcx
	call	puts
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC0:
	.long	0
	.long	1075052544
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev14, Built by MSYS2 project) 15.2.0"
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	area_circulo;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	factorial;	.scl	2;	.type	32;	.endef
