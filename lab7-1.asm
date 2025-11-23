; lab7-1.asm
; Демонстрация безусловных и условных переходов

%include "in_out.asm"

section .data
msg1 db 'Сообщение 1', 0
msg2 db 'Сообщение 2', 0
msg3 db 'Сообщение 3', 0

section .text
global _start

_start:
    mov eax, msg1
    call sprintLF

    jmp label2          ; безусловный переход

label1:
    mov eax, msg2
    call sprintLF
    jmp finish

label2:
    mov eax, msg3
    call sprintLF

    jmp label1          ; переход к label1

finish:
    call quit
