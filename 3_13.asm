.data
newline: .asciiz "\n"
Q1: .asciiz "enter x :\n"
Q2: .asciiz "enter y :\n"
Q3: .asciiz "enter z :\n"
ans1: .asciiz "5x+3y+z = "
ans2: .asciiz "((5x+3y+z)/2)*3 = " 
ans3: .asciiz "x^3 + 2x^2 + 3x + 4 = "
ans4: .asciiz "(4x/3)*y = "
d1: .double 1.0
d2: .double 2.0
d3: .double 3.0
d4: .double 4.0
d5: .double 5.0
.text
main:
	#enter x
	li $v0, 4
	la $a0, Q1
	syscall
	li $v0, 7
	syscall
	mov.d $f20,$f0
	
	#enter y
	li $v0, 4
	la $a0, Q2	
	syscall
	li $v0, 7
	syscall
	movf.d  $f22,$f0
	
	#enter z	
	li $v0, 4
	la $a0, Q3
	syscall
	li $v0, 7
	syscall
	movf.d $f24,$f0 

First:
	l.d $f14,d5 
	l.d $f16,d3
	mul.d $f2,$f20,$f14
	mul.d $f4, $f22,$f16
	add.d $f12,$f2,$f4
	add.d $f12,$f12,$f24

	la $a0,ans1
	jal print
Second:
	l.d $f14,d2
	l.d $f16,d3
	div.d $f12,$f12,$f14
	mul.d $f12,$f12,$f16
	
	la $a0,ans2
	jal print
third:
	l.d $f14,d2
	l.d $f16,d3
	l.d $f18,d4
	mul.d $f2,$f20,$f20
	add.d $f4,$f20,$f14
	mul.d $f2,$f2,$f4
	mul.d $f4,$f20,$f16
	add.d $f2,$f2,$f4
	add.d $f12,$f2,$f18
	
	la $a0,ans3
	jal print
	
fourth:
	l.d $f14, d3
	l.d $f16, d4
	mul.d $f2,$f20,$f16
	div.d $f2,$f2, $f14
	mul.d $f12,$f2,$f22
	
	la $a0,ans4
	jal print
	
	j END
print:
	li $v0,4
	syscall
	
	li $v0,3
	syscall
	
	li $v0,4
	la $a0,newline
	syscall
	jr $ra
END:
