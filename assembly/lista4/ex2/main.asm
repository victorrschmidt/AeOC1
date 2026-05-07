.data
	y: .space 4

.text
	lui $t0, 0x1001       # Ponteiro
	addi $t1, $zero, 0    # soma
	addi $t2, $zero, 1    # i
	addi $t3, $zero, 334  # n

loop:
	beq $t2, $t3, end     # Enquanto i for diferente de n
	add $t1, $t1, $t2
	addi $t2, $t2, 1
	j loop

end:
	sw $t1, 0($t0)
