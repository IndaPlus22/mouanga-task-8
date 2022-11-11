# We are multiplying 2 numbers, a and b

li $a0, 20 # numbers to multiply
li $a1, 10

li $a2, 4 # number to factorialize (?)

jal forf1
# jal forf2

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

endme: 
	jr $ra

# We are taking the factorial of a number a

forf2:
	li $t3, 1 # set result to 1 at start
	move $t4, $0 # for loop counter
	move $t5, $a2 # a
	move $t6, $0 # result
	jal startf2

startf2:
	beq $t4, $t5, endme # if loop not finished then continue, else do nothing
	addi $t4, $t4, 1 # increment counter
	addi $t9, $t9, 1
	subi $a2, $a2, 1
	move $t0, $0 # for loop counter
	move $t1, $a2 # set first number to multiply to a
	move $t2, $t3 # set second number to multiply to the old result
	jal startf1 # multiply the numbers
	blt $t4, $t5, startf2 # attempt to redo above code, else return result
	move $a0, $t3

	

nope:
	nop



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