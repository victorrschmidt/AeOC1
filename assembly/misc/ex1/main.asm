.data
	.word 3
	.word 14
	.space 4

.text
main:
	lui $t0, 0x1001
	lw $t1, 0($t0)
	lw $t2, 4($t0)
	addi $t3, $zero, 1
	addi $t4, $zero, 1
	addi $t5, $zero, 2

loop_1:
	beq $t2, $zero, return
	andi $t6, $t2, 1
	beq $t6, $t4, multiply

loop_2:
	mult $t1, $t1
	mflo $t1
	sra $t2, $t2, 1
	j loop_1

multiply:
	mult $t3, $t1
	mflo $t3
	j loop_2

return:
	sw $t3, 8($t0)