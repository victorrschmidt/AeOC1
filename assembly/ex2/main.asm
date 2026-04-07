.text
addi $t1, $zero, 4  # x
addi $t2, $zero, 8  # y
addi $t3, $zero, 5  # z
addi $t7, $zero, 4
mult $t7, $t1
mflo $t7
addi $t0, $zero, 2
mult $t0, $t2
mflo $t0
sub $t7, $t7, $t0
addi $t0, $zero, 3
mult $t0, $t3
mflo $t0
add $t7, $t7, $t0