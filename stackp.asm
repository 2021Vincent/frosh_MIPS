.data
	newline: .asciiz "\n"
.text
	main:
		addi $s0, $0, 10
		jal func
		
		# $s0 shouldn't be modified bcz s rigister can't be accessed 
		# by callee(in this case, func)by convention )
		# i.e. we have to use $sp to save the old value 
		# so when we come back ,value in $s0 remains the same
		li $v0, 1
		move $a0, $s0
		syscall
		
		j END
		
	func:
		addi $sp, $sp , -4 # allocate stack
		sw $s0, ($sp)      # store s0 in stack
		addi $s0, $s0, 50  # do sth(+50)
		
		li $v0, 1
		move $a0, $s0
		syscall
		
		li $v0, 4
		la $a0, newline
		syscall
		
		lw $s0 ,($sp)      # restore value
		addi $sp, $sp, 4   # free stack
		
		jr $ra             #return to the line "jal func"
	END: