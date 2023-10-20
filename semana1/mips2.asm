.text 
li $a0,0
li $a1,1
li $t1,101

ciclo:
	beq $a1,$t1,fim
	add  $a0,$a0,$a1
	addi $a1,$a1,1
	j ciclo
	
fim:
	li $v0,1
	syscall 
	
	
	


