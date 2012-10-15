.data

msg: .string "Hello World!\n"
len: .long . - msg

.equ sys_exit, 1
.equ sys_write, 4
.equ stdout, 1
.equ kernel, 0x80

.text

.globl start

start:
	push $14
	push $msg
	push $stdout
	movl $sys_write, %eax
	subl $4, %esp
	int $kernel
	addl $4 + $4 * 3, %esp

	push $0
	movl $sys_exit, %eax
	sub $4, %esp
	int $kernel