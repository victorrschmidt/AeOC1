.text
ori $t1, $zero, 0x1  # $t1 = 0b00000000000000000000000000000001
sll $t2, $t1, 1      # $t2 = 0b00000000000000000000000000000010
or $t1, $t1, $t2     # $t1 = 0b00000000000000000000000000000011
sll $t2, $t1, 2      # $t2 = 0b00000000000000000000000000001100
or $t1, $t1, $t2     # $t1 = 0b00000000000000000000000000001111
sll $t2, $t1, 4      # $t2 = 0b00000000000000000000000011110000
or $t1, $t1, $t2     # $t1 = 0b00000000000000000000000011111111
sll $t2, $t1, 8      # $t2 = 0b00000000000000001111111100000000
or $t1, $t1, $t2     # $t1 = 0b00000000000000001111111111111111
sll $t2, $t1, 8      # $t2 = 0b00000000000000001111111100000000
or $t1, $t1, $t2     # $t1 = 0b00000000000000001111111111111111
sll $t2, $t1, 16     # $t2 = 0b11111111111111110000000000000000
or $t1, $t1, $t2     # $t1 = 0b11111111111111111111111111111111

# Utilizamos dois registradores para fazer a operacao de OR
# para ligar os bits 2^i bits, e para cada operacao, movemos
# os 2^i que foram ligadoos para fazer outro OR com os bits
# ligados do registrador anterior, fazendo assim log2(32) operacoes
