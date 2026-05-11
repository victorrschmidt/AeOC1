.data
	.word 6
	.space 4

.text
	lui $t0, 0x1001        # Ponteiro
	add $t1, $zero, $zero  # i
	lw $t2, 0($t0)         # n
	addi $t3, $t2, 1       # n + 1
	addi $t4, $zero, 1     # result

loop:
	beq $t1, $t3, end      # Se i == n + 1, ir para o end
	sra $t5, $t1, 1        # $t5 = i / 2
	add $t5, $t5, $t2      # $t5 = n + i / 2
	mult $t4, $t5
	mflo $t4               # result *= $t5
	addi $t1, $t1, 1       # i++
	j loop                 # Voltar para o loop

end:
	sw $t4 4($t0)          # Armazenar resultado
