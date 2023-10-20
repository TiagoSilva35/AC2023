.data

array: .word 10,2,3,91,6,7,0

.text	

li $s0,0
li $s1,7
la $s2,array
lw $s3,0($s2)
li $s4,0


ciclo:
	beq $s0,$s1,end
	slt $t1,$s4,$s3
	beq $t1,1,set
	addi $s2,$s2,4
	addi $s0,$s0,1
	lw $s3,0($s2)
	j ciclo	
	
set:
	move $s4,$s3
	addi $s2,$s2,4
	addi $s0,$s0,1
	lw $s3,0($s2)
	j ciclo

end:
	li $v0,1
	move $a0,$s4
	syscall
