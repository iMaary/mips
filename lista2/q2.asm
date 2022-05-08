.data
	buffer: .space 256  # alloc a space of 256 bytes
	msg1: .asciiz "Digite uma frase: "
	msg2: .asciiz "Digite um caractere: "
	msg3: .asciiz "\nDigite um caractere de substituição: "
	result: .asciiz "\nVocê digitou: "
	c1: .space 2 # alloc a space of 2 bytes (char)
	c2: .space 2 # alloc a space of 2 bytes (char)

.text
main: 
        la  $a0, msg1 # loads address of msg1 into $a0
	jal printString

        li  $v0, 8 
        la  $a0, buffer  
        li  $a1, 256
        syscall
        
        move $t0, $a0

	la $a0, msg2
	jal printString
	
	la $a0, c1 # loads address of c1 into a0
	jal readChar
	move  $t1, $v0 # $t1 = #v0
	
	la $a0, msg3
	jal printString
	
	la $a0, c2 # loads address of c2 into a0
	jal readChar
	move  $t2, $v0 # $t2 = #v0

# repeat test if the current char is equal c1 if yes so replace it by c2
swap:
        lb  $a0, ($t0)
        beq $a0, 0, breakLoop
        bne $a0, $t1, next
        sb  $t2, ($t0)
# add 1 position to the next and callback swap test
next:
        add $t0,$t0,1
        j   swap
# break loop adn print the program result
breakLoop:
        la  $a0, result # loads address of result into a0
       	jal printString

        la  $a0, buffer # loads address of buffer into a0
        jal printString
# finish the program
end:
        li $v0, 10
        syscall
        
printString:
	li $v0, 4
	syscall
	jr $ra
	
readChar:
	li $a1, 2   # read only 1 character
	li $v0, 12  # system call for reading a character
	syscall
	jr $ra 
