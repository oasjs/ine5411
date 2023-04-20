# Organização de Computadores I - Lista 3
# Otávio A S Jatobá

.data 0x10010020
	array: .word 0:6
	
.text
.globl main
main:
	la $s0, array
	li $t0, 1
	sw $t0, ($s0)
	li $t0, 3
	sw $t0, 4($s0)
	li $t0, 2
	sw $t0, 8($s0)
	li $t0, 1
	sw $t0, 12($s0)
	li $t0, 4
	sw $t0, 16($s0)
	li $t0, 5
	sw $t0, 20($s0)
	
exit:
	li $v0, 10
	syscall
