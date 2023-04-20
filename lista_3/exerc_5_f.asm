.data
	A: .space 4
	B: .space 4
	C: .word 5
	
.text
.globl main
main:

	la $t0, A
	lw $s0, ($t0)	# s0 = 0
	la $t1, B
	lw $s1, ($t1)	# s1 = 0
	la $t2, C
	lw $s2, ($t2) # s2 = 5

	while:
	addi $s0, $s0, 1
	addi $s1, $s1, 2		
	blt $s0, $s2, while
	
	sw $s0, ($t0)
	sw $s1, ($t1)

exit:
	li $v0, 10
	syscall
