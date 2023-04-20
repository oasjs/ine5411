.data
	A: .space 4
	B: .space 4
	
.text
.globl main
main:
	
	li $v0, 5			# Le inteiro
	syscall
	move $s0, $v0 # Move A para s0
	li $v0, 5			# Le inteiro
	syscall
	move $s1, $v0 # Move B para s1
	
	la $t0, A			# t0 = endereco de A
	la $t1, B			# t1 = endereco de B
	
	blt $s0, $s1, e_if	# Se a < b, va para e_if
	j	e_else					# Se nao, va para d_else

e_if:
	addi 	$s0, $s0, 1
	sw 		$s0, ($t0)
	j exit

e_else:
	addi 	$s1, $s1, 1
	sw 		$s1, ($t1)	# Guarda B na memoria

exit:
	li $v0, 10
	syscall
