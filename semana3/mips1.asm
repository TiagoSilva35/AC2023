.text

li $s0, 0xFFFF0010
li $s1, 0x01
li $t1, 8
li $s2, 0

loop:
	beq $s2, $t1, reset 
	sb $s1, 0($s0)
	sll $s1, $s1, 1
	addi $s2, $s2, 1
	j loop

reset:
	li $s2, 0
	li $s1, 0x01
	sb $s1, 0($s0)
	j loop
	
	
