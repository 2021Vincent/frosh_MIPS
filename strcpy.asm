.data
string: .asciiz "fuckyou"
s1: .asciiz ""
.text 
la $a0,string
la $a1,s1

li $v0,4
syscall

jal strcpy
add $a0,$a1,$0
li $v0,4
syscall

li $v0,10
syscall

strcpy:
addi $sp,$sp,-4
sw $s0,($sp)
li $s0,0
while:
add $t1,$s0,$a0
lbu $t3,($t1)
add $t2,$s0,$a1
sb  $t3,($t2)
beq $t3,$0,exit
addi $s0,$s0,1
j while
exit:
lw $s0,($sp)
addi $sp,$sp,4
jr $ra
