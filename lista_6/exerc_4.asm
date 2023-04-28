# Otavio Augusto de Santana Jatoba (22100636)

# Implemente um programa que chame um procedimento para calcular a 
# raiz de uma equação completa do primeiro grau, na forma Ax + B = 0. 
# Os coeficientes, todos em ponto flutuante de precisão simples, devem 
# ser informados pelo teclado. O valor da raiz deve ser apresentado no
# monitor.

.text
main:
	li $v0, 6
	syscall
	mov.s $f1, $f0
	syscall
	mov.s $f2, $f0
	
	mtc1 $zero, $f3
	sub.s $f2, $f3, $f2	# Inverte B
	div.s	$f3, $f2, $f1	# f3 = -B/A
	
	li $v0, 2
	mov.s $f12, $f3
	syscall
	
	exit:
	li $v0, 10
	syscall