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
	
	la $t0, A
	sw $s0, ($t0)	# Armazena A na memoria
	la $t0, B
	sw $s1, ($t0)	# Armazena B na memoria
	
	bge $s0, $s1, b_	# Se a >= b, va para b_
	j	exit

b_:
	addi 	$s1, $s1, 1
	sw 		$s1, ($t1)

exit:
	li $v0, 10
	syscall