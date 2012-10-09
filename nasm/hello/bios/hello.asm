bits 16
org 0x7c00

jmp start

msg db "Hello World!", 13, 10, 0

clear:
	mov ah, 0x0f	; get video mode
	mov al, 0x00	; reset register
	int 0x10		; get video mode
	mov ah, 0x00	; set video mode
	int 0x10		; reset screen
	mov ah, 0x02	; set cursor position
	mov bh, 0x00	; page 0
	mov dh, 0x00	; row 0
	mov dl, 0x00	; col 0
	int 0x10		; set cursor position
	ret

; puts wrapper
%macro biosprint 1
	mov si, %1
	call puts
%endmacro

; print a string - expects that SI is pointing at our string
puts:
	lodsb
	cmp BYTE al, 0
	je puts_end
		call putc
		jmp puts
	puts_end:
		ret

; print a char to screen - used by puts
putc:
	mov ah, 0x0e
	mov bx, 0x11
	int 0x10
	ret

start:

call clear
biosprint msg

times 510 - ($ - $$) db 0
dw 0xaa55
