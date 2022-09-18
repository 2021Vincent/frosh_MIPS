.text

li $v0,54
la $a0,str_emp
la $a1,bu
lw $a2,str_siz
syscall

li $v0,59
la $a0,bu
la $a1,str_emp
syscall

.data
str_emp: .asciiz  "" 
bu: .space 51
str_siz: .word 50