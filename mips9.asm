.data 
	pergunta: .asciiz "Qual é o seu nome? "
	saudacao: .asciiz "Olá, "
	nome: .space 25
.text
	# question print
	li $v0, 4
	la $a0, pergunta
	syscall
	
	# read string value
	li $v0, 8
	la $a0, nome
	la $a1, 25
	syscall
	
	# print saudation
	li $v0, 4
	la $a0, saudacao
	syscall
	
	# print name
	li $v0, 4
	la $a0, nome
	syscall
