.section .rodata
enter_prompt: .asciz "Enter a, b, and c: "
scan: .asciz "%d %d %d"
result_out: .asciz "Result = %d\n"

.section .text
.global main
main:
    addi    sp, sp, -16     # Allocate 16 bytes from the stack
    sw      ra, 0(sp)       # Since we are making calls, we need the original ra

    # Prompt the user first
    la      a0, enter_prompt 
    call    printf

    # We've printed the prompt, now wait for user input
    la      a0, scan
    addi    a1, sp, 4        # Address of a is sp + 4
    addi    a2, sp, 8        # Address of b is sp + 8
    addi    a3, sp, 12       # Address of c is sp + 12
    call    scanf

    # Now all of the values are in memory, load them
    # so we can jal ra, the c function.
    lw      a0, 4(sp)
    lw      a1, 8(sp)
    lw      a2, 12(sp)
    call    cfunc

    # The result should be in a0, but that needs to be
    # the second parameter to printf.
    mv      a1, a0
    la      a0, result_out
    call    printf

    # Restore original RA and return
    lw      ra, 0(sp)
    addi    sp, sp, 16       # Always deallocate the stack!
    ret
