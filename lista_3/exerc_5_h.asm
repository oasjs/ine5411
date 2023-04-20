.data
	A: .space 4
	B: .space 4
	C: .space 4
	
.text
.globl main
main:
	
	li $v0, 5			# Le inteiro
	syscall
	move $s0, $v0 # Move A para s0
	li $v0, 5			# Le inteiro
	syscall
	move $s1, $v0 # Move B para s1
	li $v0, 5			# Le inteiro
	syscall
	move $s2, $v0 # Move C para s2
	
	beq $s0, 1, case_1	# Se A = 1
	beq $s0, 2, case_2	# Se A = 2
	j default						# Default
	
case_1:
	addi $s1, $s2, 1	# B = C + 1
	j exit
	
case_2:
	addi $s1, $s2, 2	# B = C + 2
	j exit
	
default:
	move $s1, $s2 		# B = C
		
exit:
	la $t0, A
	la $t1, B
	la $t2, C
	sw $s0, ($t0)	# Armazena A na memoria
	sw $s1, ($t1)	# Armazena B na memoria
	sw $s2, ($t2)	# Armazena C na memoria
	li $v0, 10
	syscall
