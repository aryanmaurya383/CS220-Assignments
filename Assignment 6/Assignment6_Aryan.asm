.data
  spaceBar: .asciiz "\n"
  index: .word 0, 0, 0, 0
  num: .float 0.0
  arr: .float    0.897, 0.565, 0.656, 0.1234, 0.665, 0.3434, 0.1126, 0.554, 0.3349, 0.678, 0.3656 
  bucket: .space 176
  #15*4*4 0s
  n: .word 11
  bucket_size: .word 4

.text
main:

  move $s0,$zero
  lw $s1,n
  addi $t4,$zero,4
  mul $s1,$s1,$t4
  mul $s1, $s1, $t4
  l.s $f12,num
  addi $t4,$zero,0
  IntializeLoop: slt $t4,$s0,$s1
                bne $t4,$zero,exit0
                s.s $f12,bucket($s0) 
                addi $s0,$s0,4
                j IntializeLoop

  exit0:
  lw $s0, n  #s0=n
  lw $s3, bucket_size #s1=bucket_size
  mtc1 $s3, $f9  #f9=bucket_size
  cvt.s.w $f9, $f9    
  la $s2, arr #s2=arr[]
  la $s1, bucket #s3=bucket[]
  la $s4, index #s4=index[]
  li $t4, 0 #t0=i
  
  forLoop1:
    bge $t4, $s0, exit1 #i<n
    sll $t2, $t4, 2       
    add $t2, $t2, $s2     
    lwc1 $f0, 0($t2) #$f0=arr[i]
    mul.s $f1, $f0, $f9 #n*bucket_size
    trunc.w.s $f1, $f1    
    mfc1 $t1, $f1         
    sll $t3, $t1, 2       
    mul $t5, $t3, $s0     
    add $t3, $t3, $s4 
    lw $t0, 0($t3) #t4=index[x]
    sll $t0, $t0, 2       
    add $t0, $t0, $t5     
    add $t0, $t0, $s1     
    swc1 $f0, 0($t0)     
    lw $t6, 0($t3) #t6=index[x]
    addi $t6, $t6, 1      
    sw $t6, 0($t3)        
    addi $t4, $t4, 1      
    j forLoop1            

  exit1:
    li $t1, 0 #i=0
    forLoop2:
      bge $t1, $s3, exit2 #i<bucket_size
      sll $t3, $t1, 2      
      mul $t5, $t3, $s0    
      add $a1, $t5, $s1     
      sll $t0, $t1, 2      
      add $t6, $t0, $s4 #t6=index+i
      lw $a2, 0($t6) #a2=index[x]
      li $t4, 1 #i=1
      addi $t1, $t1, 1      
      j insertionSort      
      j forLoop2            
    
    exit2:
      li $t4, 0 #i=0
      forLoop4:
        bge $t4, $s3, exit5 #i<bucket_size
        sll $t2, $t4, 2       
        mul $t5, $t2, $s0     
        add $a1, $t5, $s1 #a1=bucket+i
        sll $t1, $t4, 2       
        add $t3, $t1, $s4 #t3=index+i
        lw $a2, 0($t3)
        li $t0, 0 #j=0

        forLoop5:
          bge $t0, $a2, exit6 #j<bucket_size
          sll $t5, $t0, 2       
          add $t5, $t5, $a1     
          lwc1 $f12, 0($t5) #f0=arr[i]
          li $v0, 2 #print float
          syscall               
          li $v0, 4 #print string
          la $a0, spaceBar       
          syscall   
          addi $t0, $t0, 1    
          j forLoop5          
        
        exit6:        
        addi $t4, $t4, 1      
        j forLoop4              

      exit5:
        li $v0, 10 #exit program
        syscall               


insertionSort:
  bge $t4, $a2, exit3 #i<n
  sll $t2, $t4, 2           
  add $t2, $t2, $a1         
  lwc1 $f0, 0($t2) #$f0=arr[i]
  li $t7, 0 #i=0
  addi $t7, $t4, -1 #j=i-1
  
  forLoop3:
    blt $t7, $zero, exit4 #j>=0
    sll $t8, $t7,2          
    add $t8, $t8, $a1       
    lwc1 $f1, 0($t8) #$f1=arr[j]
    c.le.s $f1, $f0 #arr[j]<=arr[i]
    bc1t exit4              
    swc1 $f1, 4($t8) #arr[j+1]=arr[j+1]
    addi $t7, $t7, -1      
    j forLoop3             

  exit4:
    addi $t7, $t7, 1       
    sll $t9, $t7, 2        
    add $t9, $t9, $a1      
    swc1 $f0, 0($t9) #arr[j] in arr[i]
    addi $t4, $t4, 1         
    j insertionSort          
  
  exit3:
    j forLoop2               
