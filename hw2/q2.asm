# Title: Q2
# Author: Batur Dinçer 220201018

#  Assume that $s1 = 0x12345678 and $s2 = 0xffff9a00. Determine the content of registers
#  $s3 to $s6 after executing the following instructions:

#  and $s3,$s1,$s2 # $s3 =0x12341200
#  or $s4,$s1,$s2 # $s4 =0xffffde78
#  xor $s5,$s1,$s2 # $s5 =0xedcbcc78
#  nor $s6,$s1,$s2 # $s6 =0x00002187


.globl main
.text
main:
    li $s2, 1
    li $s1, 1
    and $s3, $s1, $s2
    syscall
    li $v0, 4
    move $a0,$s3
    syscall

