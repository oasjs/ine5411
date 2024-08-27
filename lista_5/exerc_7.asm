# Otavio Augusto de Santana Jatoba (22100636)

# Considere que o processador MIPS está sendo utilizado para controlar 
# um conjunto de 32 dispositivos externos. Cada dispositivo recebe um 
# bit indicando se ele deve ser ligado (=1) ou desligado (=0). Estes 
# bits estão armazenados no endereço de dados 0x10010020. Implemente um 
# programa que faça as seguintes operações:

# • O usuário deve informar pelo teclado se quer ligar ou desligar um 
# bit. Exemplo: se digitar 1, é para ligar algum bit. Se digitar 0, é 
# para desligar algum bit;
# • O usuário deve informar, na sequência, qual bit deve ser
# ligado/desligado. Por exemplo, ao digitar 2, então o bit 2 do
# endereço 0x10010020 deve ser ligado ou desligado (conforme instrução
# anterior).
# • Os estados anteriores dos outros bits devem ser preservados obrigatoriamente.

.data 0x10010020
	MACHINE: .word 0
	switchPrompt: .asciiz "Input 1 for on or 0 for off:\n"
	positionPrompt: .asciiz "Input a number from 0 to 31 to choose a machine:\n"
	errorMessage: .asciiz "Invalid inputs. Exited with an error."

.text
main:

	la $s2, MACHINE
	lw $s3, ($s2)

start:	
	li $v0, 4
	la $a0, switchPrompt
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0	# s0 recebe o comando
	
	li $v0, 4
	la $a0, positionPrompt
	syscall
	
	li $v0, 5
	syscall
	move $s1, $v0 # s1 recebe a posicao da maquina
	
	# Checks for errors in the input
	blt $s0, 0, errorExit
	bgt	$s0, 1, errorExit
	blt $s1, 0, errorExit
	bgt $s1, 31, errorExit

	li $t0, 1						# word auxiliar
	sllv $t0, $t0, $s1	# aux_word eh shiftada s1 vezes 
	
	beq $s0, 0, off
	beq $s0, 1, on
	
off:
	not $t0, $t0			# inverte aux_word
	and $s3, $s3, $t0	# machine = machine and aux_word
	sw	$s3, ($s2)
	j exit
	
on:
	or 	$s3, $s3, $t0	# machine = machine or aux_word
	sw	$s3, ($s2)
	j exit
	
exit:
	j start
	li $v0, 10
	syscall

errorExit:
	li $v0, 4
	la $a0, errorMessage
	syscall
	
	li $v0, 10
	syscall