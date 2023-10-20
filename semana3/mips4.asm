.data
#0000 0110 -> 0x06 , 0101 1011 -> 0x5B , 0100 1111 -> 0x4F  , 0110 1101 -> 0x6D , 0111 1100 -> 0x7C , 00000111 -> 0x07
#01111111 -> 0x7F , 01111111 -> 0x6F , 10001111
array:	.word	0x3F, 0x06, 0x5B, 0X4F, 0x66, 0X6D, 0X7D, 0X07, 0X7F, 0X6F, 0XF7, 0xFF, 0xB9, 0xBF, 0xF9, 0xF1

.text

li $s0, 0xFFFF0010
li $s7, 0XFFFF0011
la $t0, array
la $t9, array
li $t1, 16 
li $t2, 256 #N
li $s3, 0 #current number
li $t2, 0

main:
	li $s0, 0xFFFF0010
	li $s7, 0XFFFF0011
	li $t2, 0 #temp variable helps choosing the display
	beq $s3, $t1, exit
	la $t0, array
	lw $s1, 0($t0)
	sb $s1, 0($s0)
	lw $s1, 0($t9)
	sb $s1, 0($s7)
	nested:
		beq $t2, $t1, end_nested
		addi $t2, $t2, 1 
		lw $s1, 0($t0)
		sb $s1, 0($s0)
		addi $t0, $t0, 4	
		j nested
	end_nested:
		addi $s3, $s3, 1
		addi $t9, $t9, 4
		j main

exit:
	
	
	
