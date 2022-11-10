# We are multiplying 2 numbers, a and b

li $a0, 2
li $a1, 16
li $a2, 6
jal forf1 # forf1 = multiply,






forf1:
	move $t0, $0  # for loop counter
	move $t1, $a0 # a
	move $t2, $a1 # b
	move $t3, $0  # result
	jal startf1 # loop
	


startf1:
	beq $t0, $t1, nope # if loop not finished then continue, else do nothing 
	addi $t0, $t0, 1 # increment counter
	
	add $t3, $t3, $t2 # add b to result (this is done a times)
	
	blt $t0, $t1, startf1 # attempt to redo above code, else return result
	move $a0, $t3
	jr $ra




# We are taking the factorial of a number a

forf2:
	move $t4, $0  # for loop counter
	move $t5, $a2 # a
	move $t6, $0  # result
	jal startf2 # loop
	


startf2:
	beq $t0, $t1, nope # if loop not finished then continue, else do nothing
	addi $t4, $t4, 1 # increment counter
	
	add $t3, $t3, $t2 # add b to result (this is done a times)
	
	blt $t0, $t1, startf2 # attempt to redo above code, else return the result
	move $a0, $t6
	jr $ra

nope:
	nop


# trying multioply function

li $v0, 1
syscall





# end program
li $v0, 10
syscall
















# ignore this
# .data
# hellow: .asciiz "Hello World!\n"

# .text


# la $a0, hellow
# li $v0, 4
# syscall