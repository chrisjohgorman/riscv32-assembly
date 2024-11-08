
# https://marz.utk.edu/my-courses/cosc230/book/example-risc-v-assembly-programs/

CFLAGS=--static -L/opt/riscv/sysroot/usr/lib -L/opt/riscv/lib/gcc/riscv32-unknown-linux-gnu/14.2.0
LDFLAGS=-lc -lgcc

PROGRAMS=stringcopy strlen cfunc strncpy strrev arraysum bubsort distance minmax binsearch matmul addll

all: $(PROGRAMS)

.PHONY: clean

strlen.o: strlen.s
	$(AS) -mabi=ilp32 -march=rv32i strlen.s -o strlen.o

strlen: strlen.o strlen.c
	$(CC) $(CFLAGS) strlen.o strlen.c $(LDFLAGS) -o strlen 

stringcopy.o: stringcopy.s
	$(AS) -mabi=ilp32 -march=rv32i stringcopy.s -o stringcopy.o

stringcopy: stringcopy.o stringcopy.c
	$(CC) $(CFLAGS) stringcopy.o stringcopy.c $(LDFLAGS) -o stringcopy

strncpy.o: strncpy.s
	$(AS) -mabi=ilp32 -march=rv32i strncpy.s -o strncpy.o

strncpy: strncpy.o strncpy.c
	$(CC) $(CFLAGS) strncpy.o strncpy.c $(LDFLAGS) -o strncpy

strrev.o: strrev.s
	$(AS) -mabi=ilp32 -march=rv32i strrev.s -o strrev.o

strrev: strrev.o strrev.c
	$(CC) $(CFLAGS) strrev.o strrev.c $(LDFLAGS) -o strrev

arraysum.o: arraysum.s
	$(AS) -mabi=ilp32 -march=rv32i arraysum.s -o arraysum.o

arraysum: arraysum.o arraysum.c
	$(CC) $(CFLAGS) arraysum.o arraysum.c $(LDFLAGS) -o arraysum

bubsort.o: bubsort.s
	$(AS) -mabi=ilp32 -march=rv32i bubsort.s -o bubsort.o

bubsort: bubsort.o bubsort.c
	$(CC) $(CFLAGS) bubsort.o bubsort.c $(LDFLAGS) -o bubsort

# FIXME move all code to use the compiler riscv64-elf-g++ or riscv64-elf-gcc
#distance.o: distance.s
#	$(AS) -mabi=ilp32 -march=rv32if distance.s -o distance.o

distance: distance.s distance.cpp
	riscv64-elf-g++ -L/usr/riscv64-elf/lib/rv32imafc -march=rv32imafc -mabi=ilp32f -Wl,-m,elf32lriscv distance.s distance.cpp $(LDFLAGS) -lm -o distance

minmax.o: minmax.s
	$(AS) -mabi=ilp32 -march=rv32im minmax.s -o minmax.o

minmax: minmax.o minmax.c
	$(CC) $(CFLAGS) minmax.o minmax.c $(LDFLAGS) -o minmax 

addll.o: addll.s
	$(AS) -mabi=ilp32 -march=rv32i addll.s -o addll.o

addll: addll.o addll.c
	$(CC) $(CFLAGS) addll.o addll.c $(LDFLAGS) -o addll 

callc.o: callc.s
	$(AS) -mabi=ilp32 -march=rv32i callc.s -o callc.o

cfunc.o: cfunc.cpp
	$(CXX) -c cfunc.cpp -o cfunc.o

cfunc: callc.o cfunc.o
	$(CC) $(CFLAGS) callc.o cfunc.o $(LDFLAGS) -o cfunc

binsearch.o: binsearch.s
	$(AS) -mabi=ilp32 -march=rv32i binsearch.s -o binsearch.o

binsearch: binsearch.o binsearch.c
	$(CC) $(CFLAGS) binsearch.o binsearch.c $(LDFLAGS) -o binsearch 

matmul.o: matmul.s
	$(AS) -mabi=ilp32 -march=rv32im matmul.s -o matmul.o

matmul: matmul.o matmul.c
	$(CC) $(CFLAGS) matmul.o matmul.c $(LDFLAGS) -o matmul 

clean: 
	rm -f *.o $(PROGRAMS)

