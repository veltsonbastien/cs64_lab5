# print_array.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.data
	# TODO: Write your initializations here
	prompt: .asciiz "The contents of the array are:\n" 
	

	myArray:.word 1 2 3 4 5 6 7 8 9 10
	
	endl:   .asciiz "\n" 
	
.text
printA:
    # TODO: Write your function code here

	# we are going to want to do some sort of loop...

	li $t0, 0 #base condition 
	li $t1, 10  #counter 	
	move $t2, $a0 #put array in a temp variable 
	
printLoop: 

	bge $t0, $t1,  exit_printA

	#print the number 
        li $v0, 1
        lw $a0, 0($t2) #here you get the number 
        syscall


	#print the space 
        li $v0, 4
        la $a0, endl
        syscall


	#move over address in array by 4
	addi $t2, $t2, 4

	#update counter 
	addi $t0, $t0, 1


	#continue the loop
	j printLoop


exit_printA:
	
	jr $ra

main:

	# TODO: Write your main function code here
	
	#print prompt
	li $v0, 4
	la $a0, prompt
	syscall

	#load the array into a0 
	la $a0, myArray 
	


	jal printA 

exit:
	# TODO: Write code to properly exit a SPIM simulation

	li $v0, 10
	syscall
	
