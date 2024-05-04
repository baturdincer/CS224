.data
arr1: .word 0:10
str1: .asciiz "Enter 10 number: \n"


.text
main1:
	li $v0, 4 # syscode for print string
	la $a0, str1
	syscall  #print string
	li $t0, 0 #initialize loop counter
	la $t1, arr1 #load array to t1
loop:
	li $v0, 5  # read integer
	syscall
	sw $v0 0($t1) #save integer
	addi $t0, $t0, 1 # increment loop counter
	addi $t1, $t1, 4 # go to next element in array
	blt $t0, 10, loop # if loop counter <10 do the same things again
	
main2: 
	li $s0,0  # sum = s0
	li $s1,0 # loop counter=s1
	la $s2, arr1 # load array to s2
	
sum:
    lw $s3, 0($s2)  #read the integer in the array
    add $s0, $s0, $s3 # increase sum with recently readed integer
    addi $s2, $s2, 4   # go to next element in the array
    addi $s1, $s1, 1   #increase loop counter
    blt $s1, 10,  sum # if loop couter less than 10 do it again
    
main3:
	li $v0, 1 # print result
	move $a0, $s0
	syscall
	
	li $v0 10 # end the program
	syscall
	 
	  
	   
	    
	     
	      
	       
	        
	         
	          
	           
	            
	             
	              
	               
	                
	                 
	                  
	                    
    