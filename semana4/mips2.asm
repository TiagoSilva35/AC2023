.data

A:	.word 8
B:	.word 9
C:	.space 8

.text

la $t0, A
la $t1, B
lw $a0, 0($t0)
lw $a1, 0($t1)

jal func
j fim

func:
	blt $a0, $a1, negativo
	j positivo
	negativo:
		sub $v1, $a1, $a0
		j end_of_func
	positivo:
		sub $v1, $a0, $a1
		
	end_of_func:
		sw $v1, C 
		jr $ra

fim:
	la $t1, C
	lw $a0, 0($t1)
	addi $v0, $zero, 1
	syscall 
