# Title: Q5
# Author: Batur Dinçer 220201018

.data
str1: .asciiz "Enter the first integer: "
str2: .asciiz "Enter the second integer: "
equal_msg: .asciiz "equal"
not_equal_msg: .asciiz "not equal"

.globl main

.text
main:
    # print str1
    li $v0, 4               # service code for print string
    la $a0, str1        # load address of str1 for the first integer
    syscall
    
    # Read the first integer
    li $v0, 5               # service code for read integer
    syscall
    move $s0, $v0           # store the first integer in $s0
    
    #print str2
    li $v0, 4               # service code for print string
    la $a0, str2        # load address of str2 for the second integer
    syscall
    
    # Read the second integer
    li $v0, 5               # service code for read integer
    syscall
    move $s1, $v0           # store the second integer in $s1
    
    # Check for equality
    beq $s0, $s1, equal     # branch to equal if the first integer equals the second integer
    bne $s0, $s1, notequal  #branch to notequal if the first integer not equals the second integer
    
    # Output "not equal" if the two integers are not equal then end program
notequal:
    li $v0, 4               # service code for print string
    la $a0, not_equal_msg   # load address of the "not equal" message
    syscall
    j end                   # jump to end
    
equal:
    # Output "equal" if the two integers are equal then end program
    li $v0, 4               # service code for print string
    la $a0, equal_msg       # load address of the "equal" message
    syscall
    j end
    
end:
    # Exit program
    li $v0, 10              # syscall for exit
    syscall
