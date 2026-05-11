.text
	add $t0, $zero, $zero  # Contador
	ori $t1, $zero, 42
	
loop:
	beq $t1, $zero, end    # Enquanto $t1 for diferente de 0
	andi $t2, $t1, 1       # $t2 = LSB($t1)
	add $t0, $t0, $t2      # Contador += $t2
	sra $t1, $t1, 1        # $t1 >>= 1
	j loop

end:
	