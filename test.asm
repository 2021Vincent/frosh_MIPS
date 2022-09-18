li $v0, 5
syscall
move  $s1, $v0    #g=$s1

add  $s7, $s7, $0    #B[0]=$s7

add  $s6, $s6, $0    #A[0]=$s6


addi $t0, $zero, 7
sw $t0, 20($s7)    #B[5]=7 

add $t0, $0, $0
add $t0, $t0, $s1    #t0=g
sll $t0, $t0, 2
add $t0, $t0, $s7    #t0=g + B[0]
lw $t2, 0($t0)
#lw $t0,     #$t0=B[5]

addi $t1, $0, 10
sw $t1, 32($s6)    #A[8]=10
#lw $t1, 32($s6)    #$t1=A[8]

add $t3, $s6, $t2    #$t3=A[0]+B[g]
lw $t1, 4($t3) 

move $s0, $t1

li $v0, 1
move $a0, $s0
syscall