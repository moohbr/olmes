# IF BASICO EM ASSEMBLY
	beq	$t0, $t1, then
	j	endif
then:
	add	$t2, $t3, $t4
endif:

# IF BASICO EM C

#    if (i == j) {
#        f = g + h;
#    }

# IF-ELSE BASICO EM ASSEMBLY
    beq    $t0, $t1, then
    j      else
then:
    add    $t2, $t3, $t4
    j      endif
else:
    sub    $t2, $t3, $t4
endif:
    

# IF-ELSE BASICO EM C
#        if (i == j) {
#            f = g + h;
#        } else {
#            f = g - h;
#        }

# IF-ELSE COM PRECEDENCIA
    slt   $t0, $s1, $s2
    beq   $t0, $zero, else
then:
    add   $s2m $s3, $s4
    j     endif
else:
    sub   $s2, $s3, $s4
endif:

# IF-ELSE COM PRECEDENCIA EM C
#        if (i < j) {
#            f = g + h;
#        } else {
#            f = g - h;
#        }

# Condicional composto do tipo IF - ELSE -IF - ELSE


# exercicio
# s0 -> temp. da Agua
# s1 = 1 (solido)
# s2 = 2 (liquido)
# s3 = 3 (gasoso)

# Em C
# if (s0 < 0) {
#     s1 = 1;
# } else if (s0 > 100) {
#     s1 = 3;
# } else {
#     s1 = 2;
# }

# Em Assembly
if:   
        slt $t0, $s0, $zero # if (s0 < 0) $t0 = 1; else $t0 = 0;
        beq $t0, $zero, elseif # se s0 >= 0, vai para els
then:
        addi $s1, $zero, 1 # s1 = 1
        j endif
elseif:
        addi $t1, $zero, 100 # $t1 = 100
        slt $t0, $s0, $t1 # if (s0 < 100) $t0 = 1; else $t0 = 0;
        bne $t0, $zero, else # se s0 >= 100, vai para else
then1:
        addi $s1, $zero, 3 # s1 = 3
        j endif
else:
        addi $s1, $zero, 2 # s1 = 2
        j endif
endif:

# Uso de .data

.data

sol:    .asciiz "Solido"
liq:    .asciiz "Liquido"
gas:    .asciiz "Gasoso"

.globl main

.text

main:
if:   
        slt $t0, $s0, $zero # if (s0 < 0) $t0 = 1; else $t0 = 0;
        beq $t0, $zero, elseif # se s0 >= 0, vai para els
then:
        addi $s1, $zero, 1 # s1 = 1
        la   $a0, sol
        li   $v0, 4
        syscall
        j endif
elseif:
        addi $t1, $zero, 100 # $t1 = 100
        slt $t0, $s0, $t1 # if (s0 < 100) $t0 = 1; else $t0 = 0;
        bne $t0, $zero, else # se s0 >= 100, vai para else
then1:
        addi $s1, $zero, 3 # s1 = 3
        la  $a0, gas
        li  $v0, 4
        syscall
        j endif
else:
        addi $s1, $zero, 2 # s1 = 2
        la  $a0, liq
        li  $v0, 4
        j endif
endif:

# FOR EM C
# for (i = 0; i < 10; i++) {
#     printf("%d", i);
# }

# FOR EM ASSEMBLY
    addi    $t0, $zero, 0 # i = 0
    addi    $t1, $zero, 10 # i < 10
for:
        beq     $t0, $t1, endfor # se i == 10, sai do for
        addi    $t0, $t0, 1 # i++
        j       for # volta para o for
endfor:

# Array em C
# int a[10];
# a[0] = 1;
# a[1] = 2;
# a[2] = 3;

# Array em Assembly

.data

arrA :  .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
arrB :  .word 1 : 10 # mesma coisa que arrA
arrC :  .byte 'a' : 10 # array de char (byte) 32 bits (4 bytes)
arrB :  .half 1 : 10 # arrayx de short (half) 16 bits  (2 bytes)

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
    la    $s0, arrA # $s0 = arrA
for0:
        beq     $t0, $t1, endfor0 # se i == 5, sai do for
        
        li	 $v0, 5 # leitura do teclado
        syscall
        
        sll     $s1, $t0, 2 # $s1 = i * 4
        add     $s2, $s1, $s0 # $s1 = arrA + i * 4

        sw      $v0, 0($s2) # arrA[i] = v0

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


# Lembrar de alocar o SP (stack pointer) para o fim da memoria
# lembrar que ele cresce para baixo 
# lembrar de desalocar o SP (stack pointer) para o fim da memoria