.text
addi $t1, $zero, 4  # x
addi $t2, $zero, 9
mult $t2, $t1
mflo $t2
addi $t2, $t2, 7
addi $t3, $zero, 2
mult $t3, $t1
mflo $t3
addi $t3, $t3, 8
div $t2, $t3
mflo $t2
mfhi $t3