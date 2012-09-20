/*

Assemble:

gcc -o hello hello.s

Run:

./hello

*/

.data

msg:
	.ascii "Hello World!\n\0"

.text
	.global _main

_main:
	pushl %ebp
	movl %esp, %ebp
	subl $4, %esp
	movl $msg, (%esp)
	call _printf
	movl $0, %eax
	leave
	ret
