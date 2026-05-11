.data
	.space 32

.text
	# Para todo inteiro i no intervalo [0, 3]:
	# vetor[2i] = 4i
	# vetor[2i + 1] = 4i

	lui $t0, 0x1001        # Ponteiro
	add $t1, $zero, $zero  # i
	addi $t2, $zero, 4     # 4 (const)

loop:
	beq $t1, $t2, end      # Se i == 4, ir para end
	sll $t3, $t1, 2        # $t3 = 4i
	sw $t3, 0($t0)         # Armazenar $t3 em vetor[2i]
	addi $t0, $t0, 4       # Incrementar o ponteiro
	sw $t3, 0($t0)         # Armazenar $t3 em vetor[2i + 1]
	addi $t0, $t0, 4       # Incrementar o ponteiro
	addi $t1, $t1, 1       # i++
	j loop                 # Voltar para o loop

end:
