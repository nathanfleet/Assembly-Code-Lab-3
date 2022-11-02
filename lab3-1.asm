# LAB 3-1
# Nathan Fleet - 10/21/22

.data
	input: .asciiz "Enter an integer: "
	sumMessage: .asciiz "The sum is: "

.text

	li $t0, 0 # start sum at zero
	
loop:
	# Display input prompt
	li $v0, 4 # 4 = code for text printing
	la $a0, input
	syscall

	# Get the input
	li $v0, 5 # 5 = code to tell the computer it is recieving and integer
	syscall
	
	# If the input is zero, then exit
	beq $v0, $0, exit
	
	# If the input is not zero, update sum
	add $t0, $t0, $v0
	
	j loop
exit:
	# Display sum message
	li $v0, 4
	la $a0, sumMessage
	syscall
	
	# Print sum
	li $v0, 1
	move $a0, $t0
	syscall