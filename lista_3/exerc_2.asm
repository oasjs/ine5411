# Organização de Computadores I - Lista 3
# Otávio A S Jatobá (22100636)

.data
	max: 	.word 5
	i: 		.word 1
	
.text
.globl main
main:
	la $t0, max		# t0 = endereco de max
	lw $t1, ($t0)	# t1 = valor do endereco de max
	la $t0, i			# t0 = endereco de i
	lw $t2, ($t0) # t2 = valor do endereco de i
	li $s0, 0			# sum = 0
	
	Loop:
	add 	$s0, $s0, $t2		# sum += i
	addi 	$t2, $t2, 1			# i++
	ble 	$t2, $t1, Loop	# if <= 5, loop
	# End loop
	
	sw $s0, ($t0)					# i = sum
exit:
	li $v0, 10
	syscall
