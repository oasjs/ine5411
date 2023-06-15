# Diana Faustino de Siqueira (22102193)
# Otavio Augusto de Santana Jatoba (22100636)

.data
	.align 4
	.eqv MAX 2
	.eqv LEN 4
	.eqv DATA_SIZE 4
	mat_a: .float 1:LEN
	mat_b: .float 1:LEN
	
.text
main:
	li $t0, 0	# i = 0
	li $t1, 0	# j = 0
	la $s0, mat_a
	la $s1, mat_b
	
	loop1_start:
		bge 	$t0, MAX, loop1_end
		move	$t1, $zero
		
		loop2_start:
			bge		$t1, MAX, loop2_end
			
			mul $t2, $t0, MAX		# t2 = i * MAX
			add	$t2, $t2, $t1		# t2 = t2 + j
			mul $t2, $t2, DATA_SIZE
			add $t2, $t2, $s0		# t2 = t2 + end base de mat_a
			
			mul $t3, $t1, MAX 	# t3 = j * MAX
			add $t3, $t3, $t0		# t3 = t3 + i
			mul $t3, $t3, DATA_SIZE
			add $t3, $t3, $s1		# t3 = t3 + end base de mat_b
			
			l.s		$f0, 0($t2)	#	f0 = mat_a[t2]
			l.s		$f1, 0($t3)	# t5 = mat_b[t3]
			add.s $f2, $f0, $f1 # t6 = t4 + t5
			s.s		$f2, 0($t2)	# mat_a[t2] = t6
			
			addi 	$t1, $t1, 1
			j 		loop2_start
		loop2_end:
		
		addi	$t0, $t0, 1
		j 		loop1_start
	loop1_end:
	
	exit:
		li $v0, 10
		syscall
