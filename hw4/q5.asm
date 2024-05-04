.data
	str1: .asciiz "Enter the n: \n"
	
.globl main1

.text
main1:
	li $v0, 4  #print sring
	la $a0, str1 #load adress of str1 to a0
	syscall #print
	li $v0, 5 #read integer
	syscall
	move $s0, $v0 #s0=n
	sll $a0, $s0, 2 #s0*4
	li $v0, 9 # create heap array
	syscall
	move $t0, $v0 #t0 = array
	
	li $t1, 0 #loop counter 1 =i
for1:
	li $t2,0 #loop counter 2 =j
	
for2:
	add $t3, $t1, $t2 #t3= i+tj
	mul $t4, $t1, $s0	#t4= i*n
	add $t4, $t4, $t2	#t4= t4+j
	sll $t4, $t4, 2		#t4=t4*4
	add $t0, $t0, $t4 # array[i][j]
	sw $t3, 0($t0) #array[i][j]= t3
	sub $t0, $t0, $t4 #array[0][0]
	bgtz $t1, if1 # if t1>0 go to if1
	bgtz $t2, if2 # if  t2>0 go to if2


print:
	add $t0, $t0, $t4  #array[i][j]
	lw $t5, 0($t0) #t5= array[i][j]
	sub $t0, $t0, $t4 #array[0][0]
	li $v0, 1 #print integer
	move $a0, $t5#print t5
	syscall
	li $v0, 11 #print character
	la $a0, ' '
	syscall
	addi $t2,$t2, 1 #j=j+1
	bne $t2, $s0, for2 #if t2 != s0 go to for2
	j for1end #jump for1end
	
if1:
	mul $s2, $s0, 4 # s2= n*4
	sub $s1, $t4 , $s2 #s1= t4-s2
	add $t0, $t0, $s1 # array[i-1][j]
	lw $t6,0($t0) #t6= array[i-1][j]
	sub $t0, $t0, $s1# array[0][0]
	add $t6, $t6, $t3 #t6=t6+t3
	add $t0, $t0, $t4 # array[i][j]
	sw $t6, 0($t0) # array[i][j]= t6
	sub $t0, $t0, $t4 # array[0][0]
	bgtz $t2, if2 # if  t2>0 go to if2
	j print jump to print
	
if2:
	add $t0, $t0, $t4# array[i][j]
	lw $s5, 0($t0) #s5= array[i][j]
	sub $t0, $t0, $t4# array[0][0]
	subi $s3, $t4, 4 #s3=t4-4
	add $t0, $t0, $s3 #  array[i][j-1]
	lw $t7,0($t0) #t7= array[i][j-1]
	sub $t0, $t0, $s3 # array[0][0]
	add $s4, $t7, $s5 # s4=t7+s5
	add $t0, $t0, $t4 # array[i][j]
	sw $s4, 0($t0) # array[i][j]= s4
	sub $t0, $t0, $t4 # array[0][0]
	j print #jup print
for1end:
	li $v0, 11 #print character
	la $a0, '\n'
	syscall
	addi $t1, $t1, 1 #i=i+1
	bne $t1, $s0, for1 # if i!=n go to for1
	


	
	
	
	
	
	
	
	
	
	
	
	
	