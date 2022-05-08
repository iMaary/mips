.data
	buffer: .space 256  # Aloca 256 bytes de espaço
	msg1: .asciiz "Digite uma frase: "
	msg2: .asciiz "Digite um caractere: "
	msg3: .asciiz "\nDigite um caractere de substituição: "
	result: .asciiz "\nVocê digitou: "
	c1: .space 2
	c2: .space 2

.text
main: 
        la  $a0, msg1
	jal printString

        li  $v0, 8
        la  $a0, buffer  
        li  $a1, 256
        syscall
        
        move $t0, $a0

	la $a0, msg2
	jal printString
	
	la $a0, c1   # Load address of c1 into a0
	jal readChar
	move  $t1, $v0
	
	la $a0, msg3
	jal printString
	
	la $a0, c2   # Load address of c2 into a0
	jal readChar
	move  $t2, $v0
	
swap:
        lb  $a0, ($t0)
        beq $a0, 0, breakLoop
        bne $a0, $t1, next
        sb  $t2, ($t0)
        
next:
        add $t0,$t0,1
        j   swap
        
breakLoop:
        la  $a0, result    # Carrega e mostra "sua resposta" que é uma string
       	jal printString

        la  $a0, buffer  
        jal printString
        
end:
        li $v0, 10
        syscall
        
printString:
	li $v0, 4
	syscall
	jr $ra
	
readChar:
	li $a1, 2   # Read only 1 character
	li $v0, 12  #system call for reading a character
	syscall
	jr $ra 