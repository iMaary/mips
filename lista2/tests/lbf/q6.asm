.data

.text
Main:
	addi $v0,$0, 5 # read integer syscall
	syscall
	add $s0, $0, $v0 # store user input into s0. s0 will be the iterator
	add $s3, $0, $v0 # store user input into s2
	jal Fibonacci

Fibonacci:
	beq $s0, 0, Base_case_zero # if current value is equal to 0, go to base case
	beq $s0, 1, Base_case_one # if current value is equal to 1, go to base case
	addi $sp, $sp, -8 # allocate space to the stack
	sw $ra, 0($sp) # store current return address into stack
	sw $s0, 4($sp) # store current number into stack
	
	# fibonacci(n - 1)
	addi $s0, $s0, -1 # decrement n by 1 
	jal Fibonacci # call to fibonacci(n - 1)
	lw $ra, 0($sp) # load current return address
	lw $s0, 4($sp) # load current number
	# fibonacci(n - 2)
	addi $s0, $s0, -2 # decrement n by 2
	jal Fibonacci # call to fibonacci(n - 2)
	lw $ra, 0($sp) # load current return address
	lw $s2, 4($sp) # load current number
	addi $sp, $sp, 8 # deallocate space from the stack
	beq $s2, $s3, Print_result # if current number is equal to n, stop the recursion
	jr $ra

Base_case_zero:
	jr $ra # if n == 0, don't increment result
	
Base_case_one:
	addi $a0, $a0, 1 # if n == 1, increment result by 1
	jr $ra

Print_result:
	addi $v0, $0, 1 # print int system call
	syscall
		
Exit:
	addi $v0, $0, 10 # exit system call
	syscall

