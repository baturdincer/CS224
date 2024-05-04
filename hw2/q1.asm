# Title: Q1
# Author: Batur Dinçer 220201018

.data
    strA: .asciiz "Enter A: "
    strB: .asciiz "Enter B: "
    result: .asciiz "Result of A + 2B - 5 is: "

.globl main

.text
main:
    li $v0, 4               # service code for print string
    la $a0, strA            # load address of strA
    syscall                 # print strA

    li $v0, 5               # service code for read integer
    syscall                 # read integer A
    move $s0, $v0           # save A in $s0

    li $v0, 4               # service code for print_string
    la $a0, strB            # load address of strB
    syscall                 # print strB

    li $v0, 5               # syscall for read integer
    syscall                 # read integer B
    move $s1, $v0           # save B in $s1

    mul $t0, $s1, 2         # t0 = 2B
    add $t1, $t0, $s0       # t1 = A + 2B
    li $t2, 5               # t2 = 5
    sub $t3, $t1, $t2       # t3 = A + 2B - 5

    li $v0, 4               # service code for print string
    la $a0, result          # load address of result
    syscall                 # print result msg

    li $v0, 1               # service code for print integer
    move $a0, $t3           # load result to print
    syscall                 # print the result

    li $v0, 10              # service code for exit
    syscall                 # exit
