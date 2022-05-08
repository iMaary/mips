.data
	espaco: .byte ' '
.text
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	# li $t1, 0
	move $t1, $zero
	
	while:
		li $v0, 1
		move $a0, $t1
		syscall 
		
		li $v0, 4
		la $a0, espaco
		syscall 
		
		beq $t1, $t0, saida
		addi $t1, $t1, 1
		j while	
	saida:
		li $v0, 10
		syscall