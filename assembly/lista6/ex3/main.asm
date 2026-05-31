.data
	size:  .word 3
	array: .word 1, 2, 8

.text
	li $t0, 1          # Flag
	lw $t1, size       # Tamanho do array
	la $t2, array      # Ponteiro i
	addi $t1, $t1, -1  # Faremos n - 1 iteracoes no total

main:
	beq $t1, $zero, return  # Se contador de iteracoes for igual a zero, encerrar o programa
	lw $t3, 0($t2)          # array[i]
	lw $t4, 4($t2)          # array[i + 1]
	sle $t3, $t3, $t4       # $t3 = array[i] <= array[i + 1]
	and $t0, $t0, $t3       # $t4 &= $t3
	addi $t2, $t2, 4        # i++
	addi $t1, $t1, -1       # contador--
	j main                  # Voltar ao loop

return:
	nop
