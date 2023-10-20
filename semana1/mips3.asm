.data 

array: .word 1,2,3,4,5,6,7,8,9,10

.text

li $t1,10
li $a3,0
li $a2,0
la $a0,array
lw $t3,0($a0)

ciclo:
	beq $a3,$t1,fim
	add  $a2,$a2,$t3
	addi $a0,$a0,4
	addi $a3,$a3,1
	lw $t3,0($a0)
	j ciclo
	
fim:
	move $a0,$a2
	li $v0,1
	syscall 
