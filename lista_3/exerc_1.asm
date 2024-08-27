# Organização de Computadores I - Lista 3 
# Otávio A S Jatobá (221000636)

.data
	A: .word 10
	B: .word 15
	C: .word 20
	D: .word 25
	E: .word 30
	F: .word 35
	
	G: .word 0, 0, 0, 0
	H: .word 0, 0, 0, 0
	
.text
.globl main
main:
	# Loads the values of the labels A to F into regs s0 to s7
	la $t0, A
	lw $s0, ($t0)
	la $t0, B
	lw $s1, ($t0)
	la $t0, C
	lw $s2, ($t0)
	la $t0, D
	lw $s3, ($t0)
	la $t0, E
	lw $s4, ($t0)
	la $t0, F
	lw $s5, ($t0)
	la $s6, G
	la $s7, H
	
	# a) R: 10
	add $t0, $s1, $s2		# t0 = B + C
	sub $t0, $s0, $t0		# t0 = A - t0
	add $t0, $t0, $s5		# t0 += F
	sw	$t0, 0($s6)			# G[0] = t0
	
	# b) R: 5
	sub $t0, $s0, $s1 	# t0 = A - B
	sub $t1, $s1, $s2		# t1 = B - C
	mul $t0, $t0, $t1		# t0 *= t1
	sub $t0, $s4, $t0		# t0 = E - t0
	sw	$t0, 4($s6)			# G[1] = t0
	
	# c) R: -15
	sub $t1, $t0, $s2		# t1 = G[1] - C
	sw	$t1, 8($s6)			# G[2] = t1
	
	# d) R: -5
	lw 	$t0, 0($s6) 		# t0 = G[0]
	add $t1, $t1, $t0 	# t1 = G[2] + G[0]
	sw	$t1, 12($s6)		# G[3] = t1
	
	# e) R: -5
	sub $t0, $s1, $s2		# t0 = B - C
	sw	$t0, 0($s7)			# H[0] = t0
	
	# f) R: 30
	add $t0, $s0, $s2		# t0 = A + C
	sw 	$t0, 4($s7)			# H[1] = t0
	
	# g) R: -10
	sub $t0, $s1, $s2		# t0 = B - C
	add $t1, $t0, $t1		# t1 = B - C + G[3]
	sw	$t1, 8($s7)			# H[2] = t1
	
	# h) R: 30
	lw	$t0, 0($s6) 		# t0 = G[0]
	sub $t0, $s1, $t0		# t0 = B - G[0]
	add $t0, $t0, $s3		#	t0 = B - G[0] + D
	sw	$t0, 12($s7)		# H[3] = t0
	
exit:
	li $v0, 10					# Exit
	syscall
	