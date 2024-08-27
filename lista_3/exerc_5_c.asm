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
	la $t1, B
	sw $s1, ($t1)	# Armazena B na memoria
	
	ble $s0, $s1, c_	# Se a <= b, va para c_
	j	exit						# Se nao, termine

c_:
	addi 	$s0, $s0, 1
	sw 		$s0, ($t0)

exit:
	li $v0, 10
	syscall