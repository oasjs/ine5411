# Otavio Augusto de Santana Jatoba (22100636)

# Implemente um programa que chame um procedimento para calcular 
# as raízes de uma equação completa do segundo grau, na forma 
# Ax2 + Bx + C = 0. Os coeficientes da equação, todos em ponto 
# flutuante de precisão dupla, devem ser informados pelo teclado 
# e os valores das raízes devem ser apresentados no monitor.
.data
	four: .double 4

.text
main:
	li $v0, 7
	syscall
	mov.d $f2, $f0
	syscall
	mov.d $f4, $f0
	syscall
	mov.d $f6, $f0
	
	jal findRootsAndPrint
	
	exit:
	li $v0, 10
	syscall

findRootsAndPrint:
	delta:
	mul.d $f0, $f4, $f4	# f0 = B²
	l.d $f8, four
	mul.d $f6, $f2, $f6	# f6 = A*C
	mul.d $f6, $f6, $f8	# f6 = 4AC
	sub.d $f6, $f0, $f6	# f6 = B² - 4AC
	
	findRoots:
	mtc1.d $zero, $f0		# Move 0 para f0
	sub.d $f4, $f0, $f4 # Inverte B
	add.d $f2, $f2, $f2 # Dobra A
	sqrt.d $f6, $f6			# Deine a raiz de delta

	add.d $f0, $f4, $f6
	div.d	$f0, $f0, $f2	# x1
	
	sub.d $f8, $f4, $f6
	div.d $f8, $f8, $f2 # x2
	
	print:
	li $v0, 3
	mov.d $f12, $f0
	syscall
	mov.d $f12, $f8
	syscall
	
	jr $ra
	
	
