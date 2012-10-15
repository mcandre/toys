.global start

.data

.equ stdout, 1

.equ sys_write, 4
.equ sys_exit, 1

.equ kernel, 0x80

msg: .asciz "Hello World!\n"
.equ len, .-msg

.text

start:
	push $len
	push $msg
	push $stdout
	mov $sys_write, %eax
	sub $4, %esp
	int $kernel
	add $4 + $4 * $3, %esp

	push $0
	mov $sys_exit, %eax
	sub $4, %esp
	int $kernel
