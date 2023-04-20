.data
	address: .word 0x10010020
	
.text
.globl main
main:
	la $s1, address		# s1 = endereço de address
	lw $s0, ($s1)			# s0 = address
	li $t0, 1
	
	sw $t0,	($s0)
	
	addi $s0, $s0, 4
	li $t0, 3
	sw $t0,	($s0)

	addi $s0, $s0, 4
	li $t0, 2
	sw $t0,	($s0)
	
	addi $s0, $s0, 4
	li $t0, 1
	sw $t0,	($s0)
	
	addi $s0, $s0, 4
	li $t0, 4
	sw $t0,	($s0)
	
	addi $s0, $s0, 4
	li $t0, 5
	sw $t0,	($s0)

exit:
	li $v0, 10
	syscall