.data

tab:	.word 10, 24, 32, 40, 64, 128

.text

la $a0, tab
li $t0, 0
li $t1, 6
li $v0, 0
li $t3, 0
jal Polycalc
j end

Polycalc:
	lw $t2, 0($a0)
	loop:
		beq $t3, $t0, end_loop
		srl $t2, $t2, 1
		addi $t3, $t3, 1
		j loop
	end_loop:
		add $v0, $v0, $t2
		addi $a0, $a0, 4
		addi $t0, $t0, 1
		beq $t0, $t1, return
		li $t3, 0
		j Polycalc
		return:
			jr $ra

end:
	move $a0, $v0
	addi $v0, $zero, 1
	syscall