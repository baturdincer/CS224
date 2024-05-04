# Title: Q4
# Author: Batur Dinçer 220201018

.data
str1: .asciiz "Enter value for a: "
str2: .asciiz "Enter value for b: "
str3: .asciiz "Enter value for c: "
result: .asciiz "Result: "

.globl main

.text
main:

    li $v0, 4               # service code for print string
    la $a0, str1        # load address of str1
    syscall		#print str1
    
    li $v0, 5               # syscall for read integer
    syscall	            #read integer
    move $s0, $v0           # store a in $s0
    
    li $v0, 4               # service code for print string
    la $a0, str2        # load address of str2
    syscall		#print str2
    
    li $v0, 5               # syscall for read integer
    syscall	            #read integer
    move $s1, $v0           # store b in $s1
    
    li $v0, 4               # service code for print string
    la $a0, str3        # load address of str3
    syscall		#print str3
    
    li $v0, 5               # service code for read integer
    syscall	            #read integer
    move $s2, $v0           # store c in $s2
    
    # Compute s = (a + b) - (c + 101)
    add $s3, $s0, $s1       # $s3 = a + b
    addi $s4, $s2, 101      # $s4 = c + 101
    sub $s5, $s3, $s4       # $s5 = ($s3) - ($s4)
    
    # Print result
    li $v0, 4               # service code for print string
    la $a0, result          # load address of result string
    syscall		    #print result
    
    li $v0, 1               # syscall for print integer
    move $a0, $s5          # load result value
    syscall		    #print integer

   #exit program
    li $v0, 10              # syscall for exit
    syscall
    
    
    #Q4.a) -56
    #Q4.b) in order to calculate s i used add, addi and sub instructions. I used $s0, $s1, $s2 registers before for a,b,c values
    # and i used  $s3, $s4, $s5 registers for keeping a+b, c-101, and (a+b)-(c+101) operations values.

