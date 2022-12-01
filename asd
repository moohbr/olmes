# Exercicio em aula
# ler um array com 5 elementos e mostrar a soma deles

.data

N:    .word 5
arrA: .word 0 : 5 # 5 posições inicializadas com 0

# area de texto (codigo)
.text
.globl main
main:

# leitura do array
# inserir um for para ler os 5 elementos
    li    $t0, 0 # i = 0
    lw    $t1, N # i < N (5)
for0:
        beq     $t0, $t1, endfor0 # se i == 5, sai do for
        
        li	 $v0, 5
        syscall
        
        addi    $t0, $t0, 1 # i++
        j       for0 # volta para o for
endfor0:

# soma dos elementos do array
# inserir um for para somar os 5 elementos
    li    $t0, 0 # i = 0
    lw    $t1, N # i < N (5)
for1:
        beq     $t0, $t1, endfor1 # se i == 5, sai do for
        addi    $t0, $t0, 1 # i++
        j       for1 # volta para o for
endfor1:

# impressao do resultado
    la      $a0, arrA
    li      $v0, 1
    syscall
