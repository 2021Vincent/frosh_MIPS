.data
arr: .word 3,2,1,10,4,6,5,7,9,41
space: .asciiz " "
.text
main:
    la $a0,arr
    li $a1,10
    jal selsort
    add $s0,$a0,$0
    li $s1,0	                 # s1=i
    Lp:
		sll $s2,$s1,2
		add $s2,$s2,$s0
		lw $a0,($s2)
		li $v0,1
		syscall
		la $a0,space
		li $v0,4
		syscall
		addi $s1,$s1,1           # i++
		slti $t0,$s1,10
		bne $t0,$0,Lp
    j exit
selsort:
    addi $sp,$sp,-4
    sw $a1,($sp)                 # a1=i
    Loop1:
        li $t3,0                 # t3=max=0
        li $t1,0                 # t1=j=0
        Loop2:
            sll $t2,$t1,2
            add $t2,$a0,$t2
            lw $t2,($t2)         # t2=arr[j]
            slt $t0,$t3,$t2
            beq $t0,$0,skip
            
            	add $t3,$t2,$0   # max=arr[j]
            	add $t4,$t1,$0   # t4=index 
            
            skip:
            addi $t1,$t1,1       # j++
            
            slt $t0,$t1,$a1  
            bne $t0,$0,Loop2 
        
        #swap value
        sll $t4,$t4,2        
        add $t4,$t4,$a0
        lw $t5,($t4)             # t4=arr+index,t5=*(arr+index)
        addi $t2,$a1,-1
        sll $t2,$t2,2
        add $t2,$t2,$a0
        lw $t6,($t2)             # t2=arr+i-1,t6=*(arr+i-1)
        sw $t5,($t2)
        sw $t6,($t4)
        addi $a1,$a1,-1 
        slt $t0,$0,$a1
        bne $t0,$0,Loop1
    lw $a1,($sp)
    addi $sp,$sp,4
   
    jr $ra
exit:
