.data
	PI: .float 3.141592
	msg: .asciiz "decimal number: "
	zero: .float 0.0
.text
	# li $v0, 2
	# lwc1 $f12, PI
	# syscall
	
	li $v0, 4
	la $a0, msg
	syscall
	
	# read float and putting in $f0
	li $v0, 6
	syscall
	
	# moving to $f12 value from $f0 value
	lwc1 $f1, zero
	add.s $f12, $f1, $f0 
	
	# print float at $f12
	li $v0, 2
	syscall 
	
	