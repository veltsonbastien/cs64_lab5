#routines.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.text


routineB:
    # TODO: Write your function code here

	
	#push $ra 
	addiu $sp, $sp, -4
	sw $ra, 0($sp) 

     #we have y passed in through $a1
 	addi $t2, $a1, -5
	li $t3, 4 #4
	mult $t2, $t3 
	mflo $v0 #put the answer in v0 

	#pop $ra
	lw $ra, 0($sp)
	addiu $sp, $sp, 4

	jr $ra 

routineA:
    # TODO: Write your function code here

	sll $t0, $a0, 1 #2*x
	
	li $t1, 3 #3 
	mult $t1, $a1 #3*y
	mflo $a1 #put the answer in a1 so you can use it as an argument  

	#push $ra 
	addiu $sp, $sp, -4
	sw $ra, 0($sp) 

	jal routineB #go to routine b

	#pop $ra
	lw $ra, 0($sp)
	addiu $sp, $sp, 4

	#returns 64 [check]

	add $v0, $v0, $t0

	move $s1, $v0 #put the answer from $v0 into $s1
	
	move $t4, $v0
	addi $t4, $t4, -1
	
	move $a1, $t4

	#push $ra 
	addiu $sp, $sp, -4
	sw $ra, 0($sp) 
	
	jal routineB #go back to routine b
	

	#pop $ra
	lw $ra, 0($sp)
	addiu $sp, $sp, 4

 
	#you're done, you should have what you need in $v0 
	jr $ra 


main:

	# TODO: Write your main function code here
	li $a0, 5 #a
	li $a1, 7 #b 


	#allocate space for $sa registers 
	addiu $sp, $sp, -12


	#save the register's values 
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp) 

	#initialize $s0 and $s1 with a and b
	move $s0, $a0 #s0 has 5
	move $s1, $a1 #s1 has 7

	jal routineA 

	move $s0, $v0 

	#print it out 
	move $t4, $v0 	
	li $v0, 1
	move $a0, $t4
	syscall 

	

	#deallocate everything and restore registers 
	lw $ra, 8($sp)
	lw $s1, 4($sp) 
	lw $s0, 0($sp)
	addiu $sp, $sp, 12
	

exit:
	# TODO: Write code to properly exit a SPIM simulation

	li $v0, 10
	syscall
