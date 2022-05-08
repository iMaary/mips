.data
	breakLine: .asciiz "\n"
	space: .byte ' '
.text
	li $v0, 5 # loads 5 into $v0
	syscall
	
	move $t0, $v0 # $t0 = $v0
	li $t1, 1 # counter starting by 1
	
	# thats count 1 to n - 1 until n to be 1
	while:
		move $a0, $t1
		li $v0, 1
		syscall 
		
		la $a0, space
		jal printString
		
		beq $t1, $t0, exit
		addi $t1, $t1, 1
		j while	
	# thats restart the configuration of counter and recall loop of break loop
	exit:
		la $a0, breakLine
		jal printString
		
		subi $t0, $t0, 1
		li $t1, 1
		bne $t0, $zero, while
	
	finishProgram:
		li $v0, 10
		syscall
		
	printString:
		li $v0, 4
		syscall
		jr $ra
