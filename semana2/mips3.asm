.data

display:	.word 0x10010000
color:		.word 0x00000000 #Cor preto

.text
.globl main

main:
	#Iniciar variáveis
	la $t9,display
	la $t8,color
	lw $t0,0($t9)
	lw $t1,0($t8)
	li $t2,64
	li $t3,32
	li $t4,0
	li $t5,0

	cada_linha:
		beq $t4,$t3,end
		li $t5,0
	cada_coluna:
		beq $t5,$t2,prox_linha #até completar todas as colunas de uma linha
		sw $t1,0($t0) #guarda a cor amarela no display
		addi $t0,$t0,4 #passa para o prox. pixel
		addi $t5,$t5,1 #logicamente passa para a próxima coluna
		addi $t1,$t1,1024
		j cada_coluna
	prox_linha:
		addi $t4,$t4,1
		addi $t1,$t1,196608
		j cada_linha
		
	end: