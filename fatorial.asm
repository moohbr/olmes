.data

numero:  .word 4

.text

.globl main

main:


    lw $a0, numero
    

    # finaliza a execução do programa
    j end
fatorial:
    add $t0, $zero, $a0 # i = n
    li $v0, 1 # fatorial = 1
    li $t1, 1 # i = 1
for:    
    beq $t0, $t1, endfor

    mul $v0, $v0, $t0

    sub $t0, $t0, $t1 # i = i - 1

    j for
endfor:
    jr      $ra # retorna para o main
end:
    li $v0, 10
    syscall