.section .text
.global minmax
minmax:
    # a0 = &min (pointer to minimum value)
    # a1 = &max (pointer to maximum value)
    # a2 = a (integer a)
    # a3 = b (integer b)
    # a4 = c (integer c)
    # t0 = temporary register for comparisons
    # t1 = temporary register for comparisons

    # Set min = max = a (initially set min and max to a)
    mv      t0, a2          # t0 = a (min = a)
    mv      t1, a2          # t1 = a (max = a)

    # if (min > b) check
    bgt     t0, a3, 1f      # if min > b, skip
    mv      t0, a3          # min = b
1:
    # if (max < b) check
    blt     t1, a3, 2f      # if max < b, skip
    mv      t1, a3          # max = b
2:

    # if (min > c) check
    bgt     t0, a4, 3f      # if min > c, skip
    mv      t0, a4          # min = c
3:
    # if (max < c) check
    blt     t1, a4, 4f      # if max < c, skip
    mv      t1, a4          # max = c
4:

    # Dereference the pointers and store the result in memory
    sw      t1, 0(a0)       # store minimum into the memory location pointed to by a0 (min)
    sw      t0, 0(a1)       # store maximum into the memory location pointed to by a1 (max)
    ret                     # return via the return address register

