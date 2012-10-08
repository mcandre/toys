.globl Start

.data

msg: .asciz "Hello World!\n"
.equ len, .-msg

.equ stdouthandle, -11
stdout: .int 0
charswritten: .int 0

.text

Start:

push $stdouthandle
call GetStdHandle
mov %eax, stdout

push $0
push $charswritten
push $len
push $msg
push stdout
call WriteConsoleA

push $0
call ExitProcess