.text
	# Utilizaremos propriedades da logica proposicional para reduzir o numero
	# de instrucoes. Considerando que temos que verificar se $t0 pertence a um
	# dos intervalos, iremos considerar as seguintes proposicoes

	# P = (20 <= temp)
	# Q = (temp <= 40)
	# R = (60 <= temp)
	# S = (temp <= 80)

	# Sendo assim, precisamos verificar o valor-verdade da seguinte proposicao:

	# E = (P ^ Q) v (R ^ S)

	# Como o comando slt verifica somente utilizando o operador menor/maior,
	# iremos negar a proposicao E duas vezes para obter as proposicoes simples
	# negadas, para assim trabalharmos somente com o slt.

	# ~E = ~(P ^ Q) ^ ~(R ^ S)
	# ~E = (~P v ~Q) ^ (~R v ~S)

	# Ao final, iremos obter o valor de ~E, e para sabermos o valor da flag,
	# iremos simplesmente inverter o valor de ~E para saber o valor real da flag

	# ~~E = E

	# --------------------------------------------------------------------------

	# $t1 = flag
	addi $t0, $zero, 421   # Temperatura

	# Primeiro intervalo
	# Obter o valor-verdade de (~P v ~Q)
	addi $t2, $zero, 20
	addi $t3, $zero, 40

	# P = (20 <= temp) ; ~P = (temp < 20)
	# Q = (temp <= 40) ; ~Q = (40 < temp)

	slt $t4, $t0, $t2    # $t4 = ~P
	slt $t5, $t3, $t0    # $t5 = ~Q
	or $t1, $t4, $t5     # $t1 = (~P v ~Q)


	# Segundo intervalo
	# Obter o valor-verdade de (~R v ~S)
	addi $t2, $zero, 60
	addi $t3, $zero, 80

	# R = (60 <= temp) ; ~R = (temp < 60)
	# S = (temp <= 80) ; ~S = (80 < temp)

	slt $t4, $t0, $t2    # $t4 = ~R
	slt $t5, $t3, $t0    # $t5 = ~S
	or $t4, $t4, $t5     # $t4 = (~R v ~S)

	and $t1, $t1, $t4    # $t1 = ~E = (~P v ~Q) ^ (~R v ~S)
	xori $t1, $t1, 1     # $t1 = ~~E = E = (P ^ Q) v (R ^ S)
