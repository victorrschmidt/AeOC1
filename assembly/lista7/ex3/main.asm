.data
	n: 10

.text
	# Carregar valor
	lw $t0, n

	# Chamar a funcao com o parametro
	move $a0, $t0
	jal fatorial

	# Salvar o resultado
	move $t1, $v0

	# Encerrar o programa
	li $v0, 10
	syscall

# (n): retorna $v0
fatorial:
	# Se n <= 1, $v0 = 1
	ble $a0, 1, casoBase

    # Reserva espaco para n e $ra
    addi $sp, $sp, -8

    # Salva o n e o $ra dessa chamada
    sw $a0, 0($sp)
    sw $ra, 4($sp)

    # Chamada recursiva: fatorial(n - 1)
    addi $a0, $a0, -1
    jal fatorial

    # Recupera n dessa chamada
    lw $a0, 0($sp)

    # Multiplica o resultado da ultima chamada pelo n dessa chamada
    mul $v0, $a0, $v0

    # Recupera $ra dessa chamada
    lw $ra, 4($sp)

    # Libera o espaco da pilha
    addi $sp, $sp, 8

    jr $ra

casoBase:
    li $v0, 1
    jr $ra
