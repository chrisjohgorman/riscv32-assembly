.section .text
.global addll
addll:
    # a0 = list
    # a1 = element
    # LL structure
    # Name       Offset       Size (bytes)
    # data       0            1
    # next       4            4

    sw      a0, 4(a1)     # element->next = list
    mv      a0, a1        # set a0 to return element instead of list
    ret                   # return via return address register
