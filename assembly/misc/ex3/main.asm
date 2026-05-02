.data
	.word 28
	.space 4

.text
	lui $t0, 0x1001
	lw $t1, 0($t0)
	addi $t2, $zero, 1
	sra $t3, $t1, 1
	addi $t4, $zero, 2

loop_1:
	slt $t5, $t3, $t4
	bne $t5, $zero, check
	div $t1, $t4
	mfhi $t5
	beq $t5, $zero, accumulate

loop_2:
	addi $t4, $t4, 1
	j loop_1

accumulate:
	add $t2, $t2, $t4
	j loop_2

check:
	beq $t2, $t1, return_1

return_0:
	sw $zero, 4($t0)
	j end

return_1:
	addi $t1, $zero, 1
	sw $t1, 4($t0)

end:
