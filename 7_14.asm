7.9.14
.data
odd: .asciiz "The number is odd."
even: .asciiz "The number is even."
.text
	li $v0,5
	syscall
	add $t0,$v0,$0
	add $t1,$v0,$0
	srl $t0,$t0,1
	sll $t0,$t0,1
	bne $t0,$t1,LL
	la $a0,even
	j print
LL:
	la $a0,odd
print:
	li $v0,4
	syscall
