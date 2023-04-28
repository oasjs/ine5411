# Otavio Augusto de Santana Jatoba (22100636)

# Escreva um programa que receba dois valores inteiros S e C, 
# calcule e exiba a média: MEDIA = S (float) / C (float) como 
# um número de ponto flutuante de precisão simples. Dica: use 
# a instrução de conversão adequada para converter S e C de 
# palavras inteiras em flutuação de precisão simples.

.text
main:
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	mtc1 $t0, $f1
	mtc1 $t1, $f2
	
	div.s $f3, $f1, $f2
	
	exit:
	li $v0, 10
	syscall
	