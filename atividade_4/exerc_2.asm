# Otavio A S Jatoba (22100636)

# Similar ao exercício anterior, implemente um programa no MARS que 
# percorrerá uma matriz inteira de 16 por 16 elementos, coluna após 
# coluna, atribuindo aos elementos os valores de 0 a 255 na ordem. Para
# isso, seu programa deverá incluir o seguinte algoritmo:

.data
matrix: .word 0:256
.eqv size 16
.eqv data_size 4

.text
main:
	li $t0, 0       # i = 0
	loop_1:
    li $t1, 0     # j = 0
    loop_2:
    	mul $t2, $t0, size			# t2 = i * size
    	add $t2, $t2, $t1				# t2 = t2 + j
    	
    	mul $t4, $t1, size			# t4 = j * size
    	add $t4, $t4, $t0				# t4 = t4 + i
    	mul	$t4, $t4, data_size	# t4 = t4 * data_size
    	
    	sw 	$t2, matrix($t4)		# matrix[j * size + i] = i * size + j	
    	
      addi $t1, $t1, 1
      blt  $t1, size, loop_2
    #end loop_2
  addi $t0, $t0, 1
  blt $t0, size, loop_1
  # end loop_1
