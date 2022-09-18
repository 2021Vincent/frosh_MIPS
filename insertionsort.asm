.data
A: .word 10,3,6,9,8,7,5,4,1,2
space: .asciiz " "
.text
main:
	la $a0,A
	li $a1,10
	jal isort
	add $s0,$a0,$0
	li $s1,0
	loop:
		sll $s2,$s1,2
		add $s2,$s2,$s0
		lw $a0,($s2)
		li $v0,1
		syscall
		la $a0,space
		li $v0,4
		syscall
		addi $s1,$s1,1
		slt $t0,$s1,$a1
		bne $t0,$0,loop
	j end
isort:
	li $t1,1 #t1=i
	while1:
		slt $t0,$t1,$a1
		beq $t0,$0,end1
	
		sll $t3,$t1,2
		add $t3,$t3,$a0
		lw $t3,($t3)
		
		addi $t2,$t1,-1
		
		while2:
			sll $t4,$t2,2
			add $t4,$t4,$a0
			lw $t5,($t4)
			slt $t6,$t3,$t5
			slti $t0,$t2,0
			xori $t0,$t0,1
			and $t0,$t0,$t6
			beq $t0,$0,end2
			sw $t5,4($t4)
			addi $t2,$t2,-1
			j while2
		end2:
		sw $t3,4($t4)
		addi $t1,$t1,1
		j while1
	end1:
	jr $ra
end:
