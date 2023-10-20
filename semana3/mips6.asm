.data
#0000 0110 -> 0x06 , 0101 1011 -> 0x5B , 0100 1111 -> 0x4F  , 0110 1101 -> 0x6D , 0111 1100 -> 0x7C , 00000111 -> 0x07
#01111111 -> 0x7F , 01111111 -> 0x6F , 10001111
array:	.word	0x3F, 0x06, 0x5B, 0X4F, 0x66, 0X6D, 0X7D, 0X07, 0X7F, 0X6F, 0XF7, 0xFF, 0xB9, 0xBF, 0xF9, 0xF1

.text

li $s0, 0xFFFF0010
li $s7, 0XFFFF0012 #endereço para testar
li $s4, 0xFFFF0014 #endereço para ler do teclado
la $t0, array
li $t1, 0
li $t2, 0x01
li $s3, 0x00000001

main:
	add $t3, $t2, $s3
	sb $t3, 0($s7) 
	lw $t4, 0($s4)
	beq $t4, 0, dp
	lw $t9, 0($t0)
	sb $t9, 0($s0)
	
dp:
	addi $t0, $t0, 4
	sll $s3, $s3, 1
	slti $t5, $s3, 0x81
	beq $t5, 1, main 
	
	sll $t2, $t2, 1
	li $s3, 0x10
	slti $t7, $t2, 0x81
	beq $t7, 1, main
	
	subi $t0, $t0, 64
	li $t2, 0x01
	li $s3, 0x10
	
	j main
	
	
	
