.data

str:	.align 2
	.asciiz "UmA FrAsE"
	
.text

la $a0, str
jal toLower
j exit

toLower:
	lbu $t1, 0($a0)
	beq  $t1, $zero, end
	bgt $t1, 0x41, change
	change:
		bgt $t1, 0x5A, else
		ori $t1, 0x20
		sb  $t1, 0($a0)
	else:
		addi $a0, $a0, 1
		j toLower
	
	end:
		jr $ra
	
exit:
	li $v0, 4
	la $a0, str
	syscall 
