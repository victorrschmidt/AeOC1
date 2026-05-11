.data
	a: .word 3
	b: .word 7
	c: .word 6
	m: .space 4

.text
	lui $t0, 0x1001         # Bubble sort
	lw $t1, 0($t0)
	lw $t2, 4($t0)
	lw $t3, 8($t0)
	slt $t4, $t2, $t1
	bne $t4, $zero, swap_1

main_1:
	slt $t4, $t3, $t2
	bne $t4, $zero, swap_2

main_2:
	slt $t4, $t2, $t1
	bne $t4, $zero, swap_3
	j end

swap_1:                     # Trocar o valor dos registradores $t1 e $t2
	xor $t1, $t1, $t2
	xor $t2, $t1, $t2
	xor $t1, $t1, $t2
	j main_1

swap_2:                     # Trocar o valor dos registradores $t2 e $t3
	xor $t2, $t2, $t3
	xor $t3, $t2, $t3
	xor $t2, $t2, $t3
	j main_2

swap_3:                     # Trocar o valor dos registradores $t1 e $t2
	xor $t1, $t1, $t2
	xor $t2, $t1, $t2
	xor $t1, $t1, $t2

end:
    sw $t2, 12($t0)         # Armazenar o valor      