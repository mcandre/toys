[bits 32]

section .data

msg db "Hello World!", 13, 10, 0
len equ $-msg

section .bss

stdout resd 1
charswritten resd 1

section .text

global Start
extern GetStdHandle
extern WriteConsoleA
extern ExitProcess

Start:

push -11			; get stdout
call GetStdHandle
mov [stdout], eax
add esp, 4			; clear stack (4 * 1 argument)

push 0				; null
push charswritten	; [chars written]
push len
push msg
push dword [stdout]
call WriteConsoleA
add esp, 20			; clear stack (4 * 5 arguments)

push 0
call ExitProcess