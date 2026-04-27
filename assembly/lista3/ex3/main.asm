.data
	.word -3
	.word 7
	.word 5
	.word -2
	.word 8
	.word 4
	.space 4
.text
	# $t0 = ponteiro para o endereco do coeficiente a
	# $t1 = pivo (a, b, c, d, e)
	# $t2 = x
	# $t3 = resutado

	lui $t0, 0x1001
	lw $t1, 0($t0)       # $t1 = a
	lw $t2, 20($t0)      # $t2 = x

	sub $t3, $zero, $t1  # $t2 = -a
	mult $t2, $t3
	mflo $t3             # $t3 = -ax

	lw $t1, 4($t0)       # $t1 = b
	add $t3, $t3, $t1    # $t3 = -ax + b
	mult $t2, $t3
	mflo $t3             # $t3 = (-ax + b)x

	lw $t1, 8($t0)       # $t1 = c
	sub $t3, $t3, $t1    # $t3 = (-ax + b)x - c
	mult $t2, $t3
	mflo $t3             # $t3 = ((-ax + b)x - c)x

	lw $t1, 12($t0)      # $t1 = d
	add $t3, $t3, $t1    # $t3 = ((-ax + b)x - c)x + d
	mult $t2, $t3
	mflo $t3             # $t3 = (((-ax + b)x - c)x + d)x

	lw $t1, 16($t0)      # $t1 = d
	sub $t3, $t3, $t1    # $t3 = (((-ax + b)x - c)x + d)x - e

	sw $t3, 24($t0)      # Armazenar resultado
