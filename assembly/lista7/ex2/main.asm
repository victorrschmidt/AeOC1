.text
    li $t0, 150  # x
    li $t1, 230  # y
    li $t2, 991  # z
    li $t3, 0    # r

	# Parametros para soma3n
    move $a0, $t0  # n1
    move $a1, $t1  # n2
    move $a2, $t2  # n3

    jal soma3n
    move $t3, $v0

    # Encerrar  o programa
    li $v0, 10
    syscall

# (n1, n2, n3): retorna $v0
soma3n:
    # Salvar o endereco de retorno para o main
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    jal soma

	# Parametros para soma
	move $a0, $a2  # n3
    move $a1, $v0  # soma(n1, n2)

    jal soma

	# Recuperar o $ra
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

# (a, b): retorna $v0
soma:
    add $v0, $a0, $a1
    jr $ra
