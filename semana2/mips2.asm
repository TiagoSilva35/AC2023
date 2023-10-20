
.text
.globl main

main:
	#Iniciar variáveis
	li $t0,0x10010000 #DISPLAY
	li $t1,0x000000FF #AZUL
	li $t9,0x00FF00FF #MAGENTA
	li $t2,64 #COMPRIMENTO
	li $t3,32 #LARGURA
	li $t4,0 #CONTADOR PARA AS LINHAS
	li $t5,0 #CONTADOR PARA AS COLUNAS
	li $s2,0 #VERIFICA SE É A APRIMEIRA VEZ QUE O LOOP É EXECUTADO
	li $s3,0 #ADICIONA 0 NO CASO DO BACKGROUND E 1 NO CASO DO QUADRADO
	#fazer um loop que itera 30(rows)x20(columns)
	cada_linha:
		beq $t4,$t3,exit
		li $t5,0
	cada_coluna:
		beq $t5,$t2,prox_linha #até completar todas as colunas de uma linha
		sw $t1,0($t0) #guarda a cor amarela no display
		addi $t0,$t0,4 #passa para o prox. pixel
		addi $t5,$t5,1 #logicamente passa para a próxima coluna
		j cada_coluna
	prox_linha:
		addi $t4,$t4,1
		add $t0,$t0,$s3
		j cada_linha
		
	exit:
			bne $s2,$zero,end
			addi $s2,$s2,1
			li $t0,0x10010000
			li $t1,0x00FF00FF
			li $t2,8
			li $t3,8
			li $t4,0
			li $t5,0
			li $s3,224
			addi $t0,$t0,3184
			j cada_linha
	end:
		li $v0,10
		syscall 
		
