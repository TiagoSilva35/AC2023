.data
#0000 0110 -> 0x06 , 0101 1011 -> 0x5B , 0100 1111 -> 0x4F  , 0110 1101 -> 0x6D , 0111 1100 -> 0x7C , 00000111 -> 0x07
#01111111 -> 0x7F , 01111111 -> 0x6F , 10001111
array:	.word	0x3F, 0x06, 0x5B, 0X4F, 0x66, 0X6D, 0X7C, 0X07, 0X7F, 0X6F, 0XF7, 0xFF, 0xB9, 0xBF, 0xF9, 0xF1

.text

li $s0, 0xFFFF0010
li $s7, 0XFFFF0011
la $t0, array
li $t1, 16 
li $t2, 256 #N
li $s3, 0 #current number

main:
	li $s2, 0 #temp variable helps choosing the display
	beq $s3, $t2, exit
	
	get_hexadecimal:
		div $s3,$t1
		mfhi $s4
		mflo $s5
	for_d1:
		beq $s2,$s4,d1
		addi $t0, $t0, 4
		addi $s2, $s2, 1
		j for_d1
		
	d1:
		lw $s1, 0($t0)
		sb $s1, 0($s0)
		la $t0, array
		li $s2, 0

	for_d2:
		beq $s2, $s5, d2
		addi $t0, $t0, 4
		addi $s2, $s2, 1
		j for_d2
	d2:
		lw $s1, 0($t0)
		sb $s1, 0($s7)
		la $t0, array
		addi $s3, $s3, 1
		j main

exit:
	
	
	
