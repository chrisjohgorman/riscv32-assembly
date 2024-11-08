.section .text
.global distance
distance:
    # a0 = Coordinate &from
    # a1 = Coordinate &to
    # Coordinate structure
    # Name    Offset     Size (bytes)
    # x       0          4
    # y       4          4
    # Total size = 8 bytes
	flw   ft0, 0(a0)      # ft0 = from.x
    flw   ft1, 4(a0)      # ft1 = from.y
    flw   ft2, 0(a1)      # ft2 = to.x
    flw   ft3, 4(a1)      # ft3 = to.y
	
    fsub.s  ft0, ft2, ft0 # ft0 = to.x - from.x
    fsub.s  ft1, ft3, ft1 # ft1 = to.y - from.y
    fmul.s  ft0, ft0, ft0 # ft0 = ft0 * ft0
    fmul.s  ft1, ft1, ft1 # ft1 = ft1 * ft1
    fadd.s  ft0, ft0, ft1 # ft0 = ft0 + ft1
    fsqrt.s fa0, ft0      # fa0 = sqrt(ft0)
    # Return value goes in fa0
    ret                   # Return
