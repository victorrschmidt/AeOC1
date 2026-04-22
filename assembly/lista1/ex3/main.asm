.text
addi $t5, $zero, 42  # x
addi $t6, $zero, 3
mult $t6 $t5
mflo $t6
mult $t6, $t5
mflo $t6
addi $t0, $zero, 5
mult $t0, $t5
mflo $t0
sub $t6, $t6, $t0
addi $t6, $t6, 13
