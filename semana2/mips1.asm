.data

display:	.word 0x10010000
amarelo:	.word 0x00FFFF00 #Cor amarela

.text
.globl main

main:
	#Iniciar variáveis
	lw $t0,display
	lw $t1,amarelo
	li $t2,30
	li $t3,20
	li $t4,0
	li $t5,0
	#fazer um loop que itera 30(rows)x20(columns)
	cada_linha:
		beq $t4,$t3,end
		li $t5,0
	cada_coluna:
		beq $t5,$t2,prox_linha #até completar todas as colunas de uma linha
		sw $t1,0($t0) #guarda a cor amarela no display
		addi $t0,$t0,4 #passa para o prox. pixel
		addi $t5,$t5,1 #logicamente passa para a próxima coluna
		j cada_coluna
	prox_linha:
		addi $t4,$t4,1
		addi $t0,$t0,136
		j cada_linha
		
	end:
		