.data

msg: .ascii "Hello World!\0"

.text

.global _main

_main:

pushl $msg
call _puts

leave
movl $0, %eax
ret
