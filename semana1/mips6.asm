.text
.globl main

main:
	li $v0,5
	li $t0,1
	move $t1,$t0
	syscall
	
	factorial:
		beq $t0,$v0,end
		mult $t1,$v0	
		mflo $t1
		subi $v0,$v0,1 
		j factorial
end:
	move $a0,$t1
	li $v0 1
	syscall
	
	
	