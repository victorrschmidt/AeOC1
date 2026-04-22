.text
addi $t1, $zero, 4  # b
addi $t2, $zero, 8  # h
mult $t1, $t2
mflo $t3
addi $t0, $zero, 2
div $t3, $t0
mflo $t3