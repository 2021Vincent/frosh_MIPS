.text
    main:
        addi $a0,$0,12    # set n = 12 
        jal fact
        j exit
    fact:                    # f() ~~factorial~~ fibonacci f(n)
        addi $sp,$sp,-16    # request stack spaces
        sw $a0,0($sp)         # a0 = n-> 0sp
        sw $ra,4($sp)         # ra = store caller address -> 4sp
        
        bgt $a0,1,re        # if a0 -> n > 1 :re (call f(n))
                            # if n < 1 do something under
        add $v0,$a0,$0      # v0 = a0 = n set return value
        lw $t0,4($sp)        # t0 = origin caller address 
        addi $sp,$sp,16     # restore stack
        jr $t0                # return to caller
        re:    
            lw $t0,($sp)    # t0 = n
            addi $a0,$t0,-1    # a0 = n-1
            jal fact        # f(n-1)
            sw $v0,8($sp)    # v0 = return value = f(n-1) -> 8sp
        
            lw $t0,($sp)    # t0 = n
            addi $a0,$t0,-2 # a0 = n-2
            jal fact        # f(n-2)
            sw $v0,12($sp)    # v0 = return value = f(n-2) -> 12sp
        
            lw $t0,8($sp)    # f(n-1)
            lw $t1,12($sp)    # f(n-2)
            add $v0,$t0,$t1 # f(n-1)+f(n-2)
        
            lw $t0,4($sp)    # t0 = caller address
            addi $sp,$sp,16 # restore stack
            jr $t0            # return to caller
        
    exit:
        add $a0,$0,$v0        # move return value to a0
        addi $v0,$0,1        
        syscall  