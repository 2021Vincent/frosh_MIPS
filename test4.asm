#week 05
#01
#a => s0, i =>s1, b => s2, j => s3
#while (a[i]!=b[j+1]) {
#j = j +1
#i = i -1
#}
.text
loop:
	sll $t0, $s1, 2    # i*4
	add $t0, $t0, $s0 
	lw  $t1, ($t0)     # load value in $t0 to $t1
	
	addi $t2, $s3, 1
	sll $t2, $t2 ,2
	add $t2, $t2, $s2
	lw $t3,($t2)
	
	beq $t2,$t3,END
	addi $s3,$s3,1
	addi $s1,$s1,-1
	
	j Loop
END: 
