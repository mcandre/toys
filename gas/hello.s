/*

Assemble:

gcc -o hello hello.s

Run:

./hello

*/

.data

LC0:
	.ascii "Hello World!\n\0"

.text
	.global _main

_main:
	pushl %ebp
	movl %esp, %ebp
	subl $4, %esp
	movl $LC0, (%esp)
	call _printf
	movl $0, %eax
	leave
	ret
