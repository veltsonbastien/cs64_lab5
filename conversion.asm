# conversion.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.text
conv:
    # TODO: Write your function code here
	
	#set a temporary for the number 5 for comparison
	
	
	li $v0, 0 #z 
	li $t1, 0 #i 
	li $t2, 5 # for comparison

	
loop: 


	#if greater than or equal, break out of this loop
	bge $t1, $t2, conv_exit



	#set z = z+2*x-y
	sll $t3, $a0, 1    #2*x in a temp variable 
	add $v0, $v0, $t3  #z+2*x
	sub $v0, $v0, $a1  #(z+2*x)-y

	 	
	#set a temp for the number 3 for comparision
	li $t4, 3



	#do a branch to do the subtraction from y
 	bge $a0, $t4, decreaseY
	
	#assuming that the subtraction happened, we move on and add 1 to x
	addi $a0, $a0, 1


	#increment the counter 
	addi $t1, $t1, 1


	#loop
	j loop



conv_exit: 
	jr $ra



decreaseY: 
	#subtract 1 from y
	addi $a1, $a1, -1
	addi $a0, $a0, 1		
	addi $t1, $t1, 1
	j loop

main:

	# TODO: Write your main function code here
	#set variables 
	li $a0, 5 #a
	li $a1, 7 #b

	#go to conv function 
	jal conv

        
 	move $t5, $v0
	li $v0, 1
	move $a0, $t5
	syscall
	
	

exit:
	# TODO: Write code to properly exit a SPIM simulation
	

	li $v0, 10
	syscall

