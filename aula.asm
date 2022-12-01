# Escreva um programa em MIPS assembly que declare um vetor de 10 posições (.word), inicialmente inicializadas com zeros. 
# A seguir, leia do teclado os valores digitados pelo usuário e os armazene no vetor. Mostre como resposta QUANTOS e QUAIS são os valores positivos presentes no vetor,
# e QUANTOS e QUAIS são os valores negativos presentes no vetor. Coloque mensagens adequadas no seu programa para se comunicar com o usuário e apresentar a resposta. 
# Considere que o número zero, se presente no vetor, é positivo.

.data # Declaração de variáveis

N:    .word 10 # Número de elementos do vetor
vetA: .word 0 : 10 # Declaração do vetor, inicializado com zeros

intp: .word 0 # Contador de inteiros positivos
intn: .word 0 # Contador de inteiros negativos


msg0: .asciiz "Digite o valor do elemento " # Mensagem para o usuário

msg1: .asciiz "é positivo"
msg2: .asciiz "é negativo"

msg3: .asciiz "O vetor possui " # Mensagem para o usuário
msg4: .asciiz " elementos positivos: "
msg5: .asciiz " elementos negativos: "

barran: .asciiz "\n" # Quebra de linha

.text # Declaração de funções

.globl main # Função principal

main: # Função principal
# leitura do vetor
    li  $t0, 0 # $t0 = i = 0
    lw  $t1, N # $t1 = N
    la  $s0, vetA # $s0 = endereço do vetor
    lw  $t2, intp # $t2 = intp
    lw  $t3, intn # $t3 = intn

for0:
    beq $t0, $t1, end # se i == N, então fim

    li  $v0, 4 # $v0 = 4 (print string)
    la  $a0, msg0 # $a0 = endereço da mensagem
    syscall # printa a mensagem

    li  $v0, 5 # leitura do teclado
    syscall
    
    sw  $v0, 0($s0) # vetor[i] = v0
	add $t6, $zero, $v0
    # verifica se é positivo ou negativo
if:
    beq $v0, $zero, then # se v0 == 0, então poistivo
    bgt $v0, $zero, then # se v0 > 0, então positivo 

    j else # se v0 < 0, então negativo

then:
positivo:

    # mostra mensagem de positivo
    la  $a0, msg1 # $a0 = endereço da mensagem
    li  $v0, 4 # syscall para imprimir string
    syscall

    # mostra o valor
    move $a0, $t6 # $a0 = v0
    li  $v0, 1 # syscall para imprimir inteiro
    syscall

    # barra de linha
    la  $a0, barran # $a0 = endereço da mensagem
    li  $v0, 4 # syscall para imprimir string
    syscall

    # incrementa o contador de positivos
    addi $t2, $t2, 1 # $t2 = $t2 + 1
    sw  $t2, intp # intp = $t2


    j endif0 # pula para fim1

else:
negativo:

    # mostra mensagem de negativo
    la  $a0, msg2 # $a0 = endereço da mensagem
    li  $v0, 4 # syscall para imprimir string
    syscall

    # mostra o valor
    move $a0, $v0 # $a0 = v0
    li  $v0, 1 # syscall para imprimir inteiro
    syscall
    
    # barra de linha
    la  $a0, barran # $a0 = endereço da mensagem
    li  $v0, 4 # syscall para imprimir string
    syscall
    
    # incrementa o contador de negativos
    addi $t3, $t3, 1 # $t2 = $t2 + 1
    sw  $t3, intn # intn = $t2

    j endif0 # pula para fim1

endif0:

    addi $s0, $s0, 4 # advance array pointer
    addi $t0, $t0, 1 # i = i + 1

    j   for0

endfor0:
end:
    # mostra o resultado
    la  $a0, msg3 # $a0 = endereço da mensagem
    li  $v0, 4 # syscall para imprimir string
    syscall

    lw  $a0, intp # $a0 = intp
    li  $v0, 1 # syscall para imprimir inteiro
    syscall

    la  $a0, msg4 # $a0 = endereço da mensagem
    li  $v0, 4 # syscall para imprimir string
    syscall

    la  $a0, intn # $a0 = endereço da mensagem
    li  $v0, 1 # syscall para imprimir inteiro
    syscall

    la  $a0, msg5 # $a0 = endereço da mensagem
    li  $v0, 4 # syscall para imprimir string
    syscall

    la  $a0, barran # $a0 = endereço da mensagem
    li  $v0, 4 # syscall para imprimir string
    syscall

    li  $v0, 10 # syscall para encerrar o programa
    syscall