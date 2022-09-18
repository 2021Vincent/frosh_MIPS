mips

addi $sp,$sp,-4
add $t0, $a0, $a1
addi $a0, $a0, 1 #a0=a
subi $a1, $a1, 2 #a1=b
sw $a1, 0($sp)
jal foo
lw $a1, 0($sp)
add $a0, $v0, $t0 #a0=foo(a+1,b-2)+a+b
sub $v0, $a0, $a1 #v0=foo(a+1,b-2)+a+b-(b-2)
addi $sp,$sp, 4
jr $ra

c
int func(int a,int b){
	int tmp = a+b
	a+=1;
	b-=2;
	return foo(a,b)+tmp-b;
}