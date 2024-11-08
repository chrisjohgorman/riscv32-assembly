.section .text
.global binsearch
binsearch:
    # a0 = pointer to array arr[]
    # a1 = needle (value to search)
    # a2 = size of array
    # t0 = mid
    # t1 = left
    # t2 = right
    # t4 = arr[mid] (for comparison)

    li      t1, 0            # left = 0
    addi    t2, a2, -1       # right = size - 1

1:  # while loop
    bgt     t1, t2, 2f       # if left > right, exit loop

    add     t0, t1, t2       # mid = left + right
    srai    t0, t0, 1        # mid = (left + right) / 2

    # Get the element at the midpoint: arr[mid]
    slli    t4, t0, 2        # Scale the mid index by 4 (for word-size)
    add     t4, a0, t4       # t4 = arr + mid * 4 (address of arr[mid])
    lw      t4, 0(t4)        # t4 = arr[mid]

    # Compare needle with arr[mid]
    beq     a1, t4, 3f       # if needle == arr[mid], return mid

    blt     a1, t4, 4f       # if needle < arr[mid], adjust right
    # If we get here, needle > arr[mid], adjust left
    addi    t1, t0, 1        # left = mid + 1
    j       1b

4:  # if needle < arr[mid], adjust right
    addi    t2, t0, -1       # right = mid - 1
    j       1b

3:  # if needle == arr[mid], return mid
    mv      a0, t0           # return mid in a0
    ret

2:  # exit loop if needle is not found
    li      a0, -1           # return -1 (not found)
    ret

