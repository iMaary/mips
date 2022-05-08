.data
	maior: .asciiz "it's biggest!"
	menor: .asciiz "it's lowest!"
	igual: .asciiz "it's equal!"
.text
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	beq $t0, $zero, imprimeEqual
	bgt $t0, $zero, imprimeBigger
	blt $t0, $zero, imprimeLower
	
	imprimeEqual:
		li $v0, 4
		la $a0, igual
		syscall
		li $v0, 10
		syscall
	
	imprimeBigger:
		li $v0, 4
		la $a0, maior
		syscall
		li $v0, 10
		syscall
	
	imprimeLower:
		li $v0, 4
		la $a0, menor
		syscall
		li $v0, 10
		syscall
	