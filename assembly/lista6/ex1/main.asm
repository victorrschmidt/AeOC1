.data
    string: .asciiz "S  trin g ch  e ia de bura co  s."

.text
    la $t0, string               # $t0 = i
    li $t1, 32                   # $t1 = Caracter de espaco (' ')

main1:
    lbu $t2, 0($t0)              # $t2 = *i
    beq $t2, $zero, return       # Se *i == '\0', encerrar o programa
    beq $t2, $t1, removeSpaces1  # Se *i == ' ', ir para a funcao de remover espacos

main2:
    lbu $t2, 0($t0)              # $t2 = *i
    beq $t2, $t1, removeSpaces1  # Se *i == ' ', nao podemos incrementar o ponteiro i, pois o caracter continua sendo um espaco
    addi $t0, $t0, 1             # i++
    j main1                      # Voltar para o loop principal

removeSpaces1:
    move $t2, $t0                # $t2 = j

removeSpaces2:
    lbu $t3, 0($t2)              # $t3 = *j
    beq $t3, $zero, main2        # Se *j == '\0', voltar para o loop principal
    lbu $t4, 1($t2)              # $t4 = *(j + 1)
    sb $t4, 0($t2)               # *j = *(j + 1)
    addi $t2, $t2, 1             # j++
    j removeSpaces2              # Voltar pra o loop de remover espacos

return:
    nop