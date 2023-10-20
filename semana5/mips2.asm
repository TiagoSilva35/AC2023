.data 

tab: .word 1, 2, 3, 4, 5, 6, 7, 8, 9

.text

la $a0, tab
li $a1, 9
li $t0, 0

jal contaImpares
li $t1, 0
la $t0, tab	
j print

contaImpares:
	lw $t1, 0($a0)
	andi $t2, $t1, 1 
	bne $t2, 1, ignora
	incrementa:
		xor $t1, $t1, 1
		sw $t1, 0($a0)	 
	ignora:
		addi $a0, $a0, 4
		addi $t0, $t0, 1
		bne $t0, $a1, contaImpares
		jr $ra

print:
	beq $t1, $a1, end
	lw $a0, 0($t0)
	addi $t0, $t0, 4
	addi $v0, $zero, 1 
	addi $t1, $t1, 1
	syscall 
	j print

end: