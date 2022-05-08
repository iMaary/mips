.data 
	msgUsr: .asciiz "Input a positive number: "
	msgEven: .asciiz "Number is even!"
	msgOdd: .asciiz "Number is odd!"
.text
	la $a0, msgUsr
	jal printString
	jal readInteger
	
	move $a0, $v0
	jal isOdd
	
	beq $v0, $zero, printEven
	la $a0, msgOdd
	jal printString
	
	jal finishProgram
	
	printEven:
		la $a0, msgEven
		jal printString
		jal finishProgram
	
	isOdd:
		li $t0, 2
		div $a0, $t0
		
		mfhi $v0
		jr $ra
	
	printString:
		li $v0, 4
		syscall
		jr $ra
		
	readInteger:
		li $v0, 5
		syscall
		jr $ra
	
	finishProgram:
		li $v0, 10
		syscall