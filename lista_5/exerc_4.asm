# Otavio Augusto de Santana Jatoba (22100636)

# Adapte o programa anterior (3) para contar quantas letras 
# 'a' (minúsculas) existem na palavra rmazenada.
# Sugestão: teste o programa digitando a palavra abacate 
# e veja se o seu programa contará certo a quantidade de 
# letras 'a'

.data
		string: .space 8
.text
main:
	li $v0, 8				# Le string
	la $a0, string
	li $a1, 8				# 7 + null char
	syscall
	
	li 		$s0, 0		# a_count = 0
	li 		$t0, 0		# i = 0
	counter:
		lb		$t1, string($t0)
		bne		$t1, 'a', continue
		addi	$s0, $s0, 1
		continue:
		addi	$t0, $t0, 1
		blt		$t0, 7, counter
		
exit:
	li $v0, 10
	syscall