.text
	li $t0, 12
	addi $t1, $zero, 10
	
	# multiplied by
	mul $s0, $t0, $t1
	
	li $v0, 1
	move $a0, $s0
	syscall
	
	# shift left logic
	sll $s1, $t1, 10 # multipling $t1 to 2^10 = 1024
	
	# finishing
	li $v0, 10
	syscall
