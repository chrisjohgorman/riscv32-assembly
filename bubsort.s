.section .text
.global bubsort
bubsort:
    # a0 = long *list
    # a1 = size
    # t0 = swapped
    # t1 = i
1: # do loop
    li t0, 0          # swapped = false
    li t1, 1          # i = 1
2: # for loop
    bge t1, a1, 2f    # break if i >= size
    slli t3, t1, 2    # scale i by 4 (for int)
    add t3, a0, t3    # new scaled memory address
	/* convert ld to lw for our 32 bit processor */
    lw  t4, -4(t3)    # load list[i-1] into t4
    lw  t5, 0(t3)     # load list[i] into t5
    ble t4, t5, 3f    # if list[i-1] < list[i], it's in position
    # if we get here, we need to swap
    li  t0, 1         # swapped = true
	/* convert sd to sw for our 32 bit processor */
    sw  t4, 0(t3)     # list[i] = list[i-1]
    sw  t5, -4(t3)    # list[i-1] = list[i]
3: # bottom of for loop body
    addi t1, t1, 1    # i++
    j    2b           # loop again
2: # bottom of do loop body
    bnez t0, 1b       # loop if swapped = true
    ret               # return via return address register
