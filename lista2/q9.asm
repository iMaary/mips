.data
	out1: .asciiz "Input a string: "
	result: .asciiz "Quantity of Characters: "
	stringIputed: .space 256
.text
main:
	la $a0, out1 # loads into $a0 message asking to input a string
	jal printString # calling print string function

	# reading a string of 256 spaces allocated before
	li $v0, 8
	la $a0, stringIputed
	li $a1, 256
	syscall

	la $t0, stringIputed # saving temporarily string inputed by user to check
	li $t1, 0

while:
	# funtion counts characters quantity  
	lb  $a0, ($t0) # loads byte at $t0 position
        beq $a0, 10, breakLoop # condition: if ($a0 == '\0') then break loop
        # SG.: ascii code 10 is LF (lime feed or end of string)
next:
        add $t0, $t0, 1 # go to next characters of string inputed
        add $t1, $t1, 1 # add +1 to counter of characters
        j while # recall while until $a0 != 10 ('\0')
breakLoop:
	# break loop and print the result
	la $a0, result
	jal printString
	move $a0, $t1
	
printInteger:
	li $v0, 1
	syscall

endProgram:
	li $v0, 10
	syscall
	
printString:
	li $v0, 4
	syscall
	jr $ra