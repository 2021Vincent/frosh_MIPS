.data
q1: .asciiz "enter height(cm):\n"
q2: .asciiz "enter weight(kg):\n"
ans1: .asciiz "EAT more, or you gonna die @_@"
ans2: .asciiz "normal"
ans3: .asciiz "little fat, but i accept"
ans4: .asciiz "fat?"
ans5: .asciiz "too fucking fat, why don't you commit suicide=="
d18.5: .double 18.5
d24: .double 24
d27: .double 27
d30: .double 30
d100: .double 100
.text
li $v0,4
la $a0,q1
syscall
li $v0,7
syscall
add.d $f2,$f2,$f0

li $v0,4
la $a0,q2
syscall
li $v0,7
syscall
add.d $f4,$f4,$f0

l.d $f0,d100

div.d $f2,$f2,$f0
mul.d $f2,$f2,$f2
div.d $f2,$f4,$f2
li $v0,3
add.d $f12,$f12,$f2
syscall
l.d $f0,d18.5
c.lt.d $f2,$f0
bc1t L1
l.d $f0,d24
c.lt.d $f2,$f0
bc1t L2
l.d $f0,d27
c.lt.d $f2,$f0
bc1t L3
l.d $f0,d30
c.lt.d $f2,$f0
bc1t L4

li $v0,4
la $a0,ans5
syscall
j END

L1:
li $v0,4
la $a0,ans1
syscall 
j END
L2:
li $v0,4
la $a0,ans2
syscall
j END
L3:
li $v0,4
la $a0,ans3
syscall
j END
L4:
li $v0,4
la $a0,ans4
syscall
END:

