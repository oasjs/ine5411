# Organizacao de Computadores I - Lista 4
# Otavio A S Jatoba (22100636)

.data
	F: .space 4
	G: .space 4
	H: .space 4
	I: .space 4
	J: .space 4
	promptG: .asciiz "Insira o valor de G:\n"
	promptH: .asciiz "Insira o valor de H:\n"
	promptI: .asciiz "Insira o valor de I:\n"
	promptJ: .asciiz "Insira o valor de J:\n"
	
.text
.globl main
main:
	li $v0, 4				# Escreve string
	la $a0, promptG	
	syscall
	li $v0, 5				# Le inteiro
	syscall
	move $s0, $v0		# s0 = G
	
	li $v0, 4				# Escreve string
	la $a0, promptH	
	syscall
	li $v0, 5				# Le inteiro
	syscall
	move $s1, $v0		# s1 = H
	
	li $v0, 4				# Escreve string
	la $a0, promptI
	syscall
	li $v0, 5				# Le inteiro
	syscall
	move $s2, $v0		# s2 = I
	
	li $v0, 4				# Escreve string
	la $a0, promptJ
	syscall
	li $v0, 5				# Le inteiro
	syscall
	move $s3, $v0		# s3 = J
	
	move $a0, $s0
	move $a1, $s1
	move $a2, $s2
	move $a3, $s3
	jal calcula
	
	move $s4, $v0	# s4 = return de calcula
	
	# Armazena todos os valores na memoria:
	la $t0, G
	sw $s0, ($t0)
	la $t0, H
	sw $s1, ($t0)
	la $t0, I
	sw $s2, ($t0)
	la $t0, J
	sw $s3, ($t0)
	la $t0, F
	sw $s4, ($t0)
	
exit:
	li $v0, 10
	syscall
	
calcula:
	# Move argumentos para registradores temporarios
	move $t0, $a0
	move $t1, $a1
	move $t2, $a2
	move $t3, $a3
	
	# Realiza a operacao
	add $t0, $t0, $t1	# t0 = G + h
	add $t1, $t2, $t3	# t1 = I + J
	sub $v0, $t0, $t1	# return = t0 - t1
	
	jr $ra