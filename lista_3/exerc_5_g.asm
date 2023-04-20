.data
	A: .word 1
	B: .word 2
	
.text
.globl main
main:

	la $t0, A
	lw $s0, ($t0)	# s0 = 0
	la $t1, B
	lw $s1, ($t1)	# s1 = 0
	
	li $t2, 0			# i = 0
	li $t3, 5			# max = 5
	Loop:
	addi $s0, $s1, 1		# A = B + 1
	addi $s1, $s1, 3		# B = B + 3	
	addi $t2, $t2, 1		# i++
	blt $t2, $t3, Loop	# Se i < 5, Loop
	
	sw $s0, ($t0)
	sw $s1, ($t1)

exit:
	li $v0, 10
	syscall
