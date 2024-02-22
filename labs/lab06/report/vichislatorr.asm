%include 'in_out.asm'
SECTION .data
msg: DB 'Введите переменную: ',0
rem: DB 'Результат: ',0
SECTION .bss
x: RESB 80
SECTION .text
GLOBAL _start
_start:
mov eax, msg
call sprintLF
mov ecx, x
mov edx, 80
call sread
mov eax,x ; вызов подпрограммы преобразования
call atoi ; ASCII кода в число, `eax=x`
xor edx,edx
mov ebx,9
mul ebx
add eax, -8
xor edx, edx
mov ebx, 8
div ebx
mov ebx, eax
mov eax, rem
call sprint
mov eax,ebx
call iprintLF
call quit
