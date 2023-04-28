# Otavio Augusto de Santana Jatoba (22100636)

# Implemente um programa que converta a temperatura 
# dada em Fahrenheit via teclado para Celsius. Premissas:
# ◦ Utilize a equação de conversão TC/5 = (TF – 32)/9, em 
# que TC é a temperatura em Celsius e TF em fahreinheit;
# ◦ A equação de conversão deve ser implementada como um procedimento.

.data
	const_a:	.double 32
	const_b: 	.double 9
	const_c:	.double 5
	
.text
main:
	li $v0, 7
	syscall
	mov.d $f2, $f0
	
	jal fahrenheitToCelsius

	exit:
	li $v0, 10
	syscall
			
fahrenheitToCelsius:
	l.d $f0, const_a
	sub.d $f2, $f2, $f0
	l.d $f0, const_b
	div.d $f2, $f2, $f0
	l.d $f0, const_c
	mul.d $f2, $f2, $f0
	mov.d $f0, $f2
	jr $ra
	