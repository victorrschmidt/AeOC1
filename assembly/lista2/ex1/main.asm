.text
and $t7, $t7, $zero  # Inicializar o registrador $t7
ori $t7, $t7, 0xD  # Incluir D
sll  $t7, $t7, 4
ori $t7, $t7, 0xE  # Incluir E
sll  $t7, $t7, 4
ori $t7, $t7, 0xC  # Incluir C
sll  $t7, $t7, 4
ori $t7, $t7, 0xA  # Incluir A
sll  $t7, $t7, 4
ori $t7, $t7, 0xD  # Incluir D
sll  $t7, $t7, 4
ori $t7, $t7, 0xA  # Incluir A
sll  $t7, $t7, 4
ori $t7, $t7, 0x7  # Incluir 7
sll  $t7, $t7, 4
ori $t7, $t7, 0x0  # Incluir 0

# Cada caracter hexadecimal ocupa 4 bits de memoria, portanto eh necessario
# shiftar cada conjunto de 4 bits para a esquerda para concatenar outro caracter
