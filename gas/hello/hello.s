.data

msg: .ascii "Hello World!\0"

.text

.globl _start

_start:

push $msg
call _puts
add $4, %esp

push $0
call _exit
