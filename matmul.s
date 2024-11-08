.section .text
.global matmul
matmul:
    # a0 = dst[3]       # Destination array (integer)
    # a1 = matrix[3][3]  # Matrix (3x3) - pointer to first element (int)
    # a2 = vector[3]     # Vector (3) - pointer to first element (int)
    # t0 = r (row index)
    # t1 = c (column index)
    # t3 = 3 (loop limit for matrix dimensions)

    li      t0, 0          # Initialize row index r = 0
    li      t3, 3          # Set the loop limit (matrix is 3x3)

1:  # Row for loop
    bge     t0, t3, 1f     # If row index r >= 3, break loop (end of rows)
    li      t2, 0          # Initialize the destination value d = 0

    # Column for loop
    li      t1, 0          # Initialize column index c = 0
2:
    bge     t1, t3, 2f     # If column index c >= 3, break loop (end of columns)
    
    lw      t4, 0(a1)      # Load matrix[r][c] into t4
    lw      t5, 0(a2)      # Load vector[c] into t5

    mul     t6, t4, t5     # t6 = matrix[r][c] * vector[c]
    add     t2, t2, t6     # d = d + t6 (sum products)

    addi    t1, t1, 1      # Increment column index c
    addi    a1, a1, 4      # Move to the next element in the matrix (next column)
    addi    a2, a2, 4      # Move to the next element in the vector (next component)
    j       2b

2:  
    addi    a2, a2, -12    # Reset vector pointer to the beginning of vector (after last update)
    
    sw      t2, 0(a0)      # Store the result d in dst[r] (integer result)
    addi    t0, t0, 1      # Increment row index r
    addi    a0, a0, 4      # Move to the next element in the destination array
    j       1b

1:  
    ret
