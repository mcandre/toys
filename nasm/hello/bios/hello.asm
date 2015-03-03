bits 16
org 7c00h

jmp start

bios equ 10h

msg db "Hello World!", 13, 10, 0

clear:
  mov ah, 0fh  ; get video mode
  mov al, 00h  ; reset register
  int bios  ; get video mode
  mov ah, 00h  ; set video mode
  int bios  ; reset screen
  mov ah, 02h  ; set cursor position
  mov bh, 00h  ; page 0
  mov dh, 00h  ; row 0
  mov dl, 00h  ; col 0
  int bios  ; set cursor position
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
  mov ah, 0eh
  mov bx, 11h
  int bios
  ret

start:
  call clear
  biosprint msg

  times 510 - ($ - $$) db 0
  dw aa55h
