.data
	.space 32

.text
	lui $t0, 0x1001        # Ponteiro
	add $t1, $zero, $zero  # i
	addi $t2, $zero, 8     # 8 (const)
	addi $t3, $zero, 2     # 2 (const)

loop_1:
	slt $t4, $t1, $t2      # Se ~(i < 8)
	beq $t4, $zero, end    # Pular para o final
	div $t1, $t3           # i / 2
	mfhi $t4               # $t4 = i % 2
	beq $t4, $zero, even   # Se i % 2 == 0, pular para o even
	addi $t0, $t0 -4       # $t0 volta 4 enderecos
	lw $t4, 0($t0)         # $t4 = o valor de 4 enderecos atras
	addi $t0, $t0, 4       # $t0 avanca 4 enderecos
	sw $t4, 0($t0)         # Armazenar $t4 no endereco atual

loop_2:
	addi $t1, $t1, 1       # i++
	addi $t0, $t0, 4       # Avancar 4 enderecos
	j loop_1               # Voltar para o inicio do loop

even:
	add $t4, $t1, $t1      # $t4 = i + i = 2i
	sw $t4, 0($t0)         # Armazenar $t4 no endereco atual
	j loop_2               # Voltar para a segunda parte do loop

end:
	                       # Termina
