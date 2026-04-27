.data
	.word 3
	.word 5
	.space 4
.text
	# $t0 = ponteiro para o endereco do coeficiente a
	# $t1 = pivo
	# $t2 = pivo
	# $t3 = resultado

	lui $t0, 0x1001     # $t0 = *a
	lw $t1, 0($t0)      # $t1 = a
	lw $t2, 4($t0)      # $t2 = b

	mult $t1, $t2
	mflo $t3            # $t3 = ab
	sll $t3, $t3, 5     # $t3 = 32ab

	addi $t2, $zero, 3  # $t2 = 3
	mult $t1, $t2
	mflo $t2            # $t2 = 3a
	sub $t3, $t3, $t2   # $t3 = 32ab - 3a

	lw $t1, 4($t0)      # $t1 = b
	addi $t2, $zero, 7  # $t2 = 7
	mult $t1, $t2
	mflo $t2            # $t2 = 7b
	add $t3, $t3, $t2   # $t3 = 32ab - 3a + 7b

	addi $t3, $t3, -13  # $t3 = 32ab - 3a + 7b - 13

	sw $t3, 8($t0)      # Armazenar o resultado
