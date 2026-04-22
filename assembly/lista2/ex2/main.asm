.text
ori $t1, $zero, 0xAAAAAAAA  # Inicializar o registrador $t1
srl $t2, $t1, 1  # Mover um bit para a direita e colocar o resultado em $t2
or $t3, $t1, $t2  # Operacao or
and $t4, $t1, $t2  # Operacao and
xor $t5, $t1, $t2  # Operacao xor

# Registradores (32 bits)
# $t1 = 1010...1010; (8 conjuntos de 1010); (1010 = 0xA); (0xAAAAAAAA)
# $t2 = 0101...0101; (8 conjuntos de 0101); (0101 = 0x5); (0x55555555)

# $t3 = 1111...1111; (8 conjuntos de 1111); (1111 = 0xF); (0xFFFFFFFF)
# Operacao OR entre bits intercalados => todos os bits ligados

# $t4 = 0000...0000; (8 conjuntos de 0000); (0000 = 0x0); (0x00000000)
# Operacao AND entre bits intercalados => todos os bits desligados

# $t5 = 1111...1111; (8 conjuntos de 1111); (1111 = 0xF); (0xFFFFFFFF)
# Operacao XOR entre bits intercalados => todos os bits ligados
