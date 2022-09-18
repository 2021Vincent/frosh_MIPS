.text

sll $s3,$s3,2   #i
add $t0,$s6,$s3 #A{i}

lw $t1,24($s6)  #A[6]

sll $s4,$s4,2   #j
add $t2,$s4,$s7 #B[j]

lw $t2,8($t2)   #B[j+2]

sub $t3,$t1,$t2 #A[6]-B[j+2]
sw $t3,12($t0)  #A[i+3] = A[6]-B[j+2]