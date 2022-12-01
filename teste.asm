# Uso de .data
	addi	$s0,	$zero,	101
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