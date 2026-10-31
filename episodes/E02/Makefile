# Makefile - build and run exit42 with one command
exit42: exit42.o
	ld exit42.o -o exit42

exit42.o: exit42.asm
	nasm -f elf64 -g -F dwarf exit42.asm -o exit42.o

run: exit42
	./exit42; echo "exit code: $$?"

clean:
	rm -f exit42 exit42.o
