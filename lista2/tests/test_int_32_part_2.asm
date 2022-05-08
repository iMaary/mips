.data
	# 31 bits == 2147483647
	# 32 bits == 4294967295
	msg: .asciiz "\ninput: "
	receive: .space 33
.text
main:
	la $a0, msg
	jal printString
	
	li $v0, 8
	la $a0, receive
	li $a1, 33
	syscall

countNumberString:
	la $t0, receive # saving temporarily string inputed by user to check
	li $t1, 0
while:
	# funtion counts characters quantity  
	lb  $a0, ($t0) # loads byte at $t0 position
        beq $a0, 10, breakLoop # condition: if ($a0 == '\0') then break loop
        # SG.: ascii code 10 is LF (lime feed or end of string)
        add $t0, $t0, 1 # go to next characters of string inputed
        add $t1, $t1, 1 # add +1 to counter of characters
        j while # recall while until $a0 != 10 ('\0')
breakLoop:
	# break loop and go to convert
convertStringToInteger:
	li $t2, 1
	addiu $t3, $t3, 1
	exp: 
		beq $t2, $t1, exit
		mulu $t3, $t3, 10
		addi $t2, $t2, 1
		j exp
	exit:
		move $s0, $t3
		la $s1, receive
		addiu $a0, $zero, 0
loop:
	beq $s0, 0, breakLoopTwo
	lbu $t0, ($s1)
	addiu $t0, $t0, -0x30 
	mulu $t0, $t0, $s0
	addu $a0, $a0, $t0
	
	divu $s0, $s0, 10
	add $s1, $s1, 1
	j loop	
breakLoopTwo:
	jal printInteger

# finishing program
end:
	li $v0, 10
	syscall

printInteger:
	li $v0, 1
	syscall
	jr $ra
	
printString:
	li $v0, 4
	syscall
	jr $ra
