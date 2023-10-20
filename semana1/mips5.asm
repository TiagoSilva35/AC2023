.data 

n:	.space 4
str:	.asciiz "\n"


.text 
.globl main

main:
	li $v0,5
	li $t0, 3
	li $t2,0
	syscall
	
	mult $v0,$t0
	mflo $t1
	sub $t1,$t1,1
	
	loop:
		beq $t2,$t1,end
		li $v0,1
		move $a0,$t2
		syscall
		li $v0,4
		la $a0,str
		syscall  
		addi $t2,$t2,1
		j loop
		
end:
	move $a0,$t2
	li $v0,1
	syscall
	
 
