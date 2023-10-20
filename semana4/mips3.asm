.data 

num:	.word 16

result:	.space 8

.text	

la $t1, num
lw $a0, 0($t1)
jal func
j end

func:
	beq $t2, 32, end_func
	andi $s0, $a0, 1
	srl $a0, $a0, 1
	add $v0, $v0, $s0
	addi $t2, $t2, 1
	j func
	end_func:
		andi $v0, $v0, 1
		sw $v0, result
		jr $ra

end:
	move $a0, $v0
	li $v0, 1
	syscall





	
	  
	    
