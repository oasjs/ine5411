# Otavio Augusto de Santana Jatoba (22100636)

# Escreva um pequeno programa que armazene as seguintes 
# half-words: 1 , 2, -2, -3. Verifique na memória 
# de dados como estes números foram armazenados.

.data
	half: .half 1 , 2, -2, -3
.text
main:
	# Nothing goes here
exit:
	li $v0, 10
	syscall