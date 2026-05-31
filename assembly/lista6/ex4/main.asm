.data
	size:  .word 6
	array: .word 1, 2, 3, 4, 5, 6

.text
	la $t0, array      # l = Ponteiro inicial
	lw $t1, size       # r = Ponteiro final = l + 4 * (size - 1)
	addi $t1, $t1, -1
	sll $t1, $t1, 2
	add $t1, $t1, $t0

main:
	bge $t0, $t1, return  # Se l >= r, encerrar o programa
	lw $t2, 0($t0)        # $t2 = array[l]
	lw $t3, 0($t1)        # $t3 = array[r]
	sw $t2, 0($t1)        # array[r] = $t3
	sw $t3, 0($t0)        # array[l] = $t2
	addi $t0, $t0, 4      # l++
	addi $t1, $t1, -4     # r--
	j main                # Voltar ao loop
	
return:
	nop
