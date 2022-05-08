.data
	# 31 bits == 2147483647
	# 32 bits == 4294967295
	msg: .asciiz "double number: "
	zero: .double 0.0
.text
	la $a0, msg
	jal printString
	
	# read double and putting in $f0
	jal readDouble
	
	ldc1 $f2, zero
	# add.d $f12, $f0, $f2 
	mov.d $f12, $f0 # moving to $f12 value from $f0 value
	jal printDouble # print double at $f12

end:
	li $v0, 10
	syscall

readDouble:
	li $v0, 7
	syscall	
	jr $ra

printDouble:
	li $v0, 3
	syscall 
	jr $ra

printString:
	li $v0, 4
	syscall
	jr $ra