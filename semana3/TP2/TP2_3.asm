.data
digitos: .byte 0x3f,0x06, 0x5b
.text
inicio:
li $s0,0xFFFF0010
la $s2,digitos
li $s3,3
ciclo:
lbu $s1,0($s2)
sb $s1, 0($s0)
addi $s2,$s2,1
addi $s3,$s3,-1
bne $s3,$zero,ciclo
j inicio

