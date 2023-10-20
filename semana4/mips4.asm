.data

str:	.align 2
	.asciiz	"Uma frase"
comp: 	.word 	0

.text

la $a0, str
la $t1, comp
lw $a1, 0($t1)
jal func
j exit

func:
	lbu $t2, 0($a0)
	beqz $t2, end
	j add_1
	end:
		move $v0, $a1
		sw $a1, comp
		jr $ra
	add_1:
		addi $a0, $a0, 1
		addi $a1, $a1, 1
		j func

exit:
	la $t1, comp
	lw $a0, 0($t1)
	addi $v0, $zero, 1
	syscall
	
