.text	

#la $a0,var
#lw $s0,0($a0)
#li $s1,20 
#add
#sw $s0,0($a0)
li $a0,10
li $a1,6
li $a2,7
li $a3,10

#LW $S0,0($AO)
add $v0,$a0,$v0
sub $v0,$v0,$a2
sub $v0,$v0,$a1
add $v0,$v0,$a3
add $v0,$v0,5
move $a0,$v0
li $v0,1
syscall 