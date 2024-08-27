# Organizacao de Computadores I - Lista 4
# Otavio A S Jatoba (22100636)

.data
	A: .word 4
	B: .word 10
	R: .space 4
	
.text
.globl main
main:
	la $t0, A
	lw $a0, ($t0)	# arg1 = A
	la $t0, B
	lw $a1, ($t0)	# arg2 = B
	
	jal calculaAreaQuadrado
	
	la $t0, R
	sw $v0, ($t0)	# Guarda o retorno na memoria
	
exit:
	li $v0, 10
	syscall
	
calculaAreaQuadrado:
	mul $v0, $a0, $a1
	jr 	$ra