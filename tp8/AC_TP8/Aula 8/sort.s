.text
.globl sort

#  void sort(int *tab,int num)
#  $a0 - &tab, $a1 - num

sort:
    # Para não ficarmos dependentes da utilização de ficheiros temporários noutras funções,
    # convém não assumir que o valor desses registos não vão ser alterados.
    # Por isso podemos recorrer a registos S, que sabemos serão sempre salvaguardados.
    # No entanto nós temos de salvaguardar os registos S que utilizarmos na nossa função.
    # Essa é a razão pela qual vamos guardar na pilha 5 registos ($s0, $s1, $s2, $a0 e $ra), ou seja 20 bytes.
	# A pilha que vamos reservar vai ficar com a seguinte organização
	#   |-------|
	#	|  $ra  | offset 16
	#   |-------|
	#	|  $a0  | offset 12
	#   |-------|
	#	|  $s2  | offset 8
	#   |-------|
	#	|  $s1  | offset 4
	#   |-------|
	#	|  $s0  | offset 0  <- $sp
	#   |-------|
	li $t1, 0 # makes sure we loop through all the elements of the table
	li $t2, 1 # it has either 1 or 0 verifying if we didnt change anything or we still have swaps to do
	addi $a1, $a1, -1
	loop:
		beq $t2, $zero, exit
		li $t2, 0
		inner_loop:
			beq $t1, $a1, loop
			addi $t1, $t1, 1
			addi $sp, $sp, -4
			sw $ra, 0($sp)
			jal troca
			addi $sp, $sp, 4
			lw $ra, 0($sp)
			addi $a0, $a0, 4
			beq $v0, 1, swap_happened
			j inner_loop
			swap_happened:
				li $t2, 1
				j inner_loop
		
	
exit:
	jr $ra
	
	

