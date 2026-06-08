.data
	PI: .float 3.14
	mensagemMenu:    .asciiz "Digite a opcao:\n1 - Area do circulo\n2 - Area do triangulo\n3 - Area do retangulo\nOpcao: "
	mensagemRaio:    .asciiz "Digite o raio do circulo: "
	mensagemBaseT:   .asciiz "Digite a base do triangulo: "
	mensagemAlturaT: .asciiz "Digite a altura do triangulo: "
	mensagemBaseR:   .asciiz "Digite a base do retangulo: "
	mensagemAlturaR: .asciiz "Digite a altura do retangulo: "
	mensagemArea:    .asciiz "Area: "

.text
	# Opcoes menu
	li $t0, 1
	li $t1, 2
	li $t2, 3

	# Ler opcao de figura geometrica
	la $a0, mensagemMenu
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	
	# Ir para a opcao desejada
	beq $v0, $t0, circulo
	beq $v0, $t1, triangulo
	beq $v0, $t2, retangulo
	
	# Encerrar programa por valor invalido
	li $v0, 10
	syscall

circulo:
	jal fCirculo
	j resultado

triangulo:
	jal fTriangulo
	j resultado

retangulo:
	jal fRetangulo
	j resultado

fCirculo:
	# raio = $f0
	# PI = $f1
	# Resultado = $f12
	la $a0, mensagemRaio
	li $v0, 4
	syscall
	li $v0, 6
	syscall
	
	# Resultado = 1
	li $t0, 1
	mtc1 $t0, $f12
	cvt.s.w $f12, $f12
	
	# Carregar o PI
	l.s $f1, PI
	
	# Resultado = PI * r * r
	mul.s $f12, $f0, $f0
	mul.s $f12, $f12, $f1
	
	# Retornar $f12
	jr $ra

fTriangulo:
	# altura = $f0
	# base = $f1
	# Resultado = $f12
	
	# Ler Base
	la $a0, mensagemBaseT
	li $v0, 4
	syscall
	li $v0, 6
	syscall
	
	mov.s $f1, $f0
	
	# Ler altura
	la $a0, mensagemAlturaT
	li $v0, 4
	syscall
	li $v0, 6
	syscall
	
	# Resultado = b * a / 2
	mul.s $f12, $f0, $f1
	li $t0, 2
	mtc1 $t0, $f0
	cvt.s.w $f0, $f0
	
	div.s $f12, $f12, $f0
	
	jr $ra

fRetangulo:
	# altura = $f0
	# base = $f1
	# Resultado = $f12
	
	# Ler Base
	la $a0, mensagemBaseR
	li $v0, 4
	syscall
	li $v0, 6
	syscall
	
	mov.s $f1, $f0
	
	# Ler altura
	la $a0, mensagemAlturaR
	li $v0, 4
	syscall
	li $v0, 6
	syscall
	
	# Resultado = b * a
	mul.s $f12, $f0, $f1
	
	jr $ra

resultado:
	# Resultado = $f12
	la $a0, mensagemArea
	li $v0, 4
	syscall
	
	li $v0, 2
	syscall

