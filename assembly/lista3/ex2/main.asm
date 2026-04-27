.data
	.word 3
	.space 4
.text
	# $t0 = ponteiro para o endereco do coeficiente a
	# $t1 = pivo
	# $t2 = resultado

	lui $t0, 0x1001
	lw $t1, 0($t0)      # $t1 = a

	addi $t2, $zero, 9  # $t2 = 9
	mult $t1, $t2
	mflo $t2            # $t2 = 9a
	addi $t2, $t2, -5   # $t2 = (9a - 5)
	mult $t1, $t2
	mflo $t2            # $t2 = (9a - 5)a
	addi $t2, $t2, 7    # $t2 = ((9a - 5)a + 7)
	mult $t1, $t2
	mflo $t2            # $t2 = ((9a - 5)a + 7)a
	addi $t2, $t2, 15   # $t2 = ((9a - 5)a + 7)a + 15 = 9a^3 - 5a^2 + 7a + 15

	sw $t2, 4($t0)      # Armazenar o resultado
