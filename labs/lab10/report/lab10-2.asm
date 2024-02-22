%include 'in_out.asm'
SECTION .data
msg db 'Имя пожалуйста', 0
filename: db 'name.txt',0
my_name: db 'Здорова, я есть ',0
SECTION .bss
X: resb 80 ; переменная для вводимой строки
SECTION .text
global _start
_start:
; --- Печать сообщения `msg`
mov eax,msg
call sprint
; ---- Запись введеной с клавиатуры строки в `contents`
mov ecx, X
mov edx, 80
call sread
; --- Открытие существующего файла (`sys_open`)
mov ecx, 0777o
mov ebx, filename
mov eax, 8
int 80h
; --- Запись дескриптора файла в `esi`
mov esi, eax
; --- Расчет длины введенной строки
mov eax, my_name ; в `eax` запишется количество
call slen ; введенных байтов
; --- Записываем в файл `contents` (`sys_write`)
mov edx, eax
mov ecx, my_name
mov ebx, esi
mov eax, 4
int 80h
; --- Закрываем файл (`sys_close`)
mov ebx, esi
mov eax, 6
int 80h
call quit
