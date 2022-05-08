.text
atoapi: 
	st $r0, 0($a1) # Default: result = 0
 	addi $v0, $r0, 1 # one word result so far

 	ld $t7, 0($a0) # Special check for empty string
 	beq $t7, $r0, error

nextdigit:
	ld $t7, 0($a0) # Get next digit
 	addi $a0, $a0, 1 # Advance string pointer
 	bne $t7, $r0, cont # Not end of string
 	jr $ra # Finished – length in $v0

cont: 
	addi $t7, $t7, -0x30 # Convert from ASCII to digit
 	slti $t0, $t7, 0 # Less than 0?
 	bne $t0, $r0, error # Yup. Bad digit
 	slti $t0, $t7, 10 # Greater than 9?
 	beq $t0, $r0, timestenplus # No – good digit in $t7
error: 
	addi $v0, $r0, -1 # Error return value
 	jr $ra 

timestenplus:
 	add $t0, $r0, $r0 # Current word count = 0
 	add $t1, $a1, $r0 # Current word pointer = start
 	addi $t2, $r0, 10 # Constant for multiplying

loop: 
	lw $t3, 0($t1) # Get next word from memory
	mulu $t3, $t2 # Multiply word by 10
	mflo $t3 # Low result of multiply
	addu $t4, $t3, $t7 # Add in new digit
	sw $t4, 0($t1) # Save result in memory
	sltu $t5, $t4, $t3 # Check for carry from addu
 	mfhi $t3 # High result of mult
 	add $t7, $t3, $t5 # Add carry from addu
 	addi $t0, $t0, 1 # Next word ID
 	addi $t1, $t1, 4 # Next word pointer

 	bne $t0, $v0, loop # Keep looping until through all digits

 	beq $t7, $r0, nextdigit # Finished – no need to increase digits
 	st $t7, 0($t1) # Add extra word
 	addi $v0, $v0, 1  # Increase number of words by 1
 	j nextdigit