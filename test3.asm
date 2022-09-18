.data
    arr: .word 1,2,3,4,5,6,7
    space: .word 7
    emp: .asciiz " "
.text
    main:
        la $s0, arr
        
        lw $t1, 4($s0)        # t1=A[1]
        lw $t2, 8($s0)        # t2=A[2]
        lw $t3,12($s0)        # t3=A[3]
        lw $t4,16($s0)        # t4=A[4]
        
        bne $t2, $t3, notEq
        add $t0, $t3, $t4      # t0=A[3]+A[4]
        sw $t0, 20($s0)        # A[5]=A[3]+A[4]
        j B1
    
    notEq:
        sw $t4, 24($s0)        # A[6]=A[4]

    B1:
    	la $a1, space
    	la $t5,($v0)
    	li $t6,0
        Loop:
        	bge $t5,$a1,END
       		la $a0, ($t5)
        	li $v0, 1
        	syscall
        	
        	la $a0, emp
        	li $v0, 4
        	syscall
        	
        	la $t5,4($t5)
        	add $t6,$t6,1
        	j Loop	
	END:
		li $v0, 10
		syscall
