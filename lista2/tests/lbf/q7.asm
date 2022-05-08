.data

.text
Main:
	addi $v0, $0, 5 # read int system call
	syscall
	add $s0, $v0, $0 # store first user input (base) into s0
	addi $v0, $0, 5 # read int system call 
	syscall 
	add $s1, $v0, $0 # store second user input (n) into s1. s1 will be the iterator
	 				 # inside the recursive function
	add $s2, $v0, $0 # store second user input (n) into s2
	j Geometric_progression
	
Geometric_progression:
	beq $s1, 0 Base_case # if current n == 0, jump to base case
	addi $sp, $sp, -8 # allocate space to the stack
	sw $ra, 0($sp) # store current return address into stack
	sw $s1, 4($sp) # store current n into stack
	addi $s1, $s1, -1 # decrement n by 1
	jal Geometric_progression
	lw $ra, 0($sp) # load current return address
	lw $s1, 4($sp) # load current n
	addi $sp, $sp, 8 # deallocate space from the stack
	mult $a0, $s0 # multiply result by base
	mflo $a0 # store product into result
	beq $s1, $s2, Print_result # if current n == user input, print result
	jr $ra # jump to current return address

Base_case:
	addi $a0, $0, 1 # if current n == 0, then result = 1 | a[0] = 1
	jr $ra
	
Print_result:
	addi $v0, $0, 1 # print int system call
	syscall
	
Exit:
	addi $v0, $0, 10 # exit system call
	syscall