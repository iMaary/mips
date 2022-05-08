.data
	msg: .asciiz "decimal number: "
	zero: .double 0.0
.text
	
	li $v0, 4
	la $a0, msg
	syscall
	
	# read double and putting in $f0
	li $v0, 7
	syscall
	
	# moving to $f12 value from $f0 value
	ldc1 $f2, zero # we need to use even values like $f2, $f4, $f6...
	add.d $f12, $f2, $f0 
	
	# print double at $f12
	li $v0, 3
	syscall 
	
	
