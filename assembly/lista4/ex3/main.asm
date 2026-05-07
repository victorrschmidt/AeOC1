.data
	x: .word 19
	y: .space 4

.text
	lui $t0, 0x1001            # Ponteiro
	lw $t1, 0($t0)             # $t1 = x
	addi $t2, $zero, 3         # $t2 = i
	slt $t4, $t1, $t2
	bne $t4, $zero, end        # se x <= 2, retorna 1
	addi $t3, $zero, 1         # $t3 = a
	addi $t4, $zero, 1         # $t4 = b
	addi $t1, $t1, 1           # limite do loop (i = 3; i <= x; i++)

loop:
	beq $t2, $t1, end          # Limite do loop
	add $t4, $t3, $t4          # b = a + b
	sub $t3, $t4, $t3          # a = b - a
	addi $t2, $t2, 1
	j loop

end:
	sw $t4, 4($t0)
