.text
.globl troca


# void troca(int * tab)
# $a0 - &tab

troca:
	lw $t3, 0($a0)
	lw $t4, 4($a0)
	bgt $t4, $t3, pass
	sw $t3, 4($a0)
	sw $t4, 0($a0)
	li $v0, 1
	pass:
		jr $ra
	

  
