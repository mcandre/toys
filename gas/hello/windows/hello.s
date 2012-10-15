.global Start

.data

.equ stdouthandle, -11
stdout: .int 0
charswritten: .int 0

msg: .asciz "Hello World!\n"
.equ len, .-msg

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