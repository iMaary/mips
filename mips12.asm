.data
	msg: .asciiz "Input a number: "
	par: .asciiz "even number!"
	impar: .asciiz "odd number"
.text
	li $v0, 4
	la $a0, msg
	syscall
	
	li $v0, 5
	syscall
	
	li $t0, 2
	div $v0, $t0
	
	mfhi $t1 # contain div
	
	beq $t1, $zero, imprimePar
	
	# only pass if not enter in imprimePar label
	li $v0, 4
	la $a0, impar
	syscall

	li $v0, 10
	syscall
			
	imprimePar:
		li $v0, 4
		la $a0, par
		syscall
		
	
	