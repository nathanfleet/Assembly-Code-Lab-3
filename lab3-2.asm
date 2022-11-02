# LAB 3-2
# Nathan Fleet - 10/21/22

.data
	firstInt: .asciiz "Enter first integer: "
	secondInt: .asciiz "Enter second integer: "
	thirdInt: .asciiz "Enter third integer: "
	sumMessage: .asciiz "The sum of the largest two integers is: "
	
.text
	# Display first input prompt
	li $v0, 4
	la $a0, firstInt
	syscall

	# Get the first input
	li $v0, 5
	syscall
	move $t0, $v0
	
	# Display second input prompt
	li $v0, 4
	la $a0, secondInt
	syscall

	# Get the second input
	li $v0, 5
	syscall
	move $t1, $v0
	
	# Display third input prompt
	li $v0, 4
	la $a0, thirdInt
	syscall

	# Get the third input
	li $v0, 5
	syscall
	move $t2, $v0
	
	# if first int is gt second int, add first int to sum
	bgt $t0, $t1, jump1
	# else
	j skip2
	
	# if second int is gt than third int, second int to sum
	skip1:
	bgt $t1, $t2, jump2
	# else, if third int is gt than second int, add third int to sum
	add $t3, $t3, $t2
	# done
	j end
	
	jump1: 
	# add first int to sum
	move $t3, $t0
	j skip1
	
	jump2: 
	# add second int to sum
	add $t3, $t3, $t1
	# done
	j end
	
	skip2:
	# if second int is gt than first int, add second int to sum
	move $t3, $t1
	# if first int is greater than third int, add first int to sum
	bgt $t0, $t2, jump3
	# else
	j skip3
	
	jump3:
	# add first int to sum
	add $t3, $t3, $t0
	# done
	j end
	
	skip3:
	# add third int to sum
	add $t3, $t3, $t2
	# done
	j end
	
	end:
	# Display sum message
	li $v0, 4
	la $a0, sumMessage
	syscall
	
	# Print sum
	li $v0, 1
	move $a0, $t3
	syscall