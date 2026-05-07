.data
	a: .half 60
	b: .half 4
	y: .space 4

.text
	lui $t0, 0x1001       # Ponteiro
	lh $t1, 0($t0)        # $t1 = a
	lh $t2, 2($t0)        # $t2 = b
	bne $t1, $t2, divide
	mult $t1, $t2         # Multiplica
	j end

divide:
	div $t1, $t2          # Divide

end:
	mflo $t1
	sw $t1, 4($t0)
