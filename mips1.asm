.data
	# memory main data area
	msg: .asciiz "Hello, World!" #msg to be showed to user

.text
	# program instructions area

	li $v0, 4 # print string instruction
	la $a0, msg # load the 'msg' address 
	syscall # do it
	