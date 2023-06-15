# Diana Faustino de Siqueira (22102193)
# Otavio Augusto de Santana Jatoba (22100636)

.data
	.align 4
	.eqv MAX 4
	.eqv LEN 16
	.eqv DATA_SIZE 4
	.eqv block_size 2
	mat_a: .float 1:LEN
	mat_b: .float 1:LEN
	
.text
main:
	move 	$t0, $zero	# i = 0
	move 	$t1, $zero # j = 0
	la $s0, mat_a
	la $s1, mat_b
	
	loop1_start:
		bge 	$t0, MAX, loop1_end
		move	$t1, $zero
		loop2_start:
			bge 	$t1, MAX, loop2_end
			move 	$t3, $t0							# ii = i
			
			loop3_start:
				addi	$t4, $t0, block_size
				bge 	$t3, $t4, loop3_end
				move 	$t5, $t1							# jj = j
				
				loop4_start:
					# Rotina do loop
					addi  $t6, $t1, block_size
					bge		$t5, $t6, loop4_end
					
					# Calculo do deslocamento para mat_a
					mul $t7, $t3, MAX
					add	$t7, $t7, $t5
					mul $t7, $t7, DATA_SIZE
					add $t7, $t7, $s0
			
					# Calculo do deslocamento para mat_b
					mul $t8, $t5, MAX
					add $t8, $t8, $t3
					mul $t8, $t8, DATA_SIZE
					add $t8, $t8, $s1

					# Soma das células das matrizes
					# e store na memória
					l.s		$f0, 0($t7)
					l.s		$f1, 0($t8)
					add.s $f2, $f0, $f1
					s.s		$f2, 0($t7)
					
					addi 	$t5, $t5, 1	 	# jj++
					j			loop4_start
				loop4_end:
									
				addi	$t3, $t3, 1	 		# ii++
				j			loop3_start
			loop3_end:
			
			addi	$t1, $t1, block_size
			j   	loop2_start
		loop2_end:
		
		addi	$t0, $t0, block_size
		j			loop1_start
	loop1_end:
	
	exit:
	li $v0, 10
	syscall
	
	
