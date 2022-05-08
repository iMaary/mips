.data 
	caractere: .byte 'A'

.text
	li $v0, 4
	la $a0, caractere
	syscall
	
	li $v0, 10 # finishing running
	syscall
