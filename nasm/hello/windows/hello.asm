bits 32

section .data

msg db "Hello World!", 13, 10, 0
len equ $-msg

section .bss

stdouthandle equ -11
stdout resd 1
charswritten resd 1

section .text

global Start
extern GetStdHandle
extern WriteConsoleA
extern ExitProcess

Start:
  push stdouthandle
  call GetStdHandle
  mov [stdout], eax
  add esp, 4 * 1

  push 0
  push charswritten
  push len
  push msg
  push dword [stdout]
  call WriteConsoleA
  add esp, 4 * 5

  push 0
  call ExitProcess
