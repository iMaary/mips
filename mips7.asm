.text
	li $t0, 32
	li $t1, 5
	
	div $t0, $t1
	
	# integer part to $s0
	mflo $s0
	
	# borrow to $s1
	mfhi $s1
	
	# shift right logic
	srl $s2, $t0, 2 # multipling $t1 to 2^2 = 4
	