.data
	string: .asciiz "meu professor eh muito bom"

.text
	la $t0, string     # $t0 = i
	li $t1, 32         # $t1 = ' '
	lbu $t2, 0($t0)    # $t2 = *i
	sne $t3, $t1, $t2  # $t3 servira para verificar se estamos lendo um espaco em cada iteracao (1 = true, 0 = false)

main:
	lbu $t2, 0($t0)            # *i
	beq $t2, $zero, return     # Se *i == '\0', encerrar o programa
	beq $t2, $t1, isSpace      # Se *i == ' ', ir para o label em questao
	beq $t3, $zero, increment  # Se $t3 == false, ir para o label em questao
	addi $t2, $t2, -32         # Capitalizar o caracter
	sb $t2, 0($t0)             # Armazenar o caracter capitalizado
	li $t3, 0                  # Nao estamos mais lendo espacos
	addi $t0, $t0, 1           # i++
	j main                     # Voltar para o loop

isSpace:
	li $t3, 1                  # Agora estamos lendo espacos

increment:
	addi $t0, $t0, 1           # i++
	j main                     # Voltar para o loop

return:
	nop