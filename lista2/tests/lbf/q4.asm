.data
	years: .asciiz " anos, "
	months: .asciiz " meses, "
	days: .asciiz " dias, "
	hours: .asciiz " horas, "
	minutes: .asciiz " minutos e "
	seconds: .asciiz " segundos.\n"
	time_array: .word seconds, minutes, hours, days, months, years
	div_array: 60, 60, 24, 30, 12
	values_array: .space 24
	
.macro Print_comma
	la $a0, comma
	addi $v0, $0, 4 # print string syscall
	syscall
.end_macro

.text
Main:
	addi $v0, $0, 5 # read integer from user input
	syscall
	add $t0, $v0, $0 # store input into t0
	la $s0, div_array # load div_array into s0. div_array is an array used for calculating time on format Y, M, D, H, M, S.
	add $s1, $0, $0 # set iterator i to zero
	la $s2, time_array # load time strings into s2
	la $s3 values_array # load empty adress space for time values (values_array) into s3
	j Loop

Loop:
	# fetch current divisor
	sll $t3, $s1, 2 # multiply i by 4 to access the correct position on div_array
	add $t4, $t3, $s0 # store div_array[i] offset into t4
	lw $t3, 0($t4) # store number inside div_array[i]
	
	# divide current value by current divisor
	div $t0, $t3 # divide current value by div_array[i]
	mfhi $t1 # store remainder of the division into t1
	mflo $t0 # store quocient of the division into t0
	
	# store division remainder on values_array
	sll $t3, $s1, 2 # multiply i by 4 to access the correct position on values_array
	add $t3, $s3, $t3 # store values_array[i] offset into t3
	sw $t1, 0($t3) # store remainder of the division into values_array[i]
	
	# check if at the end of div_array
	slti $t3, $s1, 5 # check if i < 5 (last index on div_array)
	bne $t3, 1, Store_years # if i >= 4, jump to Store_years
	addi $s1, $s1, 1 # else, increment i
	j Loop # jump to the beginning of Loop 
	
Store_years:
	sll $t3, $s1, 2 # multiply i by 4 to access the correct position on values_array
	add $t3, $s3, $t3 # store values_array[i] offset into t3. i should be the last position at this point
	sw $t0, 0($t3) # store quocient of the division into values_array[i]. It should be the value for years
	j Print_formatted # jump to the print formatted label
	
Print_formatted:
	sll $t0, $s1, 2 # multiply i by 4 to access the correct position on values_array
	# print time value
	add $t1, $t0, $s3
	lw $a0, 0($t1)
	addi $v0, $0, 1 # print int syscall
	syscall
	# print time string
	add $t1, $t0, $s2
	lw $a0, 0($t1)
	addi $v0, $0, 4
	syscall
	# check if i > 0
	sgt $t2, $s1, 0
	bne $t2, 1, Exit
	subi $s1, $s1, 1
	j Print_formatted
	# if true, decrement i
	# jump back to the beginning of Print_formatted
	# else, jump to Exit
	
Exit:
	addi $v0, $0, 10 # exit syscall
	syscall	
