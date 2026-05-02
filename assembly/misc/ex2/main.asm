.data
	.word 10007
	.space 4

.text
	lui $t0, 0x1001
	lw $t1, 0($t0)
	addi $t2, $zero, 2
	slt $t3, $t1, $t2
	bne $t3, $zero, return_0

loop:
	mult $t2, $t2
	mflo $t3
	slt $t3, $t1, $t3
	bne $t3, $zero, return_1
	div $t1, $t2
	mfhi $t3
	beq $t3, $zero, return_0
	addi $t2, $t2, 1
	j loop

return_0:
	sw $zero, 4($t0)
	j end

return_1:
	addi $t1, $zero, 1
	sw $t1, 4($t0)

end:
