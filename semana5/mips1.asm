.data 

tab: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 11

.text

la $a0, tab
li $a1, 10
li $t0, 0

jal contaImpares
j exit

contaImpares:
	lw $t1, 0($a0)
	andi $t2, $t1, 1 
	addi $a0, $a0, 4
	addi $t0, $t0, 1
	bne  $t2, 1, ignora
	incrementa:
		addi $v0, $v0, 1
	ignora:
		bne $t0, $a1, contaImpares
		jr $ra
	
exit:
	move $a0, $v0
	addi $v0, $zero, 1 
	syscall 