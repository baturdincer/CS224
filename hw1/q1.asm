# Title: Q1
# Author: Batur Dinçer 220201018

.data
	str1: .asciiz "Enter an integer value: "
	str2: .asciiz "Result is  "

.globl	main

.text
main:
	li $v0, 4		#service code for for print string
	la $a0, str1		#load adress of str1 into $a0
	syscall			#print str1 string
	li $v0, 5		#service code for read integer
	syscall			#read integer input into $v0
	move $s0, $v0		#save input value in $s0
	add $s0, $s0, $s0	#add $s0 value with itself and put it into $s0
	li $v0, 4		#service code for print string
	la $a0, str2		#load adress of str2 into $a0
	syscall			#print str2 string
	li $v0, 1		#service code for print integer
	move $a0, $s0		#copy doubled value
	syscall			#print integer
	li $v0,10		#service code for exit program
	syscall			#exit program
	
	