
.data
newline: .asciiz "\n"
quarter: .asciiz " quarters, "
dime: .asciiz " dime, "
nickel: .asciiz " nickel, "
and: .asciiz " and "
penny: .asciiz " penny"
.text
main:
	li $v0,5
	syscall
	move $s0,$v0
	li $t1,25
	li $t2,10
	li $t3,5
	
	div  $s0,$t1
	mflo $s1
	mfhi $s0
	
	div $s0,$t2
	mflo $s2
	mfhi $s0
	
	div $s0,$t3
	mflo $s3
	mfhi $s4

	la $a0,($s1)
	jal printn
	la $a0,quarter
	jal prints
	
	
	la $a0,($s2)
	jal printn
	la $a0,dime
	jal prints
	
	
	la $a0,($s3)
	jal printn
	la $a0,nickel
	jal prints
	
	
	la $a0,($s4)
	jal printn
	la $a0,penny
	jal prints
	j END
	
prints:
	li $v0,4
	syscall
	jr $ra
	
printn:
	li $v0,1
	syscall
	jr $ra
END:
