# Otavio Augusto de Santana Jatoba (22100636)

# Escreva um programa em Assembly do MIPS que receba uma string 
# do teclado com até 7 dígitos e armazene esta string recebida 
# na memória de dados.Sugestão: use o comando 8 na chamada de 
# sistema syscall.

.data
	# Espaco para 7 digitos mais o caracter nulo
	string: .space 8
.text
main:
	li $v0, 8				# Le string
	la $a0, string
	li $a1, 8				# 7 + null char
	syscall
exit:
	li $v0, 10
	syscall
