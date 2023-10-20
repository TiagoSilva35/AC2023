.text
li $s0,0xFFFF0010
ciclo2:
li $s1,0x04 
ciclo:   
sb $s1,0($s0)
sll $s1,$s1,1
bne $s1,0x20,salta
sll $s1,$s1,1
salta:
bne $s1,0x80,ciclo
j ciclo2