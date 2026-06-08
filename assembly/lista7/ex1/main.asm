.data
	stringMedia: .asciiz "Media: "

.text
	# Ler os valores em $s0, $s1 e $s2
	li $v0, 5
	syscall
	move $s0, $v0

	li $v0, 5
	syscall
	move $s1, $v0

	li $v0, 5
	syscall
	move $s2, $v0

	# Calcular e mostrar a media
	la $a0, stringMedia
	li $v0, 4
	syscall

	jal media
	move $a0, $t5
	li $v0, 1
	syscall

	# Encerrar o programa
	li $v0, 10
	syscall

media:
	# Calcular a media
	add $t5, $zero, $s0
	add $t5, $t5, $s1
	add $t5, $t5, $s2
	li $t0, 3
	div $t5, $t0
	mflo $t5
	jr $ra
