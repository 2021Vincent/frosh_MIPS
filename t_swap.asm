.data
arr: .word 1,2,3,4,5,6,7,8,9
space: .asciiz " "
.text
la $s0,arr
lw $t3,($s0)
lw $t4,16($s0)
sw $t4,($s0)
sw $t3,16($s0)
li $s1,0
loop:
	sll $a0,$s1,2
	add $a0,$a0,$s0
	lw $a0,($a0)
	li $v0,1
	syscall
	la $a0,space
	li $v0,4
	syscall
	addi $s1,$s1,1
	slti $t0,$s1,9
	bne $t0,$0,loop