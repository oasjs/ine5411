# Otavio Augusto de Santana Jatoba (22100636)

# Considere que o valor de π (pi) seja 3.141592653589793. Crie um 
# programa que calcule a área de um círculo. O usuário deverá 
# informar o raio do círculo via teclado.

.data
	PI: .double 3.141592653589793

.text
	la 	$s1, PI
	l.d $f2, ($s1)

	li $v0, 7
	syscall
	mov.d $f4, $f0
	
	mul.d $f4, $f4, $f4	# raio²
	mul.d $f4, $f4, $f2	# raio² * pi
		
exit:
	li $v0, 10
	syscall
