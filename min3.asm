%include "in_out.asm"

section .data
msg_res db 'Минимальное значение: ',0

a dd 52
b dd 33
c dd 40

section .bss
min resd 1       ; переменная для хранения минимума

section .text
global _start

_start:
    ; начальный минимум = a
    mov eax, [a]
    mov ebx, [b]
    mov ecx, [c]

    ; сравнение с b
    cmp eax, ebx
    jle check_c
    mov eax, ebx

check_c:
    ; сравнение с c
    cmp eax, ecx
    jle save
    mov eax, ecx

save:
    mov [min], eax        ; сохранили минимум

    ; вывод строки
    mov eax, msg_res
    call sprint

    ; вывод числа
    mov eax, [min]
    call iprintLF

    call quit
