.data

	question: .asciiz "this is fibonacci,enter index:\n"
	
	arr: .word 0:50
.text
main:
	li $v0,4                 
	la $a0,question
	syscall
	
	#read int
	li $v0,5
	syscall
	
	#prepare $a0 and $a1         
	addi $a0,$v0,-1
	la $a1,arr #a1=arr base
	
	# arr[0]=1,arr[1]=1
	li $s1,1
	sw $s1,($a1)
	sw $s1,4($a1)
	jal re
	
	#print value
	add $a0,$v0,$0
	li $v0,1
	syscall
	j END
re:
	sll $t2,$a0,2 
	add $t2,$t2,$a1
	lw $t2,($t2)
	
	bne $t2,$0,endre

	addi $sp,$sp,-12
	sw $ra,($sp)
	sw $a0,4($sp)
	
	#compute arr[n-1]
	addi $a0,$a0,-1
	jal re
	sw $v0,8($sp)
	
	#compute arr[n-2] and add arr[n]
	lw $a0,4($sp)
	addi $a0,$a0,-2
	jal re
	lw $t2,8($sp)
	add $t2,$t2,$v0
	
	#arr[n]=arr[n-1]+arr[n-2]
	lw $a0,4($sp)
	sll $t1,$a0,2
	add $t1,$a1,$t1
	
	sw $t2,($t1)
	lw $ra,($sp)
	addi $sp,$sp,12

endre:
	add $v0,$t2,$0 # set arr[n] return value
	jr $ra
END:
