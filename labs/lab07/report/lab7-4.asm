%include 'in_out.asm'
section .data
msg1 db 'Введите A: ',0h
msg2 db 'Введите X: ',0h
msg3 db "Наибольшее число: ",0h
section .bss
max resb 10
A resb 10
X resb 10
section .text
global _start
_start:
; ---------- Вывод сообщения 'Введите A: '
mov eax,msg1
call sprint
; ---------- Ввод 'A'
mov ecx,A
mov edx,10
call sread
; ---------- Преобразование 'A' из символа в число
mov eax,A
call atoi ; Вызов подпрограммы перевода символа в число
mov [A],eax ; запись преобразованного числа в 'A'
; ---------- Вывод сообщения 'Введите X: '
mov eax,msg2
call sprint
; ---------- Ввод 'X'
mov ecx,X
mov edx,10
call sread
; ---------- Преобразование 'X' из символа в число
mov eax,X
call atoi ; Вызов подпрограммы перевода символа в число
mov [X],eax ; запись преобразованного числа в 'X'
; ---------- Changings
mov ebx, [X]
mov edx, [A]
cmp ebx, edx
jb Haha
jmp Hoho
Haha:
mov eax, [X]
sub eax, [A]
mov ebx,2
mul ebx
call iprintLF
call quit
Hoho:
mov eax, 15
call iprintLF
call quit

