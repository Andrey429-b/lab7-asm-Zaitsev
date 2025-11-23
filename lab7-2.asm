; lab7-2.asm
; Определение и вывод максимума из трех чисел A, B, C

%include "in_out.asm"

section .data
msgB db 'Введите B: ',0
msgR db 'Наибольшее число: ',0

A dd 20
C dd 50

section .bss
Bstr resb 10
Bval resd 1
max  resd 1

section .text
global _start

_start:
    ; ----- запрос B -----
    mov eax, msgB
    call sprint

    mov ecx, Bstr
    mov edx, 10
    call sread

    ; ----- B → число -----
    mov eax, Bstr
    call atoi
    mov [Bval], eax

    ; ----- max = A -----
    mov eax, [A]

    ; ----- сравнение с C -----
    mov ebx, [C]
    cmp eax, ebx
    jge compare_B
    mov eax, ebx

compare_B:
    ; ----- сравнение с B -----
    mov ebx, [Bval]
    cmp eax, ebx
    jge done
    mov eax, ebx

done:
    mov [max], eax

    ; ----- вывод результата -----
    mov eax, msgR
    call sprint

    mov eax, [max]
    call iprintLF

    call quit
