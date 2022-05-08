.data
	String1: .asciiz "Please enter a character: " 
	String2: .asciiz "\nRESULT: " 
	c1: .space 2 

.text
main:
	la $a0, String1    # load adress of string 1 and put into a0
	jal printString
	
	la $a0, c1   #Load address of c1 into a0
	li $a1, 2    # Read only 1 character
	li $v0, 12   #system call for reading a character
	syscall

	move $t0, $v0

	la $a0, String2 # load adress of string 2 and put into a0
	jal printString
	
	move $a0, $t0

printChar:
	li $v0, 11
	syscall

end:
	li, $v0, 10
	syscall

printString:
	li $v0, 4       # load syscall 4 to print string
	syscall         #Print the string
	jr $ra