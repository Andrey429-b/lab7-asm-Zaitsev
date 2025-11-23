; fx.asm — вычисление f(x) для варианта 8
; f(x) = 3a,    если a < 3
; f(x) = x + 1, если a >= 3

%include "in_out.asm"

section .data
msgX db 'Введите x: ',0
msgA db 'Введите a: ',0
msgF db 'Значение f(x): ',0

section .bss
x_str resb 10
a_str resb 10
x_val resd 1
a_val resd 1
f_val resd 1

section .text
global _start

_start:
    ; --- ввод x ---
    mov eax, msgX
    call sprint
    mov ecx, x_str
    mov edx, 10
    call sread
    mov eax, x_str
    call atoi
    mov [x_val], eax

    ; --- ввод a ---
    mov eax, msgA
    call sprint
    mov ecx, a_str
    mov edx, 10
    call sread
    mov eax, a_str
    call atoi
    mov [a_val], eax

    ; --- вычисление f(x) ---
    mov eax, [a_val]
    cmp eax, 3
    jl  less3          ; если a < 3 → ветка 3a

    ; ветка a >= 3: f = x + 1
    mov eax, [x_val]
    add eax, 1
    jmp save

less3:
    ; ветка a < 3: f = 3a
    mov eax, [a_val]
    imul eax, eax, 3

save:
    mov [f_val], eax

    ; --- вывод результата ---
    mov eax, msgF
    call sprint
    mov eax, [f_val]
    call iprintLF

    call quit
