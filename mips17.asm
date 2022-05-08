.data 
	myArray:
		.align 2
		.space 16 # alloc 4 spaces on array
.text
	move $t0, $zero # index of array
	move $t1, $zero # value to be putted in array
	li $t2, 16
	
	while:
		beq $t0, $t2, breakLoop
		sw $t1, myArray($t0)
		addi $t0, $t0, 4
		addi $t1, $t1, 1
		j while
		
	breakLoop:
		move $t0, $zero # index of array
		print:
			beq $t0, $t2, breakPrint
			li $v0, 1
			lw $a0, myArray($t0)
			syscall
			addi $t0, $t0, 4
			j print
			
		breakPrint:
			
			
			
		
		
