.data
.text
main:
addi $t2 $0 5;
addi $t1 $0 -10;
addu $a0 $t1 $t2;
li $v0 1;
syscall
li $v0 10;
syscall