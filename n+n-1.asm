.text
	#n+(n-1)+...+3+2+1
	main:
		addi $a0,$0,6
		jal checkstop
		j END
	checkstop:
		slti $t0,$a0,1
		beq $t0,$0,re
		add $v0,$a0,$0
		jr $ra 
	re:
		#prepare re
		addi $sp,$sp,-8
		sw $a0,($sp)
		sw $ra,4($sp)
		
		addi $a0,$a0,-1
		jal checkstop
		
		#re done
		lw $t0,($sp)
		lw $t1,4($sp)
		addi $sp,$sp,8
		
		add $v0,$v0,$t0
		jr $t1
	END:
		add $a0,$0,$v0
		li $v0,1
		syscall
		
		