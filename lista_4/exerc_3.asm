# Organizacao de Computadores I - Lista 4
# Otavio A S Jatoba (22100636)

.data
	promptBase: .asciiz "Insira o valor da base:\n"
	promptExpo: .asciiz "Insira o valor do expoente:\n"
	
.text
.globl main
main:
	# Le dois inteiros e os registra em arg0 e arg1
	li $v0, 4
	la $a0, promptBase
	syscall
	li $v0, 5
	syscall
	move $s0, $v0
	
	li $v0, 4
	la $a0, promptExpo
	syscall
	li $v0, 5
	syscall
	move $s1, $v0

	move $a0, $s0
	move $a1, $s1
	jal pow
	
	move $a0, $v0
	li $v0, 1
	syscall
	
exit:
	li $v0, 10
	syscall
			
pow:
	move $v0, $a0	# Resultado
	li $t0, 1	# i = 1
	loop:
	mul $v0, $v0, $a0
	addi $t0, $t0, 1
	blt $t0, $a1, loop
	
	jr $ra