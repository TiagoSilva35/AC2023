.data

num:	.word 0x10203040


.text

la $a1, num
lw $a0, 0($a1)
jal func
j fim

func:
	andi $t1, $a0, 0x000000FF
	sll $t1, $t1, 24
	or $v0, $v0, $t1
	andi $t1, $a0, 0x0000FF00
	sll $t1, $t1, 8
	or $v0, $v0, $t1
	andi $t1, $a0, 0x00FF0000
	srl $t1, $t1, 8
	or $v0, $v0, $t1
	andi $t1, $a0, 0xFF000000
	srl $t1, $t1, 24
	or $v0, $v0, $t1
	jr $ra
 
fim:
	move $a0, $v0
	addi $v0, $zero, 34
	syscall 
