[bits 32]

section .data

msg: db "Hello World!", 0

section .text

global start
extern puts

start:

; setup stack frame
push ebp
mov ebp, esp

push msg
call puts
add esp, 4

; tear down stack frame
mov esp, ebp
pop ebp

mov eax, 0
leave
ret
