.data
	saudacao: .asciiz "type your age: "
	saida: .asciiz "your age is "
.text

	li $v0, 4 # print string instruction
	la $a0, saudacao
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0 # moving value typed to $t0
	
	li $v0, 4 # print string instruction
	la $a0, saida
	syscall
	
	li $v0, 1 # print integer instruction
	move $a0, $t0
	syscall
	