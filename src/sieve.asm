.data

primes:		.space  1000            # reserves a block of 1000 bytes in application memory
err_msg:	.asciiz "Invalid input! Expected integer n, where 1 < n < 1001.\n"

### Executable Code Section ###

.text

main:
    # get input
    li      $v0,5                   # set system call code to "read integer"
    syscall                         # read integer from standard input stream to $v0

    # validate input
    li 	    $t0,1001                # $t0 = 1001
    slt	    $t1,$v0,$t0		        # $t1 = input < 1001
    beq     $t1,$zero,invalid_input # if !(input < 1001), jump to invalid_input
    nop
    li	    $t0,1                   # $t0 = 1
    slt     $t1,$t0,$v0		        # $t1 = 1 < input
    beq     $t1,$zero,invalid_input # if !(1 < input), jump to invalid_input
    nop
    
    # initialise primes array
    la	    $t0,primes              # $s1 = address of the first element in the array
    li 	    $t1,999
    li 	    $t2,1
    li	    $t3,1
init_loop:
    sb	    $t2, ($t0)              # primes[i] = i + 1
    addi    $t0, $t0, 1             # increment pointer
    addi    $t2, $t2, 1             # increment counter
    bgt	    $t2, $t1, init_loop     # loop if counter != 999
    
    ### Continue implementation of Sieve of Eratosthenes ###
    
    li 		$t4, 2					# set current prime to 2
    

startsearch:
	move	$t0, $t4				# reset pointer
	subi	$t2, $t2, 999			# reset counter
	bne 	primes($t0), 1001, search		# if number not proven composite by being set to 1001 then search
	j	 	breaksearch				
    

search:
	bne 	primes($t0), 1001, breaksearch	# if the number is too big then break the search
	add 	$t0, $t0, $t4				# move the ptr forward by the current prime
	sb		$t2, primes($t0)
	j 		search
	

breaksearch:
	bgt 	$t4, 31, print			# if prime is larger than 31, we are done because sqrt 1000 ~= 31
	addi 	$t4, $t4, 1				# increment current prime and try again
	j 		startsearch
	
	
    
	
	
	


    ### Print nicely to output stream ###
print:
	li		$t0, 0
	
printcont:

        
    # exit program
    j       exit_program
    nop

invalid_input:
    # print error message
    li      $v0, 4                  # set system call code "print string"
    la      $a0, err_msg            # load address of string err_msg into the system call argument registry
    syscall                         # print the message to standard output stream

exit_program:
    # exit program
    li $v0, 10                      # set system call code to "terminate program"
    syscall                         # exit program