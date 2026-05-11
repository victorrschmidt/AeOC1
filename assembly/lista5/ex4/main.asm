.data
	n: .word 7
	f: .space 4

.text
	lui $t0, 0x1001     # Ponteiro
	addi $t1, $zero, 1  # result
	addi $t2, $zero, 2  # i
	lw $t3, 0($t0)
	addi $t3, $t3, 1    # n + 1

loop:
	beq $t2, $t3, end   # Se i == n + 1, ir para o end
	mult $t1, $t2
	mflo $t1
	addi $t2, $t2, 1
	j loop
	
end:
	sw $t1, 4($t0)      # Armazenar resultado