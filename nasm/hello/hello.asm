section .data

msg: db "Hello World!"

section .text

global main
extern puts

main:

push msg
call puts

leave
mov eax, 0
ret
