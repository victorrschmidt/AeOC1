.data
	result: .space 4
	left: .word 4
	right: .word 12
	ptr: .word 0x10010014
	size: .word 5
	a0: 7
	a1: 14
	a2: 53
	a3: 5
	a4: 3
	# Palavras do array...

.text
	lui $t0, 0x1001        # Ponteiro
	lw $s0, 4($t0)         # left
	lw $s1, 8($t0)         # right
	lw $s3, 12($t0)        # ptr
	lw $s4, 16($t0)        # size
	sll $s4, $s4, 2        # endereco final = ptr + 4 * size
	add $s4, $s4, $s3
	add $t1, $zero, $zero  # contador

loop:
	beq $s3, $s4, end      # Se $s3 = endereco final, pular para o end
	lw $t2, 0($s3)         # $t2 = vetor[$s3]
	slt $t3, $t2, $s0      # $t3 = ($s0 <= $t2 ^ $t2 <= $s1) <=> ~($s0 > $t2 v $t2 > $s1)
	slt $t4, $s1, $t2
	or $t3, $t3, $t4
	xori $t3, $t3, 1
	add $t1, $t1, $t3	
	addi $s3, $s3, 4
	j loop

end:
	sw $t1, 0($t0)
	