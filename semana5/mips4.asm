.data

str:	.space 100

.text

jal read_string

la $a0, str
move $a1, $v0

jal encripta
la $a0, str
jal print_string
la $a0, str
jal encripta
la $a0, str
jal print_string

j exit

print_string:
	move $t1, $v0 
	li $v0, 4
	syscall
	move $v0, $t1
	jr $ra

read_string:
	li $v0, 8
	la $a0, str
	li $a1, 100
	syscall
	li $v0, 12
	syscall
	jr $ra

encripta:
	lbu $t0, 0($a0)
	beq $t0, $zero, return
	xor $t0, $t0, $a1 
	sb $t0, 0($a0)
	addi $a0, $a0, 1
	j encripta
	return:
		jr $ra
		
exit:
	
	
	

	