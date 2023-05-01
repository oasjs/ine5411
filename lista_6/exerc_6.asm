# Otavio Augusto de Santana Jatoba (22100636)

# O método iterativo de Newton pode ser usado para aproximar a raiz 
# quadrada de um número x, usando a expressão: guess = 
# ((x/guess) + guess) / 2. Deve-se iniciar o algoritmo com o valor 1 
# (guess). Escreva uma função chamada square_root que recebe um 
# parâmetro de precisão dupla x, calcula, e retorna o valor aproximado 
# da raiz quadrada de x. Escreva um loop que se repita 20 vezes e 
# calcula 20 valores de palpite e, em seguida, retorna o palpite final 
# após 20 iterações. Compare o resultado da instrução sqrt.d com o 
# resultado de sua função square_root. Qual é o erro em valor 
# absoluto?
.data
	two: .double 2
	customSqrtPrompt: .asciiz "A raiz custom do programa é:\n"
	mipsSqrtPrompt: .asciiz "A raiz do sqrt.d é:\n"
	diffPrompt: .asciiz "A diferença é:\n"
	linebreak: .asciiz "\n"
	
.text
main:
	li $v0, 7
	syscall
	mov.d $f10, $f0
	jal square_root
	
	sqrt.d $f2, $f10
	
	compare:
	sub.d $f4, $f2, $f0
	
	print:
	li $v0, 4
	la $a0, customSqrtPrompt
	syscall
	li $v0, 3
	mov.d $f12, $f0
	syscall
	li $v0, 4
	la $a0, linebreak
	syscall
	
	la $a0, mipsSqrtPrompt
	syscall
	li $v0, 3
	mov.d $f12, $f2
	syscall
	li $v0, 4
	la $a0, linebreak
	syscall
	
	la $a0, diffPrompt
	syscall
	li $v0, 3
	mov.d $f12, $f4
	syscall
	li $v0, 4
	la $a0, linebreak
	syscall
				
	exit:
	li $v0, 10
	syscall
	
square_root:
	mov.d $f2, $f0	# f2 = x
	la $t0, two
	l.d	$f8, ($t0)	#f8 = 2
	li $t0, 0 			# i = 0
	mov.d $f4, $f0	# guess = x
	
	loop:
		div.d $f6, $f2, $f4	# f6 = x/guess
		add.d $f6, $f6, $f4	# f6 = (x/guess) + guess
		div.d $f4, $f6, $f8	# f6 = ((x/guess) + guess) / 2
		addi $t0, $t0, 1		# i++
	blt	$t0, 20, loop
	mov.d $f0, $f4				# f0 = final guess
	jr $ra
