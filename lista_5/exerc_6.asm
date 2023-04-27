# Otavio Augusto de Santana Jatoba (22100636)

# Adapte o programa do item 4) para que utilize uma estrutura 
# de iteração tipo while, com critério de parada ao encontrar 
# o final da string armazenada usando o caractere \0 (NULL)

.data
	string: .space 8
.text
main:
	li $v0, 8				# Le string
	la $a0, string
	li $a1, 8				# 7 + null char
	syscall
	
	# Loop em formato while:
	li 		$s0, 0		# a_count = 0
	li 		$t0, 0 		# i = 0
	counter:
		lb		$t1, string($t0)
		bne		$t1, 'a', continue
		addi	$s0, $s0, 1
		continue:
		addi	$t0, $t0, 1
		bne		$t1, '\0', counter
	# Fim do while
	
exit:
	li $v0, 10
	syscall
	