# Otavio Augusto de Santana Jatoba (22100636)

# Implemente o código abaixo e verifique o resultado 
# final nos registradores $t0 e $t1:

.data
	ENTRADA: .byte 1 2 -2 -3 -4
.text
main:
	la	$s2, ENTRADA
	lb	$t0, 2($s2)
	lbu	$t1, 3($s2)	
	# Carrega o valor de -3, mas com extensao de sinal de 0
	# Assim, o valor 11111101 permanece esse, mas com
	# 24 bits 0 completando o restante do registrador
