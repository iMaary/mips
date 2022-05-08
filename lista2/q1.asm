.data
	msg: .asciiz "Input a value: "
	trueMsg: .asciiz "TRUE"
	falseMsg: .asciiz "FALSE"
	myArray: # declare a array
		.align 2 # type of array (array of integers)
		.space 16
.text
	li $t0, 0 # counter starting by zero
	li $t1, 16 # max size adopted by array
	
	# that's read each number and loads in myArray
	while:
		beq $t0, $t1, breakLoop # condition ($t0 == $t1) to do loop to break
		la $a0, msg # load msg address into $a0
		jal printString 
		jal readInteger
		sw $v0, myArray($t0) # store the word of $t0 position of myArray
		addi $t0, $t0, 4 # adding 4 to array counter
		j while # recall the while without link
	breakLoop:
		li $t0, 8 # loads 8 into $t0
		li $t1, 5 # loads 5 into $t1
		lw $t2, myArray($t0) # loads word myArray at position $t0 into $t2
		beq $t2, $t1, printFalse # condition ($t2 == $t1) that print False result
	
		li $t0, 12 # loads 12 into $t0
		li $t1, 7 # loads 7 into $t1
		lw $t2, myArray($zero) # loads word myArray at position $zero into $t2
		lw $t3, myArray($t0) # loads word myArray at position $t0 into $t3
		add $t4, $t2, $t3 # adding $t2 and $t3
		beq $t1, $t4, printTrue # condition ($t1 == $t4) that print True result 
	
		li $t0, 4 # loads 4 into $t0
		li $t1, 2 # loads 2 into $t1
		lw $t2, myArray($t0) # loads word myArray at position $t0 into $t2
		bne $t1, $t2, printFalse # condition ($t1 != $t2) that print False result 
	
	
	printTrue:
		la $a0, trueMsg
		jal printString
		jal finishProgram

	printFalse:
		la $a0, falseMsg
		jal printString
	
	finishProgram:
		li $v0, 10
		syscall
	
	readInteger:
		li $v0, 5
		syscall
		jr $ra 
		
	printString:
		li $v0, 4
		syscall
		jr $ra
