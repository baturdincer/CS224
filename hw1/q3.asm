# Title: Q3
# Author: Batur Dinçer 220201018


.data
str1: .asciiz "Enter your name: "
str2: .asciiz "Hello, "
input_buffer: .space 32   # Allocate space for input buffer

.globl main
.text
main:
    li $v0, 4               # service code for print string
    la $a0, str1          # load address of str1 string
    syscall		#print str1
    li $v0, 8               # service code for read string
    la $a0, input_buffer    # load address of input buffer
    li $a1, 32              # maximum length of input
    syscall
    li $v0, 4            # service code for print string
    la $a0, str2        # load address of str2 string
    syscall		#print str2
    li $v0, 4               # service code for print string
    la $a0, input_buffer    # load address of user input
    syscall
    li $v0, 10              # syscall for exit
    syscall
