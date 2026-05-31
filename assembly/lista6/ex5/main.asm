.data
	tamanho: .word 7
	vetor1:  .word -30, -23, 56, -43, 72, -18, 71
	vetor2:  .word 45, 23, 21, -23, -82, 0, 69
	soma:    .word 0, 0, 0, 0, 0, 0, 0

.text
	la $t0, soma     # Ponteiro k (vetor de soma)
	la $t1, vetor1   # Ponteiro i (vetor 1)
	la $t2, vetor2   # Ponteiro j (vetor 2)
	lw $t3, tamanho  # Tamanho do array

main:
	beq $t3, $zero, return  # Se todos os N elementos foram processados, encerrar o programa
	lw $t4, 0($t1)          # $t4 = *i
	lw $t5, 0($t2)          # $t5 = *j
	add $t4, $t4, $t5       # $t4 += $t5
	sw $t4, 0($t0)          # *k = $t4
	addi $t0, $t0, 4        # k++
	addi $t1, $t1, 4        # i++
	addi $t2, $t2, 4        # j++
	addi $t3, $t3, -1       # n--
	j main

return:
	nop