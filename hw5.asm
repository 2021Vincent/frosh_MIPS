.data 
	line: .asciiz  "Enter your fucking two number"
	empty: .asciiz  ""
.text
li $v0, 4
la $a0, line
syscall 

li $v0, 4
la $a0, empty
syscall 

li $v0,5
syscall
move $t0,$v0
li $v0,5
syscall
move $t1,$v0
add $a0,$t0,$t1
li $v0,1
syscall
li $v0,10
syscall
