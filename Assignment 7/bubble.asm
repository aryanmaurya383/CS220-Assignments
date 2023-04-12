# Bubble Sort in QtSpim

.data
array:  .word 5, 6, 22, 13, 1, 4, 2   # array to be sorted
n:      .word 7               # size of array
newline: .asciiz "\n"         # newline character for output

.text
.globl main

main:
    # Initialization
    la $t0, array  # address of array
    lw $t1, n      # load n
    addi $t1, $t1, -1  # n-1

    # Outer loop (i = n-1 to 0)
    addi $t2, $zero, 0      # i = 0
    outer_loop:
        beq $t2, $t1, exit  # if i == n-1, exit
        addi $t3, $zero, 0      # j = 0

        # Inner loop (j = 0 to n-1-i)
        inner_loop:
            bge $t3, $t1 , exit2  # if j >= n-1-i, exit
            sll $t4, $t3, 2   # index = j * 4
            add $t4, $t4, $t0  # index += address of array
            lw $t5, ($t4)      # load array[j]
            lw $t6, 4($t4)     # load array[j+1]
            ble $t5, $t6, no_swap  # if array[j] <= array[j+1], skip swap
            sw $t5, 4($t4)     # swap array[j] and array[j+1]
            sw $t6, ($t4)
            no_swap:
            addi $t3, $t3, 1   # j++
            j inner_loop
        exit2:
        addi $t2, $t2, 1   # i++
        j outer_loop

    exit3:
    # Print the sorted array
    la $t0, array  # address of array
    lw $t1, n      # load n
    addi $t2, $zero, 0      # i = 0
    print_loop:
        beq $t2, $t1, exit  # if i == n, exit
        sll $t3, $t2, 2   # index = i * 4
        add $t3, $t3, $t0  # index += address of array
        lw $a0, ($t3)     # load array[i]
        addi $v0, $zero, 1         # print integer syscall
        syscall
        la $a0, newline   # print newline
        addi $v0, $zero, 4         # print string syscall
        syscall
        addi $t2, $t2, 1   # i++
        j print_loop

    exit:
    addi $v0, $zero, 10    # exit program
    syscall
