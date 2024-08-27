# Otavio Augusto de Santana Jatoba (22100636)

# Implemente o código abaixo, escrito em linguagem C, para 
#  do MIPS. Perceba que o valor da matriz a[][] é 
# dupla precisão.

.data
	matrix: .double 0:100
	.eqv DATA_SIZE 8
	.eqv ARRAY_SIZE 10
	LINEBREAK: .asciiz "\n"
.text
main:
	jal init
	jal printMatrix
	
	exit:
	li $v0, 10
	syscall
		
printMatrix:
	li $t0, 0
	LoopA:
	li $t1, 0
		LoopB:
		# Calculo do imediato
		mul $t2, $t0, ARRAY_SIZE
		add $t2, $t2, $t1
		mul $t2, $t2, DATA_SIZE

		l.d	$f12, matrix($t2)
		li $v0, 3
		syscall
		li $v0, 4
		la $a0, LINEBREAK
		syscall
		
		addi 	$t1, $t1, 1	# j++
		blt		$t1, 10, LoopB
		# End of LoopB
	addi	$t0, $t0, 1
	blt		$t0, 10, LoopA
	# End of LoopA
	
	jr $ra
	
init:
	li $t0, 0
	LoopI:
	li $t1, 0
		LoopJ:
		# Calculo do imediato
		mul $t2, $t0, ARRAY_SIZE
		add $t2, $t2, $t1
		mul $t2, $t2, DATA_SIZE

		add $t3, $t0, $t1			# t3 = i + j
		mtc1.d $t3, $f2
		cvt.d.w $f2, $f2
		s.d	$f2, matrix($t2)	# matrix[i][j] = i + j
		
		addi 	$t1, $t1, 1	# j++
		blt		$t1, 10, LoopJ
		# End of LoopJ
	addi	$t0, $t0, 1
	blt		$t0, 10, LoopI
	# End of LoopI
	
	jr $ra