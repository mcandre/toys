format MS COFF

public main as '_main'

extrn '_puts' as puts
extrn '_exit' as exit

; code section
section '.text' code readable executable

main:

include 'hello.inc'

section '.data' data readable writeable

_msg db "Hello World!"
